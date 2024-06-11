<?php
/**
*
* Проверка оплату товара в самом магазине пользователей
*
*
*
*
*
*
*
*/



$check_values = new filter();

if (!empty($_POST['order'])):
	$check = $check_values->check('order','post','int',array('min' => 1, 'max' => 9999999999));
	$var_order = $_POST['order'];
elseif (!empty($_GET['order'])):
	$var_order = $_GET['order'];
	$check = $check_values->check('order','get','int',array('min' => 1, 'max' => 9999999999));
else:
	$check = false;
endif;

if ($check):



$get_order = $db->row("SELECT * FROM orders WHERE id = ?", array($var_order));


if (!$get_order):
	$text['errors']['global'] = 'Такого заказа не существует.';
	echo json_encode($text);
	exit;
elseif ($get_order['status'] == 'Оплачен'):
	$text['errors']['global'] = 'Заказ уже был оплачен и выдан. Если Вы не получили заказ, то обратитесь к администратору магазина и сообщите номер #'.htmlspecialchars($var_order).' заказа.';
	echo json_encode($text);
	exit;
endif;




// Проверка оплаты


$pay = false;

if ($get_order['method'] == 'qiwi'):

	// Оплата через QIWI
	$get_qiwi = $db->row("SELECT * FROM payment_qiwi WHERE id_shop = ?", array($get_order['id_shop']));
	try
	{
	    $qiwi = new QIWI($get_qiwi['login'],$get_qiwi['password']);
	    $auth_qiwi = $qiwi->check_qiwi($get_qiwi['login'],$get_qiwi['password']);
	} catch (Exception $e) {
	    $auth_qiwi = false;
	}

	if ($auth_qiwi):
	    $bill = 'Оплата заказа #'.$get_order['id'];
	    $price = $get_order['sum'];
	    $pay_qiwi = $qiwi->qiwi_pay($get_qiwi['login'],$get_qiwi['password'],$bill,$price);
	    if ($pay_qiwi):
	    	$pay = true;
	    	$purse = $pay_qiwi['iOpponentPhone'];
	    endif;
	endif;
	// Оплата через QIWI

elseif ($get_order['method'] == 'yandex'):

	// Оплата через YANDEX
	$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_order['id_shop']));

	    $title = 'Оплата заказа #'.$get_order['id'];
	    $amount = $get_order['sum'];
	    $date_from = date(DateTime::RFC3339,strtotime('-105 day'));
		$date_to = date(DateTime::RFC3339,strtotime('+1 day'));

		$ym = new YandexMoney(YD_CLIENT_ID);
		$op_history =  $ym->operationHistory($get_yandex['token'], null, 100, 'deposition', $date_from, $date_to);

		$result_history = false;
		foreach ($op_history->operations as $key => $value) {
		    if ($value->amount == $amount and $value->direction == 'in' and $value->status == 'success' and $value->title == $title):
		        $result_history = $value->operationId;
		    endif;
		}



		if (!empty($result_history)):
		    $op_detail = $ym->operationDetail($get_yandex['token'],$result_history);

		    if ($op_detail->operationId == $result_history and $op_detail->direction == 'in' and  $op_detail->amount == $amount and $op_detail->title == $title and $op_detail->status == 'success'):
		        
		        $pay = true;

		        if (!empty($op_detail->sender)):
		            $purse = $op_detail->sender;
		        else:
		            $purse = 'Неизвестно';
		        endif;

		    endif;

		endif;
	// Оплата через YANDEX

elseif ($get_order['method'] == 'wmz' or $get_order['method'] == 'wmr'):

	// Оплата через WEBMONEY
	$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_order['id_shop']));

	$key = $_SERVER['DOCUMENT_ROOT'].'/class/wm_keys/'.$get_webmoney['wmid']."_".$get_order['id_shop']."_key.kwm";
	$desc = 'Оплата заказа #'.$get_order['id'];

	if ($get_order['method'] == 'wmz'):
		$fund = $get_webmoney['wmz'];
	else:
		$fund = $get_webmoney['wmr'];
	endif;


	$wm = new webmoney();

	$details = $wm->check_payment($get_webmoney['wmid'], $get_webmoney['key_pass'], $fund, $key, $desc, $get_order['sum']);

	if ($details):
		$pay = true;
		$purse = $details;
	endif;
	// Оплата через WEBMONEY

endif;


if (!$pay):
	$text['errors']['global'] = 'Платёж еще не поступил :(';
	echo json_encode($text);
	exit;
endif;
// Проверка оплаты




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
$db->update("UPDATE orders SET status = ?, purse = ?, ip = ? WHERE id = ?", array('Оплачен', $purse, $_SERVER['REMOTE_ADDR'], $var_order));
if ($count_goods_object['count_obj'] >= $get_order['count']):
	$text['errors']['global'] = '<td class="check">Перейдите по <a href="/accounts/'.$get_order['secret'].'/">ссылке</a> для получения аккаунтов.</td>';
else:

	$cost_per_one = $get_order['sum']/$get_order['count']; // Стоимость за еденицу с учётом скидок
	$obj_notgiven = $get_order['count'] - $count_goods_object['count_obj']; // Количество невыданных объектов


	$komp = $cost_per_one * $obj_notgiven;
	$db->insert("INSERT INTO orders_return (id_orders, obj_all, obj_given, obj_notgiven, sum_return, sum_type) VALUES (?, ?, ?, ?, ?, ?)", array($var_order, $get_order['count'], $count_goods_object['count_obj'], $obj_notgiven, $komp, $get_order['method']));
	$text['errors']['global'] = '<td class="check">Перейдите по <a href="/accounts/'.$get_order['secret'].'/">ссылке</a> для получения аккаунтов. Выдано: '.$count_goods_object['count_obj'].'/'.$get_order['count'].'. За компенсацией '.$komp.' '.$get_order['method'].' обратитесь к администратору магазина.</td>';
endif;
// Выбираем нужное количество товара и присваиваем заказу



// Отдаём ответ с URL
if (!empty($_POST['order'])):
echo json_encode($text);
elseif (!empty($_GET['order'])):
	$ttt['errors']['global'] = 'Товар успешно выдан, обновите страницу для отображения результата.';
echo json_encode($ttt);
endif;
// Отдаём ответ с URL


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


// Отправляем на почту
//$for_who = EMAIL_TO_SEND;
//$m = new mail("utf-8"); // начинаем 
//$m->From( $for_who ); // от кого отправляется почта 
//$m->To( $get_order['email'] ); // кому адресованно
//$m->Subject( "Счёт оплачен" );
//$m->Body( $text, 'html' );
//$m->Priority(3) ;    // приоритет письма
//$send = $m->Send();
//unset($m);
// Отправляем на почту

$for_who = EMAIL_TO_SEND;
require_once "./class/SendMailSmtpClass.php"; // подключаем класс
  
$mailSMTP = new SendMailSmtpClass(EMAIL_TO_SEND, 'verysupermegapassword641', 'ssl://smtp.yandex.ru', 'Nikita', 465);
  
// заголовок письма
$headers= "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
$headers .= "From: RentShops.Ru <rentshops.ru>\r\n"; // от кого письмо
$result =  $mailSMTP->send($get_order['email'], 'Успешная покупка', $text, $headers); // отправляем письмо

else:
	$text['errors']['global'] = 'Ошибка! Перезагрузите страницу и попробуйте ещё раз.';
	echo json_encode($text);
endif;