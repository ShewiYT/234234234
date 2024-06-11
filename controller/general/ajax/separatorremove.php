<?php

if (empty($_SESSION['auth']) or empty($_GET['shop']) or empty($_POST['id'])):
	exit;
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

// Проверяем существование магазина и принадлежность к пользователю
if (!$get_shop):
	exit;
endif;
// Проверяем существование магазина и принадлежность к пользователю


$separatordelete = $db->delete("DELETE FROM separators WHERE id = ? AND id_shop = ?", array($_POST['id'], $get_shop['id']));

$arr['ok'] = $separatordelete;
echo json_encode($arr);