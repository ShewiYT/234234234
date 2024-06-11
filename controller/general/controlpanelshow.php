<?php
$this->title = 'ПУ | Диалог с пользователем';

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
$get_ticket = $db->row("SELECT * FROM tickets_list WHERE user_id = ? AND id = ?", array($get_userid['user_id'], $_GET['idticket']));
$get_tickets = $db->rows("SELECT * FROM tickets_message WHERE id_ticket = ? AND user_id = ?", array("replace" => array($_GET['idticket'], $get_userid['user_id'])));

if (!$get_ticket):
	header('Location: /controlpanel/tickets/');
	exit;
endif;

$tk = new token();

if ($get_ticket['status'] == 'Закрыта'):
	header('Location: /controlpanel/tickets/');
	exit;
endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):
	
	if (!empty($_POST['closeticket'])):
		$update_ticket = $db->update("UPDATE tickets_list SET status = ? WHERE id = ?", array('Закрыта', $_GET['idticket']));
		$updaterow = $db->update("UPDATE tickets_list SET date_upd = ? WHERE id = ?", array(date("Y-m-d H:i:s"), $_GET['idticket']));
		header('Location: /controlpanel/tickets/');
		exit;
	endif;
endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	!empty($_POST['message'])
	):

	$updaterow = $db->update("UPDATE tickets_list SET date_upd = ?, status = ? WHERE id = ?", array(date("Y-m-d H:i:s"), 'Отвечен', $_GET['idticket']));
	$insert_ticket_message = $db->insert("INSERT INTO tickets_message (user_id, id_ticket, message, creator, date) VALUES (?, ?, ?, ?, ?)", array($get_userid['user_id'], $_GET['idticket'], $_POST['message'], 'Админ', date("Y-m-d H:i:s")));
	header('Location: /controlpanel/tickets/show/'.$_GET['idticket'].'/');
	exit;
endif;

$new_tickets = $db->row("SELECT count(*) AS count FROM tickets_list WHERE status = 'Без ответа'");
if (!$new_tickets['count']):
	$new_tickets['count'] = 0;
endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/controlpanelshow.tpl';