<?php
/**
*
* Описание товара на отдельной странице
*
*
*
*/
$title = 'Информация о товаре';
$tk = new token();


if (!empty($_GET['iditem'])):

$get_goods = $db->row("SELECT * FROM goods WHERE id = ? AND id_shop = ?", array($_GET['iditem'], $get_shop['id']));

if (!$get_goods):
	header('Location: /');
	exit;
endif;
$get_bloks = $db->rows("SELECT * FROM other_bloks WHERE id_shop = ?", array("replace" => array($get_shop['id'])));
$get_orders = $db->rows("SELECT * FROM orders WHERE id_shop = ? AND status = ? ORDER BY id DESC LIMIT 5", array("replace" => array($get_shop['id'], "Оплачен")));
$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($get_goods['id']));

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
	header('Location: http://rentshops.ru/ops/'.$get_shop['causeoff'].'/3/');
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
$get_pages = $db->rows("SELECT * FROM pages WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

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
  require $_SERVER["DOCUMENT_ROOT"].'/template/shop/'.$get_template['template'].'/info.tpl';
endif;
else:
  	header('Location: /');
	exit;
endif;