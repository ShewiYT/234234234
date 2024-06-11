<?php
$this->title = 'Блокировка пользователей по IP';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();
$check_values = new filter();

$err[0] = '';

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));


// Формируем заявку на поднятие магазина
if (
  !empty($_POST['token']) and 
  $tk->check($_POST['token']) and 
  $check_values->check('ip','post','regexp','~^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$~')
  ):

	if (empty($_POST['reason'])):
		$reason = '-';
	else:
		$reason = $_POST['reason'];
	endif;


  $insertrow = $db->insert("INSERT INTO ban (id_shop, ip, comment) VALUES (?, ?, ?)", array($get_shop['id'], $_POST['ip'], $reason));
	if ($insertrow):
		$err[0] = '<div class="alert alert-success">
		<button class="close" data-dismiss="alert" type="button">×</button>Доступ данному IP-адресу к магазину был успешно запрещён!
		</div>';
	else:
		$err[0] = '<div class="alert alert-danger">
		<button class="close" data-dismiss="alert" type="button">×</button>Ошибка добавления IP-адреса!
		</div>';
	endif;

endif;
// Формируем заявку на поднятие магазина

$ban_list = $db->rows("SELECT * FROM ban WHERE id_shop = '".$get_shop['id']."'");

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/ban.tpl';