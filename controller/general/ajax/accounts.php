<?php
$ft = new filter();

if (empty($_GET['secret'])):
	header('Location: /');
	exit;
endif;

$get_order = $db->row("SELECT * FROM orders WHERE secret = ?", array($_GET['secret']));

if (!$get_order):
	header('Location: /');
	exit;
endif;

$getrows = $db->rows("SELECT * FROM goods_object WHERE goods_object.id_orders  = ?", array("replace" => array($get_order['id'])));

$check = '';
foreach ($getrows as $key => $value):
	$check = 1;
	echo htmlspecialchars($value['text']);
	echo "\r\n";
endforeach;

if ($check == 1):
	header('Content-Description: File Transfer');
	header('Content-Type: text/plain; charset=UTF-8');
	header('Content-Disposition: attachment; filename='.$get_order['count'].'_accounts_'.$get_order['id_goods'].'_'.date('d.m.Y_H-i-s').'.txt');
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate');
	header('Pragma: public');
else:
	header('Location: /');
endif;