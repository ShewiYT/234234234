<?php
	if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
	endif;
	
	$tk = new token();
	
	$check_values = new filter();
	$pw = new password();
	
	$get_user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));
	
	// Обновление контактных данных
	if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):
	
	if (!empty($_POST['password']) and
	$check_values->check('password','post','regexp','~^[A-Za-z0-9]{4,20}$~') and 
	$check_values->check('newpassword','post','regexp','~^[A-Za-z0-9]{4,20}$~') and 
	$check_values->check('newpassword2','post','regexp','~^[A-Za-z0-9]{4,20}$~')
	):
	
	if (
	$pw->check($_POST['password'],$get_user['password']) and 
	$_POST['newpassword'] == $_POST['newpassword2']
	):
	
	//Заносим данные о смене пароля и обновляем данные юзера
	$date = date("Y-m-d H:i:s");
	$work_id = 'Смена пароля';
	$insertrow = $db->insert("INSERT INTO user_log (work, user_id, data, ip, browser) VALUES (?, ?, ?, ?, ?)", array($work_id, $_SESSION['auth']['id'], $date, $_SERVER['REMOTE_ADDR'], $_SERVER['HTTP_USER_AGENT']));
	
	$db->update("UPDATE user SET contacts = ? WHERE id = ?", array($_POST['icq'], $_SESSION['auth']['id']));
	$db->update("UPDATE user SET password = ? WHERE id = ?", array($pw->gen($_POST['newpassword']), $_SESSION['auth']['id']));
	die('<div class="alert alert-success">
	<button class="close" data-dismiss="alert" type="button">×</button>Ваш пароль был успешно изменён на <strong>'.$_POST['newpassword'].'</strong> и данные о Вас были обновлены!
	</div>');
	else:
	die('<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Возможно, Вы ошиблись при вводе старого пароля или подтверждения нового!
	</div>');
	endif;
	else:
	if (!empty($_POST['icq']) and $check_values->check('icq','post','regexp','~^[A-Za-z0-9(.)]{4,20}$~')):
	$db->update("UPDATE user SET contacts = ? WHERE id = ?", array($_POST['icq'], $_SESSION['auth']['id']));
	die('<div class="alert alert-success">
	<button class="close" data-dismiss="alert" type="button">×</button>Данные о Вас были успешно обновлены!
	</div>');
	else:
	die('<div class="alert alert-success">
	<button class="close" data-dismiss="alert" type="button">×</button>Обновление данных не требуется
	</div>');
	endif;
	endif;
	
endif;
// Обновление контактных данных