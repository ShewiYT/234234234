<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if (empty($_GET['id'])):
	header('Location: /shops/settings/'.$_GET['shop'].'/discount/');
	exit;
endif;


$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

if (empty($get_shop)):
	header('Location: /shops/settings/'.$_GET['shop'].'/discount/');
	exit;
endif;


$deleterow = $db->delete("DELETE FROM discounts WHERE id = ?", array($_GET['id']));


header('Location: /shops/settings/'.$_GET['shop'].'/discount/');