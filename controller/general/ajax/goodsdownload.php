<?php

if (empty($_SESSION['auth']) or empty($_GET['shop']) or empty($_GET['id'])):
	exit;
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

// Проверяем существование магазина и принадлежность к пользователю
if (!$get_shop):
	exit;
endif;
// Проверяем существование магазина и принадлежность к пользователю

$getrows = $db->rows("SELECT * FROM goods_object WHERE goods_object.id_orders IS NULL AND goods_object.id_goods = ?", array("replace" => array($_GET['id'])));




$check = '';
foreach ($getrows as $key => $value):
	$check = 1;
	echo htmlspecialchars($value['text']);
	echo "\r\n";
endforeach;


if ($check == 1):
	header('Content-Description: File Transfer');
	header('Content-Type: text/plain; charset=UTF-8');
	header('Content-Disposition: attachment; filename=accounts_'.$_GET['id'].'_'.date('d.m.Y_H-i-s').'.txt');
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate');
	header('Pragma: public');
else:
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
endif;