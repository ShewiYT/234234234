<?php
$this->title = 'Панель управления';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));

if ($user['privalages'] == 'Юзер'):
	header("HTTP/1.0 404 Not Found");
	header("HTTP/1.1 404 Not Found");
	header("Status: 404 Not Found");
	header("Location: /404/");
	exit;
endif;

//if (empty($_GET['password']) or $_GET['password'] != CPANEL_PASSWORD):
	//header("HTTP/1.0 404 Not Found"); 
	//header("HTTP/1.1 404 Not Found"); 
	//header("Status: 404 Not Found");
	//header("Location: /404/");
	//exit;
//endif;

$new_tickets = $db->row("SELECT count(*) AS count FROM tickets_list WHERE status = 'Без ответа'");
if (!$new_tickets['count']):
	$new_tickets['count'] = 0;
endif;


$get_stat_full_rub_service = $db->row("SELECT SUM(shop_payments.sum) AS sum FROM shop_payments WHERE shop_payments.status = 'Оплачен' AND shop_payments.paymethod = 'wmr' OR shop_payments.paymethod = 'qiwi'");
if (!$get_stat_full_rub_service['sum']):
	$get_stat_full_rub_service['sum'] = 0;
endif;

$get_stat_full_usd_service = $db->row("SELECT SUM(shop_payments.sum) AS sum FROM shop_payments WHERE shop_payments.status = 'Оплачен' AND shop_payments.paymethod = 'wmz'");
if (!$get_stat_full_usd_service['sum']):
	$get_stat_full_usd_service['sum'] = 0;
endif;

$count_shops = $db->row("SELECT count(*) AS count FROM shop WHERE status = 'Работает' AND date > CURDATE()");
if (!$count_shops['count']):
	$count_shops['count'] = 0;
endif;

$get_all_shops = $db->rows("SELECT * FROM shop");

$chk = '';
$check_values = new filter();
if ($check_values->check('domain','post','regexp','~^[A-z0-9-(.)]{3,150}$~')):

	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($_POST['domain']));

	if ($get_shop):
		$chk = 1;




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








	// Блочим или снимаем блок
	if (!empty($_POST['action'])):

		if ($get_shop['status'] == 'Работает'):
			$action_upd = 'Заблокирован';
		else:
			$action_upd = 'Работает';
		endif;

		$db->update("UPDATE shop SET status = ? WHERE id = ?", array($action_upd, $get_shop['id']));

	endif;
	// Блочим или снимаем блок

	endif;

	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($_POST['domain']));

endif;

require $_SERVER["DOCUMENT_ROOT"].'/template/general/controlpanel.tpl';