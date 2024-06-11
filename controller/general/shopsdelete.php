<?php
$this->title = 'Удаление магазина';


if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$err[0] = '';
$err[1] = '';
$err[2] = '';
$err[3] = '';

$get_shops = $db->rows("SELECT * FROM shop WHERE id_user = ?", array("replace" => array($_SESSION['auth']['id'])));

if (!$get_shops):
	header('Location: /shops/');
	exit;
endif;

$tk = new token();
$pw = new password(); // Инициализируем чекер
$check_values = new filter();


// Удаление
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	!empty($_POST['secretkey']) and 
	$check_values->check('secretkey','post','regexp','~^[A-Za-z0-9]{6,20}$~')
	//$check_values->check('deletesite','post','regexp','~^[a-z0-9-(.)]{3,15}$~')
	):
	
	$user_secret = $db->row("SELECT secret_key FROM user WHERE id = ?", array($_SESSION['auth']['id']));
	if($user_secret):
		$check_secret = $pw->check($_POST['secretkey'],$user_secret['secret_key']);
		if ($check_secret):
			if(!empty($_POST['deletesite'])):
				//Проверяем является ли этот магазин собственностью юзера, который хочет его удалить
				$get_shop_delete = $db->row("SELECT * FROM `shop` WHERE `id_user` = ? AND domain = ?", array($_SESSION['auth']['id'], $_POST['deletesite']));
				if ($get_shop_delete['domain'] == $_POST['deletesite']):
					$delete_shop = $db->delete("DELETE FROM shop WHERE domain = ?", array($_POST['deletesite']));
					die('Выбранный Вами магазин был успешно удален!');
				//Если нет, то выдаем ошибку.
				else:
					die('Мы сожалеем, но Вы не сможете удалить этот магазин, так как он не Ваш или его не существует вообще.');
				endif;
			endif;
		else:
		die('Мы сожалеем, но Вы не сможете удалить этот магазин, так как Вы ввели неверное кодовое слово.');
		endif;
	endif;
		

endif;
// Удаление
if (!empty($_POST['token']) and $tk->check($_POST['token'])):
	if(empty($_POST['secretkey'])):
		die('Введите кодовое слово, указанное при регистрации аккаунта');
	endif;
endif;
		


//$token = $tk->input();
//require $_SERVER["DOCUMENT_ROOT"].'/template/general/shopsdelete.tpl';