<?php
$this->title = 'Оплата счёта';

if (empty($_SESSION['auth']) or empty($_GET['id_order'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();

$get_payments = $db->row("SELECT * FROM shop_payments WHERE id = ? AND id_user = ?", array($_GET['id_order'], $_SESSION['auth']['id']));

if (!$get_payments):
	header("Location: /shops/");
	exit;
endif;

if ($get_payments['status'] == 'Оплачен'):
	header("Location: /shops/");
	exit;
endif;

if ($get_payments['paymethod'] == 'F-K'):
	$fk_merchant_id = MERCH_ID;
	$fk_merchant_key = SECRET_1;			
	$hash = md5($fk_merchant_id.":".$get_payments['sum'].":".$fk_merchant_key.":".$_SESSION['auth']['id']); 
	
	if ($get_payments['type'] == 'Регистрация'):
		$tipe = 'reg';
	endif;
	
	if ($get_payments['type'] == 'Продление'):
		$tipe = 'next';
	endif;
	
	if ($get_payments['type'] == 'Подъём в каталоге'):
		$tipe = 'up';
	endif;
	
	header("Location: http://www.free-kassa.ru/merchant/cash.php?m=".$fk_merchant_id."&oa=".$get_payments['sum']."&s=".$hash."&o=".$_SESSION['auth']['id']."&us_account=".$_SESSION['auth']['id']."&us_type=".$tipe."&us_idorder=".$get_payments['id']);
	exit;
endif;

if ($get_payments['paymethod'] == 'wmz'):
	$purse = WM_WMZ;
elseif ($get_payments['paymethod'] == 'wmr'):
	$purse = WM_WMR;
else:
	$purse = QIWI_LOGIN;
endif;

// Рассчитываем время окончания действия заявки
$date = strtotime($get_payments['timestamp'])+86400;
$date = $date - time()-1;

$hours = ceil($date / (60*60)); // Количество часов осталось
$hours_sec = floor($date / (60*60)) * 60 * 60; // Количество сек в этом количестве часов
$minutes = floor( ($date - $hours_sec) / 60); // Количество оставшихся минут
// Рассчитываем время окончания действия заявки

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shopsorder.tpl';