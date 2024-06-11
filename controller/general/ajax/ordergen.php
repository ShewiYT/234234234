<?php
$tk = new token();
$check_values = new filter();

//Функция поиска URL
function request_url()
{
	$result = '';
	$result .= $_SERVER['SERVER_NAME'];
	$result .= str_replace("/order/", "", $_SERVER['REQUEST_URI']);

  return $result;
}
$request_url = request_url();

// Если в текущем адресе нет нашей зоны, то значит это другой домен.
if (!preg_match("/.rentshops.ru/", $request_url)) {
	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array(request_url()));
}
else {
	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($this->domain));
}
//$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($this->domain));

if(!empty($_POST['token'])) {
$get_goods = $db->row("SELECT
  goods.id,
  goods.id_shop,
  goods.name,
  goods.cost_rub,
  goods.cost_usd,
  goods.min_count,
  goods.description,
  goods.ico,
  goods.`position`,
  COUNT(goods_object.id) AS count_object
FROM goods_object
  INNER JOIN goods
    ON goods_object.id_goods = goods.id
WHERE goods.id = ?
AND goods.id_shop = ?", array($_POST['type'], $get_shop['id']));

	$imya = $get_goods['name'];
}
if (
	!empty($get_goods) and 
	!empty($_POST['token']) and 
  $tk->check($_POST['token']) and 
  $check_values->check('email','post','email') and 
  $check_values->check('type','post','int',array('min' => 1, 'max' => 9999999999)) and 
  $check_values->check('count','post','int',array('min' => 1, 'max' => 9999999999)) and 
  $check_values->check('paymethod','post','regexp','~^(wmr)|(wmz)|(yandex)|(qiwi)|(freekassa)$~') and
  $_POST['count'] >= $get_goods['min_count'] and 
  $get_goods['count_object'] >= $_POST['count'] and
  $kolvo = $_POST['count'] and
  $paymetod = $_POST['paymethod']
	):
	
	if (empty($_POST['icq'])):
		$icq = null;
	else:
		$icq = $_POST['icq'];
	endif;

	// Определяем валюту
	$cash = null;
	if ($paymetod == 'wmz'):
		$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
		if ($get_webmoney):
			$type_sum = $get_goods['cost_usd'] * $_POST['count'];
			$cash = $get_webmoney['wmz'];
		endif;
	elseif ($paymetod == 'wmr'):
		$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
		if ($get_webmoney):
			$type_sum = $get_goods['cost_rub'] * $_POST['count'];
			$cash = $get_webmoney['wmr'];
		endif;
	elseif ($paymetod == 'yandex'):
		$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
		if ($get_yandex):
			$type_sum = $get_goods['cost_rub'] * $_POST['count'];
			$cash = $get_yandex['login'];
		endif;
	elseif ($paymetod == 'qiwi'):
		$get_qiwi = $db->row("SELECT * FROM payment_qiwi WHERE id_shop = ?", array($get_shop['id']));
		if ($get_qiwi):
			$type_sum = $get_goods['cost_rub'] * $_POST['count'];
			$cash = $get_qiwi['login'];
		endif;
	elseif ($paymetod == 'freekassa'):
		$get_freekassa = $db->row("SELECT * FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));
		if ($get_freekassa):
			$type_sum = $get_goods['cost_rub'] * $_POST['count'];
			$cash = 'FreeKassa';
		endif;
	endif;
	// Определяем валюту

	if (empty($cash)):
		exit;
	endif;


	// Проверяем на наличие скидки
	if (!empty($_POST['discount_code'])):
		$get_discount = $db->row("SELECT * FROM discounts WHERE code = ? AND count > 0", array($_POST['discount_code']));

		if ($get_discount):
			// Разбираем скидочный купон

			$items = unserialize($get_discount['items']);

			// Проверяем принадлежность купона к покупаемому товару
				foreach ($items as $key => $value):
					if ($value == $_POST['type']):
						$coupon = true;
					endif;
				endforeach;
			// Проверяем принадлежность купона к покупаемому товару

			// Если принадлежность была найдена, то формируем сумму со скидкой
				if ($coupon):
					$skidka = $get_discount['percent'];
					$sum = $type_sum * (100 - $get_discount['percent'])* 0.01; // Итоговая сумма с процентов
					$coup_val = $get_discount['id'];
				else:
					$sum = $type_sum;
					$coup_val = null;
				endif;
			// Если принадлежность была найдена, то формируем сумму со скидкой

			// Разбираем скидочный купон
		else:
			$sum = $type_sum;
			$coup_val = null;
		endif;

	else:
		$sum = $type_sum;
		$coup_val = null;
	endif;
	// Проверяем на наличие скидки

	$date = date("Y-m-d H:i:s");

	$secret = hash('ripemd128',uniqid(rand()));
	
	if ($paymetod == 'freekassa'):
		$get_dannie_freekassa = $db->row("SELECT * FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));
		if ($get_dannie_freekassa):
		
			if (!empty($skidka)) {
				$insert_order = $db->insert("INSERT INTO orders (id_shop, id_goods, date, sum, count, method, email, icq, secret, coupon, ip, cash, percent, name, free_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($get_shop['id'], $get_goods['id'], $date, $sum, $_POST['count'], $paymetod, $_POST['email'], $icq, $secret, $coup_val, $_SERVER['REMOTE_ADDR'], $cash, $skidka, $get_goods['name'], $get_dannie_freekassa['id']));
				$get_update_order = $db->row("SELECT * FROM orders WHERE secret = ?", array($secret));
			} else {
				$insert_order = $db->insert("INSERT INTO orders (id_shop, id_goods, date, sum, count, method, email, icq, secret, coupon, ip, cash, percent, name, free_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($get_shop['id'], $get_goods['id'], $date, $sum, $_POST['count'], $paymetod, $_POST['email'], $icq, $secret, $coup_val, $_SERVER['REMOTE_ADDR'], $cash, '0', $get_goods['name'], $get_dannie_freekassa['id']));
				$get_update_order = $db->row("SELECT * FROM orders WHERE secret = ?", array($secret));
			}
			
			$hash = md5($get_dannie_freekassa['id_shop_fk'].":".$sum.":".$get_dannie_freekassa['secret1'].":".$get_update_order['id']);
			header('Location: http://www.free-kassa.ru/merchant/cash.php?m='.$get_dannie_freekassa['id_shop_fk'].'&oa='.$sum.'&s='.$hash.'&o='.$get_update_order['id'].'&us_coupon='.$coup_val);
			exit;
		endif;
	endif;
	
	if (!empty($skidka)) {
		$insert_order = $db->insert("INSERT INTO orders (id_shop, id_goods, date, sum, count, method, email, icq, secret, coupon, ip, cash, percent, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($get_shop['id'], $get_goods['id'], $date, $sum, $_POST['count'], $paymetod, $_POST['email'], $icq, $secret, $coup_val, $_SERVER['REMOTE_ADDR'], $cash, $skidka, $get_goods['name']));
	} else {
		$insert_order = $db->insert("INSERT INTO orders (id_shop, id_goods, date, sum, count, method, email, icq, secret, coupon, ip, cash, percent, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($get_shop['id'], $get_goods['id'], $date, $sum, $_POST['count'], $paymetod, $_POST['email'], $icq, $secret, $coup_val, $_SERVER['REMOTE_ADDR'], $cash, '0', $get_goods['name']));
	}
	
$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/paysorders.tpl';

else:
	if(!empty($_GET['bill'])) {
		//Создаем шаблон запроса к БД
		$bill = $_GET['bill'];
		$get_viborka = $db->row("SELECT * FROM orders WHERE id = '$bill'");
		//Если IP текущего юзера не совпадает с IP покупателя этого товара, то перенаправляем его на главную
		if ($get_viborka['ip'] == $_SERVER['REMOTE_ADDR']) {
			//Если ID больше нуля, то грузим данные о товаре из БД
			if($get_viborka['id'] > 0) {
				$kolvo = $get_viborka['count'];
				$cash = $get_viborka['cash'];
				$sum = $get_viborka['sum'];
				$paymetod = $get_viborka['method'];
				$insert_order = $bill;
				$skidka = $get_viborka['percent'];
				$imya = $get_viborka['name'];
				require $_SERVER["DOCUMENT_ROOT"].'/template/general/paysorders.tpl';
			}
			else {
				//Если в базе такое примечание не найдено, перенаправляем юзера на главную
				header('Location: /');
			}
		}
		else {
			//Если IP текущего юзера не совпадает с IP покупателя этого товара, то перенаправляем его на главную
			header('Location: /');
		}
	} else {
		//Если GET-данных и POST-данных не поступило, то выдаем ошибку 
		//header('Location: /');
		die('Возникла ошибка при составлении счета! Проверьте введённые Вами данные.');
}
endif;