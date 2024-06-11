<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if ($_GET['iduser'] != $_SESSION['auth']['id']):
	header('Location: /tickets/list/');
	exit;
endif;

$get_ticket = $db->row("SELECT * FROM tickets_list WHERE user_id = ? AND id = ? AND status = ?", array($_SESSION['auth']['id'], $_GET['idticket'], 'Закрыта'));

if (!$get_ticket):
	header('Location: /tickets/list/');
	exit;
endif;

$delete_message = $db->delete("DELETE FROM tickets_message WHERE id_ticket = ?", array($_GET['idticket']));
$delete_list = $db->delete("DELETE FROM tickets_list WHERE id = ?", array($_GET['idticket']));
header('Location: /tickets/list/');
exit;