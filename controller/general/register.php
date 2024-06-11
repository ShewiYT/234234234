<?php
$this->title = 'Регистрация';

if (!empty($_SESSION['auth'])):
	header('Location: /shops/');
	exit;
endif;

$tk = new token();

$pw = new password();
$check_values = new filter();

$err[0] = '';
$err[1] = '';
$err[2] = '';
$err[3] = '';
$err[4] = '';
$err[5] = '';
$err[6] = '';
$err[7] = '';
$err[8] = '';
$err[9] = '';
$err[10] = '';
$err[11] = '';

	$registration_status = '1'; // Открытая или закрытая регистрация

if (!empty($_POST['token']) and $check_values->check('login','post','regexp','~^[A-Za-z0-9]{3,20}$~') and $check_values->check('password','post','regexp','~^[A-Za-z0-9]{6,20}$~') and $check_values->check('email','post','email') and $check_values->check('secretkey','post','regexp','~^[A-Za-z0-9]{6,20}$~') and !empty($_POST['secretkey']) and !empty($_POST['password']) and !empty($_POST['password2']) and $_POST['password'] == $_POST['password2'] and !empty($_POST['agree']) and $_POST['agree'] == 'on'):

	if ($_SESSION['secpic'] != strtolower($_POST['secpic'])):
		$err[11] = 'Вы ввели неверный код с картинки!';
	else:
	
	if ($registration_status == '0'):
		$err[10] = '<div class="input-error error">Регистрация временно закрыта</div>';
	else:
		$get_user = $db->row("SELECT login FROM user WHERE login = ?", array($_POST['login']));
		$get_email = $db->row("SELECT login FROM user WHERE email = ?", array($_POST['email']));


		if (!$get_user and !$get_email):
			$insertrow = $db->insert("INSERT INTO user (login, password, email, secret_key) VALUES (?, ?, ?, ?)", array($_POST['login'], $pw->gen($_POST['password']), $_POST['email'], md5($_POST['secretkey'])));

			$err[8] = 'reg_ok'; // Регистрация пройдена, выводим сообщение об этом
		elseif ($get_user):
			$err[6] = '<div class="input-error error">Такой логин уже используется</div>';
		endif;

		if ($get_email):
			$err[7] = '<div class="input-error error">Такой email уже используется</div>';
		endif;
	endif;
	endif;

endif;



if (!empty($_POST['token'])):

	if ($registration_status == '0'):
		$err[10] = '<div class="input-error error">Регистрация временно закрыта</div>';
	else:

	if (empty($_POST['login']) or strlen($_POST['login']) < 3):
		$err[0] = '<div class="input-error error">Логин не может быть менее 3 символов</div>';
	endif;
	
	if (empty($_POST['secretkey']) or strlen($_POST['secretkey']) < 6):
		$err[9] = '<div class="input-error error">Вы не ввели кодовое слово или его длина меньше 6 символов</div>';
	endif;
	
	if (empty($_POST['email'])):
		$err[1] = '<div class="input-error error">Неверно указан Email адрес</div>';
	endif;

	if (empty($_POST['password']) or strlen($_POST['password']) < 6):
		$err[2] = '<div class="input-error error">Пароль должен содержать минимум 6 символов</div>';
	elseif ($_POST['password'] != $_POST['password2']):
		$err[3] = '<div class="input-error error">Пароли не совпадают</div>';
	endif;

	if (empty($_POST['agree'])):
		$err[4] = '<div class="input-error error">Вы должны принять соглашение</div>';
	endif;
	
	endif;

foreach ($err as $key => $value) {
	if (!empty($value) and $key != 3 and $key != 6 and $key != 7):
		$err[5] = '<div class="input-error error">Заполните обязательные поля</div>';
		break;
	endif;
}


endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/register.tpl';