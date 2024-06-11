<?php
$this->title = 'Настройки оплаты';
error_reporting(E_ALL);
ini_set("display_errors", 1);
if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$err[0] = '';
$err[97] = '';
$err[98] = '';
$err[99] = '';
$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
$get_qiwi = $db->row("SELECT * FROM payment_qiwi WHERE id_shop = ?", array($get_shop['id']));
$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
$get_freekassa = $db->row("SELECT * FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));

//Проверяем и устанавливаем Free-Kassa
if(
	!empty($_POST['token']) and
	$tk->check($_POST['token']) and
	!empty($_POST['id_shop_fk']) and
	!empty($_POST['secret1']) and
	!empty($_POST['secret2']) and
	$check_values->check('id_shop_fk','post','regexp','~^\+[0-9]{5,25}|[0-9]{5,25}$~') and
	$check_values->check('secret1','post','regexp','~^[A-Za-z0-9]{4,20}$~') and
	$check_values->check('secret2','post','regexp','~^[A-Za-z0-9]{4,20}$~')
	):
		if (!preg_match("/\./", $_GET['shop'])):
			$err[97] = '<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<h4><i class="icon fa fa-ban"></i> Внимание!</h4>
				Вы не можете подключить данный метод оплаты, так как Вы не подключили собственный домен к магазину.
				</div>';
		else:
			if($get_freekassa):
				$err[98] = '<div class="alert alert-warning alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<h4><i class="icon fa fa-warning"></i> Внимание!</h4>
				Данный магазин уже был подключен к Free-Kassa!
				</div>';
			else:
				$db->insert("INSERT INTO payment_freekassa (id_shop, id_shop_fk, secret1, secret2) VALUES (?, ?, ?, ?)", array($get_shop['id'], $_POST['id_shop_fk'], $_POST['secret1'], $_POST['secret2'])) or die('Error');
				$err[99] = '<div class="alert alert-success alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				<h4><i class="icon fa fa-check"></i> Внимание!</h4>
				Вы успешно подключили платёжную систему Free-Kassa.
				</div>';
				endif;
		endif;
endif;
//Проверяем и устанавливаем Free-Kassa

//Удаляем Free-Kassa
if (
	!empty($_GET['action']) and 
	$_GET['action'] == 'freekassa_del'
	):

	$db->delete("DELETE FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));
	header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
endif;
//Удаляем Free-Kassa

// Проверяем и устанавливаем qiwi
if (
	!$get_qiwi and
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	!empty($_POST['qiwi_password']) and 
	$check_values->check('qiwi_purse','post','regexp','~^\+[0-9]{5,25}|[0-9]{5,25}$~')
	):

	$qiwi_purse = str_replace("+", "", $_POST['qiwi_purse']);

	try
	{
		$qiwi = new QIWI($qiwi_purse,$_POST['qiwi_password'],'cookie.txt');
	    $auth_qiwi = $qiwi->check_qiwi($qiwi_purse,$_POST['qiwi_password']);
	} catch (Exception $e) {
	    
	    $auth_qiwi = false;
	    //echo 'Сообщение: '   . $e->getMessage() . '<br />';
	}


	// Авторизация пройдена, записываем в базу
	if ($auth_qiwi):
		$insert_qiwi = $db->insert("INSERT INTO payment_qiwi (id_shop, login, password) VALUES (?, ?, ?)", array($get_shop['id'], $qiwi_purse, $_POST['qiwi_password']));
		header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
	else:
		$err[0] = 'Неверный номер телефона или пароль';
	endif;
	// Авторизация пройдена, записываем в базу


endif;
// Проверяем и устанавливаем qiwi

// Удаляем qiwi
if (
	!empty($_GET['action']) and 
	$_GET['action'] == 'qiwi_del'
	):

	$db->delete("DELETE FROM payment_qiwi WHERE id_shop = ?", array($get_shop['id']));
	header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
endif;
// Удаляем qiwi



// Добавляем yandex
if (
	!$get_yandex and 
	!empty($_GET['action']) and 
	$_GET['action'] == 'add_yandex'
	):

	// Генерируем URL для авторизации
	$ym = new YandexMoney(YD_CLIENT_ID);
	$toke = $ym->authorizeUri(YD_CLIENT_ID,YD_REDIRECT_URI);
	$_SESSION['yd']['shop_id'] = $get_shop['id'];
	header('Location: '.$toke);
	exit;
	// Генерируем URL для авторизации

endif;
// Добавляем yandex

// Удаляем yandex
if (
	!empty($_GET['action']) and 
	$_GET['action'] == 'yandex_del'
	):

	$db->delete("DELETE FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
	header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
endif;
// Удаляем yandex

// Добавляем webmoney
if (
	!$get_webmoney and 
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	$check_values->check('wmid','post','regexp','~^[0-9]{12}$~') and 
	$check_values->check('wmz','post','regexp','~^Z[0-9]{12}$~') and 
	$check_values->check('wmr','post','regexp','~^R[0-9]{12}$~') and 
	!empty($_POST['wmpassword']) and 
	!empty($_FILES) and 
	$_FILES['keyfile']['type'] == 'application/octet-stream'
	):

	$wm = new webmoney();
	$key = $_FILES['keyfile']['tmp_name'];
	$check_login = $wm->checkwm($_POST['wmid'], $_POST['wmpassword'], $key, $_POST['wmr']); // Какой кошелёк не имеет разницы - это просто проверка авторизации

	if ($check_login):
		$upload = move_uploaded_file($_FILES['keyfile']['tmp_name'], $_SERVER['DOCUMENT_ROOT'].'/class/wm_keys/'.$_POST['wmid'].'_'.$get_shop['id'].'_key.kwm');
		if ($upload):
			$db->insert("INSERT INTO payment_webmoney (id_shop, wmid, wmr, wmz, key_pass) VALUES (?, ?, ?, ?, ?)", array($get_shop['id'], $_POST['wmid'], $_POST['wmr'], $_POST['wmz'], $_POST['wmpassword']));
			header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
		endif;
	else:
		$err[0] = '<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Не удалось авторизоваться в Вашем кошельке WebMoney. Проверьте данные.
	</div>';
	endif;

endif;
// Добавляем webmoney


// Удаляем webmoney
if (
	!empty($_GET['action']) and 
	$_GET['action'] == 'webmoney_del'
	):



	$db->delete("DELETE FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
	unlink($_SERVER['DOCUMENT_ROOT'].'/class/wm_keys/'.$get_webmoney['wmid'].'_'.$get_shop['id'].'_key.kwm');
	header('Location: /shops/settings/'.$_GET['shop'].'/payment/');
endif;
// Удаляем webmoney



$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/payment.tpl';