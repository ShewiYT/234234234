<?php

if (empty($_SESSION['auth']) or empty($_GET['shop']) or empty($_POST['position'])):
	exit;
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

// Проверяем существование магазина и принадлежность к пользователю
if (!$get_shop):
	exit;
endif;
// Проверяем существование магазина и принадлежность к пользователю


foreach ($_POST['position'] as $key => $value):
	$separator = preg_match('~separator~', $value);

	if ($separator):
		$separators = preg_replace('~separator~', '', $value);
		$db->update("UPDATE separators SET position = ? WHERE id = ? AND id_shop = ?", array($key+1, $separators,$get_shop['id']));
	else:
		$db->update("UPDATE goods SET position = ? WHERE id = ? AND id_shop = ?", array($key+1, $value,$get_shop['id']));
	endif;

endforeach;