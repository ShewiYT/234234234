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


$deleterow = $db->delete("DELETE FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($_GET['id']));

header('Location: /shops/settings/'.$_GET['shop'].'/goods/');