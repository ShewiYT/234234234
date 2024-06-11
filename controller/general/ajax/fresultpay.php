<?php
/**
*
* Проверка оплату товара в самом магазине пользователей через Free-kassa
*
*
*/


$check_values = new filter();

$get_id_orders = $db->row("SELECT * FROM orders WHERE id = ?", array($_POST['MERCHANT_ORDER_ID']));
$get_id_shop = $db->row("SELECT * FROM payment_freekassa WHERE id = ?", array($get_id_orders['free_id']));

if (!empty($_POST['MERCHANT_ORDER_ID'])):
	$check = $var_order = htmlspecialchars($_POST['MERCHANT_ORDER_ID']);
else:
	$check = false;
endif;

if ($check):

$sign = md5($get_id_shop['id_shop_fk'].':'.$_POST['AMOUNT'].':'.$get_id_shop['secret2'].':'.$_POST['MERCHANT_ORDER_ID']);
if ($sign != $_REQUEST['SIGN']) {
    die('wrong sign');
}

$get_order = $db->row("SELECT * FROM orders WHERE id = ?", array($check));


if (!$get_order):
	echo 'Такого заказа не существует.';
	exit;
elseif ($get_order['status'] == 'Оплачен'):
	echo 'Заказ уже был оплачен и выдан. Если Вы не получили заказ, то обратитесь к администратору магазина и сообщите номер #'.htmlspecialchars($var_order).' заказа.';
	exit;
endif;

// Есть отметка об использовании купона
if (!empty($get_order['coupon'])):
	$get_coupon = $db->row("SELECT * FROM discounts WHERE id = ?", array($get_order['coupon']));

	if ($get_coupon['count'] > 1):
		$db->update("UPDATE discounts SET count = ? WHERE id = ?", array($get_coupon['count']-1, $get_order['coupon'])); // Списываем число использования
	else:
		$db->delete("DELETE FROM discounts WHERE id = ?", array($get_order['coupon'])); // Удаляем
	endif;

endif;
// Есть отметка об использовании купона




// Выбираем нужное количество товара и присваиваем заказу
$count_goods_object = $db->row("SELECT count(id) as count_obj FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($get_order['id_goods']));
$get_goods_object = $db->row("SELECT * FROM goods_object WHERE id_goods = ? AND id_orders IS NULL LIMIT ".$get_order['count'], array($get_order['id_goods']));
$db->update("UPDATE goods_object SET id_orders = ? WHERE id_goods = ? AND id_orders IS NULL LIMIT ".$get_order['count'], array($var_order, $get_order['id_goods']));
$db->update("UPDATE orders SET status = ?, ip = ? WHERE id = ?", array('Оплачен', $_SERVER['REMOTE_ADDR'], $var_order));
if ($count_goods_object['count_obj'] >= $get_order['count']):
	//echo '<td class="check">Go to Перейдите по <a href="/accounts/'.$get_order['secret'].'/">ссылке</a> для получения аккаунтов.</td>';
else:

	$cost_per_one = $get_order['sum']/$get_order['count']; // Стоимость за еденицу с учётом скидок
	$obj_notgiven = $get_order['count'] - $count_goods_object['count_obj']; // Количество невыданных объектов


	$komp = $cost_per_one * $obj_notgiven;
	$db->insert("INSERT INTO orders_return (id_orders, obj_all, obj_given, obj_notgiven, sum_return, sum_type) VALUES (?, ?, ?, ?, ?, ?)", array($var_order, $get_order['count'], $count_goods_object['count_obj'], $obj_notgiven, $komp, $get_order['method']));
	//echo '<td class="check">Go to <a href="/accounts/'.$get_order['secret'].'/">ссылке</a> для получения аккаунтов. Выдано: '.$count_goods_object['count_obj'].'/'.$get_order['count'].'. За компенсацией '.$komp.' '.$get_order['method'].' обратитесь к администратору магазина.</td>';
endif;
// Выбираем нужное количество товара и присваиваем заказу


if (!empty($komp)):

	$text2 = 'Выдано: '.$count_goods_object['count_obj'].'/'.$get_order['count'].'<br/>'.
			 'Сумма компенсации: '.$komp.' '.$get_order['method'].'<br />';

else:
	$text2 = '';

endif;

// Формируем текст для отправки
$text = 'Ваш заказ #'.$get_order['id'].' обработан.<br/>'.
		$text2.
		'<br/>'.
		'Получить заказ вы можете по следующей ссылке: <a href="http://'.DOMAIN.'/accounts/'.$get_order['secret'].'/">http://'.DOMAIN.'/accounts/'.$get_order['secret'].'</a>';
// Формируем текст для отправки

$for_who = EMAIL_TO_SEND;
require_once "./class/SendMailSmtpClass.php"; // подключаем класс
  
$mailSMTP = new SendMailSmtpClass(EMAIL_TO_SEND, 'verysupermegapassword641', 'ssl://smtp.yandex.ru', 'Nikita', 465);
  
// заголовок письма
$headers= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
$headers .= "From: RentShops.Ru <rentshops.ru>\r\n"; // от кого письмо
$result =  $mailSMTP->send($get_order['email'], 'Успешная покупка в магазине ', $text, $headers); // отправляем письмо

$js = "<script>window.open(this.href, 'http://".DOMAIN."/accounts/".$get_order['secret']."/', 'scrollbars=1');</script>";
echo $js;
else:
	echo 'Fail.';
endif;