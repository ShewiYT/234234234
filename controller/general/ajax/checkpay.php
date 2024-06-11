<?php
/**
*
* AJAX проверка оплату услуг аренды/подъёма в каталоге
*
*
*/
if (empty($_SESSION['auth']) or empty($_GET['id_order'])):
	$text['errors']['global'] = 'Ошибка проведения запроса.';
	echo json_encode($text);
	exit;
endif;

$get_order = $db->row("SELECT * FROM shop_payments WHERE id_user = ? AND id = ? AND status = ?", array($_SESSION['auth']['id'], $_GET['id_order'], 'Не оплачен'));

// Если не существует такого заказа или он уже оплачен
if (empty($get_order)):
	$text['errors']['global'] = 'Ошибка проведения запроса.';
	echo json_encode($text);
	exit;
endif;
// Если не существует такого заказа или он уже оплачен




// Проверка оплаты
$key = $_SERVER['DOCUMENT_ROOT'].'/'.WM_WMID."_key.kwm";
$desc = 'Оплата заказа #'.$get_order['id'];

if ($get_order['paymethod'] == 'wmz'):
	$fund = WM_WMZ;
elseif ($get_order['paymethod'] == 'wmr'):
	$fund = WM_WMR;
else:
	$fund = QIWI_LOGIN;
endif;



// Если метод оплаты выключен, то даём ошибку
if (WM_PAY != 1 and ($get_order['paymethod'] == 'wmz' or $get_order['paymethod'] == 'wmr')):
	$text['errors']['global'] = 'Оплата через webmoney выключена, воспользуйтесь другим способом.';
	echo json_encode($text);
	exit;
endif;

if (QIWI_PAY != 1 and $get_order['paymethod'] == 'qiwi'):
	$text['errors']['global'] = 'Оплата через qiwi выключена, воспользуйтесь другим способом.';
	echo json_encode($text);
	exit;
endif;
// Если метод оплаты выключен, то даём ошибку



if ($get_order['paymethod'] == 'wmz' or $get_order['paymethod'] == 'wmr'):
	$wm = new webmoney();
	$pay = $wm->check_payment(WM_WMID, WM_KEY_PASSW, $fund, $key, $desc, $get_order['sum']);
else:
	// Оплата через QIWI
	try
	{
	    $qiwi = new QIWI(QIWI_LOGIN,QIWI_PASSWORD);
	    $auth_qiwi = $qiwi->check_qiwi(QIWI_LOGIN,QIWI_PASSWORD);
	} catch (Exception $e) {
	    $auth_qiwi = false;
	}

	if ($auth_qiwi):
	    $desc = 'Оплата заказа #'.$get_order['id'];
	    $price = $get_order['sum'];
	    $pay_qiwi = $qiwi->qiwi_pay(QIWI_LOGIN,QIWI_PASSWORD,$desc,$price);
	    if ($pay_qiwi):
	    	$pay = true;
	    	$purse = $pay_qiwi['iOpponentPhone'];
	    endif;
	endif;
	// Оплата через QIWI
endif;



if (empty($pay) or !$pay):
	$text['errors']['global'] = 'Платёж еще не поступил :(';
	echo json_encode($text);
	exit;
endif;
// Проверка оплаты



if ($get_order['type'] == 'Регистрация'):
	// Создаём магазин
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['id_order']));

		// Рассчитываем время окончания аренды магазина
		$date = time();
		$sec_per_month = date("t")*86400;
		$sec_per_all_mounths = $sec_per_month * $get_order['count'];
		$final_date = date("Y-m-d H:i:s",$date + $sec_per_all_mounths);
		// Рассчитываем время окончания аренды магазина

		// Определяем максимальную позицию для каталога
		$catalog_position = $db->row("SELECT min(catalog_position) as max FROM shop");
		if (!$catalog_position):
			$catalog_position = 1;
		else:
			$catalog_position = $catalog_position['max'] - 1;

		endif;
		// Определяем максимальную позицию для каталога

		$insert_shop = $db->insert("INSERT INTO shop (id_user, domain, date, status, catalog_position) VALUES (?, ?, '$final_date', 'Работает', '$catalog_position')", array($_SESSION['auth']['id'], $get_order['domain']));

		$db->insert("INSERT INTO template (id_shop, meta_title, logo, background, template) VALUES (?, ?, ?, ?, ?)", array($insert_shop, 'RentShops.Ru', '/style/shop/css/templates/Assel/images/h-logo.png', '/style/shop/css/templates/Assel/images/bg.jpg', 'Assel'));
	// Создаём магазин
elseif ($get_order['type'] == 'Продление'):
	// Продлеваем магазин
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['id_order']));

		// Достаём информацию о магазине по заявке
		$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($get_order['domain']));
		// Достаём информацию о магазине по заявке


		// Рассчитываем время окончания аренды магазина
		if (strtotime($get_shop['date']) > time()):
			$date = strtotime($get_shop['date']);
		else:
			$date = time();
		endif;

		$sec_per_month = date("t")*86400;
		$sec_per_all_mounths = $sec_per_month * $get_order['count'];
		$final_date = date("Y-m-d H:i:s",$date + $sec_per_all_mounths);
		// Рассчитываем время окончания аренды магазина


		$updaterow = $db->update("UPDATE shop SET date = '$final_date' WHERE domain = ?", array($get_order['domain']));
	// Продлеваем магазин
elseif ($get_order['type'] == 'Подъём в каталоге'):
	// Поднимаем магазин в каталоге
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['id_order']));


		// Определяем максимальную позицию для каталога
		$catalog_position = $db->row("SELECT max(catalog_position) as max FROM shop");
		if (!$catalog_position):
			$catalog_position = 0;
		else:
			$catalog_position = $catalog_position['max'] + 1;
		endif;
		// Определяем максимальную позицию для каталога


		$updaterow = $db->update("UPDATE shop SET catalog_position = ? WHERE domain = ?", array($catalog_position, $get_order['domain']));


	// Поднимаем магазин в каталоге
else:
	$text['errors']['global'] = 'Ошибка проведения запроса.';
	echo json_encode($text);
	exit;	
endif;



$text['errors']['global'] = 'Счёт успешно оплачен.';
echo json_encode($text);