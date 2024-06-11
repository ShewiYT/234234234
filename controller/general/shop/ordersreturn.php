<?php
$this->title = 'Возврат средств за невыданный товар';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if (empty($_GET['id'])):
	header('Location: /shops/settings/'.$_GET['shop'].'/orders/');
	exit;
endif;

$tk = new token();
$check_values = new filter();


$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

$get_order = $db->row("SELECT * FROM orders WHERE id = ? AND id_shop = ?", array($_GET['id'], $get_shop['id']));

$get_goods = $db->row("SELECT * FROM goods WHERE id = ? AND id_shop = ?", array($get_order['id_goods'], $get_shop['id']));

$get_return = $db->row("SELECT * FROM orders_return WHERE id_orders = ? AND status = 'Не обработано'", array($get_order['id']));


if (empty($get_return)):
	header('Location: /shops/settings/'.$_GET['shop'].'/orders/');
	exit;
endif;



if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):


	$db->update("UPDATE orders_return SET status = ? WHERE id = ?", array("Обработано", $get_return['id']));
	header('Location: /shops/settings/'.$_GET['shop'].'/orders/');

endif;






$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/ordersreturn.tpl';