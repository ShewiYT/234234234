<?php
/**
*
* Страницы в магазине
*
*
*
*/
if (!empty($_GET['idpage'])):

$get_page = $db->row("SELECT * FROM pages WHERE prefix = ? AND id_shop = ?", array($_GET['idpage'], $get_shop['id']));

if (!$get_page):
	header('Location: /');
	exit;
endif;
$get_pages = $db->rows("SELECT * FROM pages WHERE id_shop = ?", array("replace" => array($get_shop['id'])));
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


if ($err[0]):

echo '<style type="text/css">
.popup {margin:25% auto 0;color:#fff;border-radius:20px;padding:10px 40px;}
</style>';

echo '<div class="popup">
  <center><img src="/style/general/images/Badge.png">
  <p style="color: black;">'.$err[0].'</p></center>
</div>';

else:
  require $_SERVER["DOCUMENT_ROOT"].'/template/shop/'.$get_template['template'].'/pages.tpl';
endif;
else:
  	header('Location: /');
	exit;
endif;