<?php
if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));

if ($user['privalages'] == 'Юзер'):
	header("HTTP/1.0 404 Not Found");
	header("HTTP/1.1 404 Not Found");
	header("Status: 404 Not Found");
	header("Location: /404/");
	exit;
endif;

$get_userid = $db->row("SELECT * FROM tickets_list WHERE id = ?", array($_GET['idticket']));
$get_ticket = $db->row("SELECT * FROM tickets_list WHERE user_id = ? AND id = ? AND status = ?", array($get_userid['user_id'], $_GET['idticket'], 'Закрыта'));

if (!$get_ticket):
	header('Location: /controlpanel/tickets/');
	exit;
endif;

$delete_message = $db->delete("DELETE FROM tickets_message WHERE id_ticket = ?", array($_GET['idticket']));
$delete_list = $db->delete("DELETE FROM tickets_list WHERE id = ?", array($_GET['idticket']));
header('Location: /controlpanel/tickets/');
exit;