<?php
$this->title = 'Поднятие магазина в каталоге';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));


// Формируем заявку на поднятие магазина
if (
  !empty($_POST['token']) and 
  $tk->check($_POST['token']) and
  $check_values->check('paymethod','post','regexp','~^(wmr)|(wmz)|(qiwi)$~') and
  $paymetod = $_POST['paymethod']
  ):
  
  // Определяем валюту
	$cash = null;
	if ($paymetod == 'wmz'):
		$sumpay = $cost['catalog_up_wmz'];
		$cash = WM_WMZ;
	elseif ($paymetod == 'wmr'):
		$sumpay = $cost['catalog_up'];
		$cash = WM_WMR;
	elseif ($paymetod == 'qiwi'):
		$sumpay = $cost['catalog_up'];
		$cash = QIWI_LOGIN;
	endif;
	// Определяем валюту

	if (empty($cash)):
		exit;
	endif;


  $insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], '1', $sumpay, 'Подъём в каталоге', 'Не оплачен', $_GET['shop'], $paymetod));
  header('Location: /shops/order/'.$insertrow.'/');
  exit;

endif;
// Формируем заявку на поднятие магазина



$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/catalog.tpl';