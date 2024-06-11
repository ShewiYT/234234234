<?php

$ft = new filter();

if (empty($_SESSION['auth']) or empty($_GET['shop']) or !$ft->check('id','get','int',array('min' => 1, 'max' => 1000000)) or !$ft->check('count','get','int',array('min' => 1, 'max' => 1000000))):
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	exit;
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

// Проверяем существование магазина и принадлежность к пользователю
if (!$get_shop):
	exit;
endif;
// Проверяем существование магазина и принадлежность к пользователю

$getrows = $db->rows("SELECT * FROM goods_object WHERE goods_object.id_orders IS NULL AND goods_object.id_goods = ? LIMIT ".$_GET['count'], array("replace" => array($_GET['id'])));




$check = '';
foreach ($getrows as $key => $value):
	$deleterow = $db->delete("DELETE FROM goods_object WHERE id = ?", array($value['id']));
	$check = 1;
	echo htmlspecialchars($value['text']);
	echo "\r\n";
endforeach;


if ($check == 1):
	header('Content-Description: File Transfer');
	header('Content-Type: text/plain; charset=UTF-8');
	header('Content-Disposition: attachment; filename='.$_GET['count'].'_accounts_'.$_GET['id'].'_'.date('d.m.Y_H-i-s').'.txt');
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate');
	header('Pragma: public');
else:
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
endif;