<?php

if (empty($_SESSION['auth']) or empty($_GET['shop']) or empty($_POST['name'])):
	exit;
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

// Проверяем существование магазина и принадлежность к пользователю
if (!$get_shop):
	exit;
endif;
// Проверяем существование магазина и принадлежность к пользователю


// Определяем максимальную позицию товара
$position_shop = $db->row("SELECT max(position) as max FROM goods WHERE id_shop = ?", array($get_shop['id']));
if (!$position_shop):
	$position_sh = 0;
else:
	$position_sh = $position_shop['max'] + 1;
endif;
// Определяем максимальную позицию товара

// Определяем максимальную позицию сепаратора
$position_separator = $db->row("SELECT max(position) as max FROM separators WHERE id_shop = ?", array($get_shop['id']));
if (!$position_separator):
	$position_sep = 0;
else:
	$position_sep = $position_separator['max'] + 1;
endif;
// Определяем максимальную позицию сепаратора

if ($position_sh >= $position_sep):
	$position = $position_sh;
else:
	$position = $position_sep;
endif;

$insertseparator = $db->insert("INSERT INTO separators (id_shop, name, position) VALUES (?, ?, ?)", array($get_shop['id'], $_POST['name'], $position));


$arr['name'] = $_POST['name'];
$arr['id'] = $insertseparator;
$arr['url'] = '/shops/settings/'.$_GET['shop'].'/';
echo json_encode($arr);