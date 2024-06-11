<?php
$fk_merchant_id = MERCH_ID;
$fk_merchant_key = SECRET_1;
$radnom = rand(0,999999);

$this->title = 'Создание магазина';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$err[0] = '';
$err[1] = '';



$tk = new token();

$check_values = new filter();


// Создание
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	$check_values->check('alias','post','regexp','~^[a-z0-9-]{3,15}$~') and 
	$check_values->check('period','post','int',array('min' => 1, 'max' => 12)) and 
	$check_values->check('paymethod','post','regexp','~^(wmr)|(wmz)|(qiwi)|(freekassa)$~') and 
	$subalias = $_POST['subalias'] and
	$_POST['alias'] != 'domain'
	):
	
	if ($subalias == '.rentshops.ru') {
		$get_shop_pay = $db->row("SELECT * FROM shop WHERE domain = ?", array($_POST['alias']));
		$get_shop_notpay = $db->row("SELECT * FROM shop_payments WHERE domain = ? AND status = 'Не оплачен'", array($_POST['alias']));
	}
	else {
		$countt = substr_count($subalias, ".");
		if ($countt != '1'):
			die('Поддомен 3-его уровня, кроме стандартного, использовать нельзя!');
		endif;
		$get_shop_pay = $db->row("SELECT * FROM shop WHERE domain = ?", array($_POST['alias'].$subalias));
		$get_shop_notpay = $db->row("SELECT * FROM shop_payments WHERE domain = ? AND status = 'Не оплачен'", array($_POST['alias'].$subalias));
	}
	
	if (WM_PAY != 1 and ($_POST['paymethod'] == 'wmz' or $_POST['paymethod'] == 'wmr')):
		die('Выберите другой способ оплаты');
		//header('Location: /');
		//exit;
	endif;

	if (QIWI_PAY != 1 and $_POST['paymethod'] == 'qiwi'):
		//header('Location: /');
		//exit;
		die('Выберите другой способ оплаты');
	endif;


	if (!$get_shop_pay and !$get_shop_notpay):


		// Рассчёт стоимости
		if ($_POST['period'] > 0 and $_POST['period'] < 3):
			$cost_per_mounth = $cost[1];
		elseif ($_POST['period'] > 2 and $_POST['period'] < 6):
			$cost_per_mounth = $cost[3];
		elseif ($_POST['period'] > 5):
			$cost_per_mounth = $cost[6];
		endif;

		$cost_per_count = $cost_per_mounth * $_POST['period'];

		if ($_POST['paymethod'] == 'wmr' or $_POST['paymethod'] == 'qiwi' or $_POST['paymethod'] == 'freekassa'):
			$sum = number_format($cost_per_count, 2, '.', '');
		elseif ($_POST['paymethod'] == 'wmz'):
			$sum = number_format($cost_per_count / $cost['dollar'], 2, '.', '');
		endif;
		// Рассчёт стоимости
		if ($subalias == '.rentshops.ru') {
			if ($_POST['paymethod'] == 'freekassa') {
				$hash = md5($fk_merchant_id.":".$sum.":".$fk_merchant_key.":".$_SESSION['auth']['id']);
				$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Регистрация', 'Не оплачен', $_POST['alias'], 'F-K'));
				die('http://www.free-kassa.ru/merchant/cash.php?m='.$fk_merchant_id.'&oa='.$sum.'&s='.$hash.'&o='.$_SESSION['auth']['id'].'&us_account='.$_SESSION['auth']['id'].'&us_type=reg&us_idorder='.htmlspecialchars($insertrow).'');
				//exit;
			} else {
				$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Регистрация', 'Не оплачен', $_POST['alias'], $_POST['paymethod']));
				die('http://rentshops.ru/shops/order/'.$insertrow.'/');
				//exit;
			}
		}
		else {
			$countt = substr_count($subalias, ".");
			if ($countt != '1'):
				die('Поддомен 3-его уровня, кроме стандартного, использовать нельзя!');
			endif;
			if ($_POST['paymethod'] == 'freekassa') {
				$hash = md5($fk_merchant_id.":".$sum.":".$fk_merchant_key.":".$_SESSION['auth']['id']);
				$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Регистрация', 'Не оплачен', $_POST['alias'].$subalias, 'F-K'));
				die('http://www.free-kassa.ru/merchant/cash.php?m='.$fk_merchant_id.'&oa='.$sum.'&s='.$hash.'&o='.$_SESSION['auth']['id'].'&us_account='.$_SESSION['auth']['id'].'&us_type=reg&us_idorder='.htmlspecialchars($insertrow).'');
				//exit;
			} else {
				$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Регистрация', 'Не оплачен', $_POST['alias'].$subalias, $_POST['paymethod']));
				die('http://rentshops.ru/shops/order/'.$insertrow.'/');
				//exit;
			}
		}

	elseif ($get_shop_pay):
		die('Мы сожалеем, но такой домен уже занят. Попробуйте подобрать другой.');
		/*$err[0] = '<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Мы сожалеем, но такой домен уже занят. Попробуйте подобрать другой.
			</div>'; */
	endif;

	if ($get_shop_notpay):
	die('Такой домен уже существует, но еще не оплачен. Попробуйте подождать и через некоторое время повторить попытку.');
		/*$err[1] = '<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Такой домен уже существует, но еще не оплачен. Попробуйте подождать и через некоторое время повторить попытку.
			</div>'; */
	endif;

else:

die('Заполните необходимые поля!');

endif;
// Создание


//$token = $tk->input();
//require $_SERVER["DOCUMENT_ROOT"].'/template/general/shopscreate.tpl';