<?php
/**
*
* Главная страница самого магазина
*
*
*
*/
$tk = new token();

$get_page = $db->rows("SELECT * FROM pages WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

$get_discounts = $db->rows("SELECT * FROM discounts WHERE id_shop = ? ORDER BY id DESC", array("replace" => array($get_shop['id'])));
$get_orders = $db->rows("SELECT * FROM orders WHERE id_shop = ? AND status = ? ORDER BY id DESC LIMIT 5", array("replace" => array($get_shop['id'], "Оплачен")));
$get_bloks = $db->rows("SELECT * FROM other_bloks WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

$err[0] = '';
$ban_list = $db->rows("SELECT * FROM ban WHERE id_shop = '".$get_shop['id']."'");
foreach ($ban_list as $key => $value):
  if ($value['ip'] == $_SERVER['REMOTE_ADDR']):
	header('Location: http://rentshops.ru/ops/block/1/');
      //$err[0] = 'Вы были заблокированы в данном магазине';
    endif;
endforeach;

if ($get_shop['status'] == 'Заблокирован'):
	header('Location: http://rentshops.ru/ops/block/2/');
  //$err[0] = 'Данный магазин был заблокирован администратором сервиса';
endif;

if ($get_shop['status'] == 'Выключен'):
	if(!empty($get_shop['causeoff'])):
		header('Location: http://rentshops.ru/ops/'.$get_shop['id'].'/3/');
	else:
		header('Location: http://rentshops.ru/ops/off/3/');
	endif;
  //$err[0] = 'Данный магазин был выключен.<br>'.$get_shop['causeoff'];
endif;

if (strtotime($get_shop['date']) < time()):
	header('Location: http://rentshops.ru/ops/block/4/');
  //$err[0] = 'Данный магазин был отключен за неуплату';
endif;

$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
$get_qiwi = $db->row("SELECT * FROM payment_qiwi WHERE id_shop = ?", array($get_shop['id']));
$get_freekassa = $db->row("SELECT * FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));

$check_values = new filter();

if (!empty($_GET['search']) and $check_values->check('search','get','regexp','#^([A-zА-я \-:]*)$#ui')):
	$search = $_GET['search'];
	$get_goods = $db->rows("SELECT * FROM goods WHERE `name` LIKE '%".$search."%' AND id_shop = ?", array("replace" => array($get_shop['id'])));

	// Вычисляем число непроданных товаров
	foreach ($get_goods as $key => $value):
		$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
		$get_goods[$key]['count'] = $count_q['count'];
	endforeach;
	// Вычисляем число непроданных товаров
	
	if (!empty($get_goods)):
		// Объеденение массивов и сортировка
		$items = array_merge($get_goods);
		foreach($items as $key=>$value){
			$data_position[$key]=$value['position'];
		}
		array_multisort($data_position, SORT_NUMERIC, $items);
		// Объеденение массивов и сортировка
	endif;
endif;

if (!empty($_GET['cat_id']) and $check_values->check('cat_id','get','float',array('min' => -1, 'max' => 100000))):
	$get_goods = $db->rows("SELECT goods.name, goods.ico, goods.image, goods.cost_usd, goods.cost_rub, goods.description, goods.min_count, goods.category, goods.`position`, goods.id FROM goods WHERE goods.id_shop = ? AND goods.category = ? GROUP BY goods.ico, goods.id ORDER BY goods.`position`", array("replace" => array($get_shop['id'], $_GET['cat_id'])));
	
	// Вычисляем число непроданных товаров
	foreach ($get_goods as $key => $value):
		$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
		$get_goods[$key]['count'] = $count_q['count'];
	endforeach;
	// Вычисляем число непроданных товаров
	
	if (!empty($get_goods)):
		// Объеденение массивов и сортировка
		$items = array_merge($get_goods);
		foreach($items as $key=>$value){
			$data_position[$key]=$value['position'];
		}
		array_multisort($data_position, SORT_NUMERIC, $items);
		// Объеденение массивов и сортировка
	endif;
endif;

if (empty($_GET['cat_id']) and empty($_GET['search'])):
	$get_goods = $db->rows("SELECT goods.name, goods.ico, goods.image, goods.cost_usd, goods.cost_rub, goods.description, goods.min_count, goods.category, goods.`position`, goods.id FROM goods WHERE goods.id_shop = ? GROUP BY goods.ico, goods.id ORDER BY goods.`position`", array("replace" => array($get_shop['id'])));

	// Вычисляем число непроданных товаров
	foreach ($get_goods as $key => $value):
	$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
	$get_goods[$key]['count'] = $count_q['count'];
	endforeach;
	// Вычисляем число непроданных товаров

	if (!empty($get_goods)):
		// Объеденение массивов и сортировка
		$items = array_merge($get_goods);
		foreach($items as $key=>$value){
			$data_position[$key]=$value['position'];
		}
		array_multisort($data_position, SORT_NUMERIC, $items);
		// Объеденение массивов и сортировка
	endif;
endif;

if ($err[0]):

echo '<style type="text/css">
.popup {margin:25% auto 0;color:#fff;border-radius:20px;padding:10px 40px;}
</style>';

echo '<div class="popup">
  <center><img src="/style/general/images/Badge.png">
  <p style="color: black;">'.$err[0].'</p></center>
</div>';

else:
  $token = $tk->input();
  require $_SERVER["DOCUMENT_ROOT"].'/template/shop/'.$get_template['template'].'/main.tpl';
endif;