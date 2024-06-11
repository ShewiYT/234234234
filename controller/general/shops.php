<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();

// Проверяем фильтром пришедшие данные
$check_page = new filter();
$page = $check_page->check('page2','get','regexp','~^[a-z]{1,20}$~');
// Проверяем фильтром пришедшие данные

if (!$page):
	$this->title = 'Мои магазины и счета';

	// Удаление всех не оплаченных заявок в течении 24-ёх часов
	$deleterow_reg = $db->delete("DELETE FROM shop_payments WHERE status = ? AND DATE_ADD(timestamp, INTERVAL 23 DAY_HOUR) < CURDATE()", array("Не оплачен"));
	// Удаление всех не оплаченных заявок в течении 24-ёх часов

	$get_shops = $db->rows("SELECT * FROM shop WHERE id_user = ?", array("replace" => array($_SESSION['auth']['id'])));
	$get_payments = $db->rows("SELECT * FROM shop_payments WHERE id_user = ? ORDER BY id DESC LIMIT 10", array("replace" => array($_SESSION['auth']['id'])));
	/*function dateGap($date1, $date2)
{
	$time = new DateTime($date1);

	$since_time = $time->diff( new DateTime($date2) );
	
	$A['days'] = $since_time->days;
	$A['hours'] = $since_time->days * 24 + $since_time->h;	
	$A['minutes'] = ($since_time->days * 24 * 60) + ($since_time->h * 60) + $since_time->i;	

	return $A;
	} */
	function dateGap($date1, $date2)
	{
		if (strtotime($date1) < strtotime($date2)) {
			$A['days'] = 0;
			return $A;
		} else {
			$time = new DateTime($date1);
			$since_time = $time->diff( new DateTime($date2) );
			$A['days'] = $since_time->days + 1;

			return $A;
		}
	}
	$token = $tk->input();
	require $_SERVER["DOCUMENT_ROOT"].'/template/general/shops.tpl';
else:
	$tpl = new template();

	// Передаём параметры скрипту
	$tpl->info_db = $this->info_db;
	$tpl->info_icons = $this->info_icons;
	$tpl->info_cost = $this->info_cost;
	$tpl->info_menu_shop = $this->info_menu_shop;
	// Передаём параметры скрипту

	$tpl->controller = $tpl->controller("general_shop");
	$tpl->template = $tpl->template("template_general_shop");
	$this->title = $tpl->title; // Передаём TITLE выше
	echo $tpl->template;
endif;