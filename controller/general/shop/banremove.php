<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if (empty($_GET['id'])):
	header('Location: /shops/settings/'.$_GET['shop'].'/ban/');
	exit;
endif;


$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

if (empty($get_shop)):
	header('Location: /shops/settings/'.$_GET['shop'].'/ban/');
	exit;
endif;


$deleterow = $db->delete("DELETE FROM ban WHERE id = ? AND id_shop = ?", array($_GET['id'], $get_shop['id']));


header('Location: /shops/settings/'.$_GET['shop'].'/ban/');