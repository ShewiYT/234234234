<?php
$this->title = 'Список заказов';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

if (!empty($_POST['id']) or !empty($_POST['purse'])):
	if (!empty($_POST['token']) and $tk->check($_POST['token'])):
		if (!empty($_POST['id'])):
			$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? AND orders.id = ? ORDER BY orders.id DESC LIMIT 50", array("replace" => array($get_shop['id'], $_POST['id'])));
		endif;
		
		if (!empty($_POST['purse']) and $check_values->check('purse','post','email')):
			$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? AND orders.email = ? ORDER BY orders.id DESC LIMIT 50", array("replace" => array($get_shop['id'], $_POST['purse'])));
		endif;
	endif;
else:
	// Простая выборка
		$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? ORDER BY orders.id DESC LIMIT 50", array("replace" => array($get_shop['id'])));
	// Простая выборка
endif;

// Определяем наличие возвратов
	foreach ($get_orders as $key => $value):
		$get_return = $db->row("SELECT count(*) as count FROM orders_return WHERE id_orders = ? AND status = 'Не обработано'", array($value['id_orders']));
		$get_orders[$key]['return'] = $get_return['count'];
	endforeach;
// Определяем наличие возвратов

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/orders.tpl';