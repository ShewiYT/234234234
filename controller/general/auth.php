<?php
$this->title = 'Вход на сайт';


if (!empty($_GET['action']) and $_GET['action'] == 'logout'):
	unset($_SESSION['auth']);
	header('Location: /main/');
	exit;
endif;

if (!empty($_SESSION['auth'])):
	header('Location: /shops/');
	exit;
endif;

$tk = new token();

$pw = new password(); // Инициализируем чекер пароля
$check_values = new filter();

$err[0] = '';
$err[1] = '';
$err[2] = '';
$err[3] = '';
$err[4] = '';
$err[5] = '';

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	$check_values->check('login','post','regexp','~^[A-Za-z0-9]{1,20}$~') and 
	$check_values->check('password','post','regexp','~^[A-Za-z0-9]{1,20}$~') and
	$check_values->check('secretkey','post','regexp','~^[A-Za-z0-9]{1,20}$~')
	):
	
	if ($_SESSION['secpic'] != strtolower($_POST['secpic'])):
		$err[5] = 'Вы ввели неверный код с картинки!';
	else:
	
	$user = $db->row("SELECT id, login, password, secret_key FROM user WHERE login = ?", array($_POST['login'])); // Проверяем существование пользователя

	if ($user):
		$check = $pw->check($_POST['password'],$user['password']);
		if ($check):
			$check_secret = $pw->check($_POST['secretkey'],$user['secret_key']);
				if ($check_secret):
					// Выполняем авторизацию
					$_SESSION['auth']['id'] = $user['id'];
					//Заносим данные о входе в базу
					$date = date("Y-m-d H:i:s");
					$work_id = 'Авторизация';
					$insertrow = $db->insert("INSERT INTO user_log (work, user_id, data, ip, browser) VALUES (?, ?, ?, ?, ?)", array($work_id, $_SESSION['auth']['id'], $date, $_SERVER['REMOTE_ADDR'], $_SERVER['HTTP_USER_AGENT']));
					header('Location: /shops/');
					exit;
				else:
					$err[3] = '<div class="input-error error">Неверное кодовое слово</div>';
				endif;

		else:
			$err[2] = '<div class="input-error error">Неверный логин или пароль</div>';
		endif;
	else:
		$err[2] = '<div class="input-error error">Неверный логин или пароль</div>';
	endif;

endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):

	if (empty($_POST['login'])):
		$err[0] = '<div class="input-error error">Введите логин</div>';
	endif;
	
	if (empty($_POST['secretkey'])):
		$err[4] = '<div class="input-error error">Введите кодовое слово</div>';
	endif;
	
	if (empty($_POST['password'])):
		$err[1] = '<div class="input-error error">Пароль должен содержать минимум 6 символов</div>';
	endif;

endif;
endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/auth.tpl';