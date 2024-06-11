<?php
if (empty($_SESSION['auth']) or empty($_POST['domainprod'])):
	header('Location: /auth/');
	exit;
endif;

$fk_merchant_id = MERCH_ID;
$fk_merchant_key = SECRET_1;

$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array(htmlspecialchars($_POST['domainprod']), $_SESSION['auth']['id']));

// Если не существует такого магазина у этого пользователя
if (empty($get_shop)):
	die('Мы сожалеем, но Вы не сможете продлить этот магазин, так как он не Ваш или его не существует вообще.');
endif;
// Если не существует такого магазина у этого пользователя


// Продление
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	$check_values->check('period','post','int',array('min' => 1, 'max' => 12)) and 
	$check_values->check('paymethod','post','regexp','~^(wmr)|(wmz)|(qiwi)|(F-K)$~') and 
	$_POST['alias'] != 'domain'
	):


	if (WM_PAY != 1 and ($_POST['paymethod'] == 'wmz' or $_POST['paymethod'] == 'wmr')):
		die('Оплата через WebMoney временно выключена! Воспользуйтесь другим методом оплаты!');
	endif;

	if (QIWI_PAY != 1 and $_POST['paymethod'] == 'qiwi'):
		die('Оплата через QIWI временно выключена! Воспользуйтесь другим методом оплаты!');
	endif;



	// Рассчёт стоимости
	if ($_POST['period'] > 0 and $_POST['period'] < 3):
		$cost_per_mounth = $cost[1];
	elseif ($_POST['period'] > 2 and $_POST['period'] < 6):
		$cost_per_mounth = $cost[3];
	elseif ($_POST['period'] > 5):
		$cost_per_mounth = $cost[6];
	endif;

	$cost_per_count = $cost_per_mounth * $_POST['period'];

	if ($_POST['paymethod'] == 'wmr' or $_POST['paymethod'] == 'qiwi' or $_POST['paymethod'] == 'F-K'):
		$sum = number_format($cost_per_count, 2, '.', '');
	elseif ($_POST['paymethod'] == 'wmz'):
		$sum = number_format($cost_per_count / $cost['dollar'], 2, '.', '');
	endif;
	// Рассчёт стоимости
	
	if ($_POST['paymethod'] == 'F-K'):
		$hash = md5($fk_merchant_id.":".$sum.":".$fk_merchant_key.":".$_SESSION['auth']['id']);
		$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Продление', 'Не оплачен', htmlspecialchars($_POST['domainprod']), $_POST['paymethod']));
		die('http://www.free-kassa.ru/merchant/cash.php?m='.$fk_merchant_id.'&oa='.$sum.'&s='.$hash.'&o='.$_SESSION['auth']['id'].'&us_account='.$_SESSION['auth']['id'].'&us_type=next&us_idorder='.htmlspecialchars($insertrow).'');
	else:
		$insertrow = $db->insert("INSERT INTO shop_payments (id_user, count, sum, type, status, domain, paymethod) VALUES (?, ?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $_POST['period'], $sum, 'Продление', 'Не оплачен', htmlspecialchars($_POST['domainprod']), $_POST['paymethod']));
		die('http://rentshops.ru/shops/order/'.$insertrow.'/');
	endif;

else:
	die('Данные были заполнены неверно!');
endif;
// Продление