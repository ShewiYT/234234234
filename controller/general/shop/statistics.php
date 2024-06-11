<?php
$this->title = 'Статистика вашего магазина';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$get_shop = $db->row('SELECT * FROM shop WHERE domain = ? AND id_user = ?', array($_GET['shop'], $_SESSION['auth']['id']));
$get_template = $db->row('SELECT * FROM template WHERE id_shop = ?', array($get_shop['id']));

$tk = new token();
$check_values = new filter();

$err[6] = '';
$err[7] = '';
$err[8] = '';
$err[9] = '';

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	$check_values->check('working','post','float',array('min' => 1, 'max' => 2))
	):
		if ($get_shop['status'] == 'Заблокирован'):
			header("Location: ".$_SERVER["REQUEST_URI"]);
			exit;
		else:
			if ($_POST['working'] == '2'):
				$working = $db->update("UPDATE shop SET status = 'Работает' WHERE id = ?", array($get_shop['id']));
				header("Location: ".$_SERVER["REQUEST_URI"]);
				exit;
			endif;
	
			if ($_POST['working'] == '1'):
				if (!empty($_POST['cause']) and $check_values->check('cause','post','regexp','#^([A-zА-я \-:]*)$#ui')):
					$power = $db->update("UPDATE shop SET status = ?, causeoff = ? WHERE id = ?", array('Выключен', $_POST['cause'], $get_shop['id']));
					header("Location: ".$_SERVER["REQUEST_URI"]);
					exit;
				else:
					$working = $db->update("UPDATE shop SET status = 'Выключен' WHERE id = ?", array($get_shop['id']));
					header("Location: ".$_SERVER["REQUEST_URI"]);
					exit;
				endif;
			endif;
		endif;
	endif;

//Количество всех товаров
$get_all_goods = $db->row("SELECT count(*) AS count FROM goods WHERE id_shop = ?", array($get_shop['id']));
if (!$get_all_goods['count']):
	$get_all_goods['count'] = 0;
endif;
//Количество всех товаров

//Количество всех покупок
$get_all_buys = $db->row("SELECT count(*) AS count FROM orders WHERE id_shop = ? AND status = ?", array($get_shop['id'], 'Оплачен'));
if (!$get_all_buys['count']):
	$get_all_buys['count'] = 0;
endif;
//Количество всех покупок

$get_goods = $db->rows("SELECT goods.name, goods.id FROM goods WHERE goods.id_shop = ?", array("replace" => array($get_shop['id'])));

// Вычисляем число непроданных товаров
foreach ($get_goods as $key => $value):
  $count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
  $get_goods[$key]['count'] = $count_q['count'];
endforeach;
// Вычисляем число непроданных товаров

$get_stat_full_rub = $db->row("SELECT sum(sum) as sum FROM orders WHERE id_shop = ? AND method != 'wmz' AND status = 'Оплачен'", array($get_shop['id']));
if (!$get_stat_full_rub['sum']):
	$get_stat_full_rub['sum'] = 0;
endif;

$get_stat_full_usd = $db->row("SELECT sum(sum) as sum FROM orders WHERE id_shop = ? AND method = 'wmz' AND status = 'Оплачен'", array($get_shop['id']));
if (!$get_stat_full_usd['sum']):
	$get_stat_full_usd['sum'] = 0;
endif;


$get_stat_mounth_rub = $db->row("SELECT SUM(orders.sum) AS sum FROM orders WHERE orders.id_shop = ? AND orders.method != 'wmz' AND orders.status = 'Оплачен' AND ADDDATE(orders.date, INTERVAL 30 DAY) > CURDATE()", array($get_shop['id']));
if (!$get_stat_mounth_rub['sum']):
	$get_stat_mounth_rub['sum'] = 0;
endif;

$get_stat_mounth_usd = $db->row("SELECT SUM(orders.sum) AS sum FROM orders WHERE orders.id_shop = ? AND orders.method = 'wmz' AND orders.status = 'Оплачен' AND ADDDATE(orders.date, INTERVAL 30 DAY) > CURDATE()", array($get_shop['id']));
if (!$get_stat_mounth_usd['sum']):
	$get_stat_mounth_usd['sum'] = 0;
endif;


$get_stat_day_rub = $db->row("SELECT SUM(orders.sum) AS sum FROM orders WHERE orders.id_shop = ? AND orders.method != 'wmz' AND orders.status = 'Оплачен' AND ADDDATE(orders.date, INTERVAL 1 DAY) > CURDATE()", array($get_shop['id']));
if (!$get_stat_day_rub['sum']):
	$get_stat_day_rub['sum'] = 0;
endif;

$get_stat_day_usd = $db->row("SELECT SUM(orders.sum) AS sum FROM orders WHERE orders.id_shop = ? AND orders.method = 'wmz' AND orders.status = 'Оплачен' AND ADDDATE(orders.date, INTERVAL 1 DAY) > CURDATE()", array($get_shop['id']));
if (!$get_stat_day_usd['sum']):
	$get_stat_day_usd['sum'] = 0;
endif;

if (!empty($_POST['id']) or !empty($_POST['purse'])):

	if (!empty($_POST['id'])):
		$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? AND orders.id = ? ORDER BY orders.id DESC LIMIT 5", array("replace" => array($get_shop['id'], $_POST['id'])));

	else:
		$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? AND orders.purse = ? ORDER BY orders.id DESC LIMIT 5", array("replace" => array($get_shop['id'], $_POST['purse'])));	
	endif;

else:
	// Простая выборка
		$get_orders = $db->rows("SELECT *, orders.id as id_orders FROM orders INNER JOIN goods ON orders.id_goods = goods.id WHERE orders.id_shop = ? ORDER BY orders.id DESC LIMIT 5", array("replace" => array($get_shop['id'])));
	// Простая выборка
endif;

// Определяем наличие возвратов
	foreach ($get_orders as $key => $value):
		$get_return = $db->row("SELECT count(*) as count FROM orders_return WHERE id_orders = ? AND status = 'Не обработано'", array($value['id_orders']));
		$get_orders[$key]['return'] = $get_return['count'];
	endforeach;
// Определяем наличие возвратов

//Определяем статус магазина
if ($get_shop['status'] == 'Заблокирован'):
  $err[9] = 'Заблокирован';
endif;

if ($get_shop['status'] == 'Выключен'):
  $err[9] = 'Выключен';
endif;

if ($get_shop['status'] == 'Работает'):
  $err[9] = 'Работает';
endif;
//Определяем статус магазина

//Определяем шаблон магазина
if ($get_template['template'] == 'MinKex'):
  $err[8] = 'MINKEX';
endif;

if ($get_template['template'] == 'lequeshop'):
  $err[8] = 'LEQUESHOP';
endif;

if ($get_template['template'] == 'light'):
  $err[8] = 'LIGHT';
endif;

if ($get_template['template'] == 'deer'):
  $err[8] = 'DEER';
endif;

if ($get_template['template'] == 'BlackRed'):
  $err[8] = 'BLACKRED';
endif;

if ($get_template['template'] == 'Assel'):
  $err[8] = 'ASSEL';
endif;
//Определяем шаблон магазина

//Определяем срок магазина
$err[7] = $get_shop['date'];
//Определяем срок магазина

//Определяем позицию в каталоге этого магазина
$err[6] = preg_replace('~[^0-9]+~','', $get_shop['catalog_position']);
//Определяем позицию в каталоге этого магазина

require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/statistics.tpl';