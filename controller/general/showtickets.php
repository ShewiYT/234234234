<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if ($_GET['iduser'] != $_SESSION['auth']['id']):
	header('Location: /tickets/list/');
	exit;
endif;

$get_ticket = $db->row("SELECT * FROM tickets_list WHERE user_id = ? AND id = ?", array($_SESSION['auth']['id'], $_GET['idticket']));
$get_tickets = $db->rows("SELECT * FROM tickets_message WHERE id_ticket = ? AND user_id = ?", array("replace" => array($_GET['idticket'], $_SESSION['auth']['id'])));

if (!$get_ticket):
	header('Location: /tickets/list/');
	exit;
endif;

$this->title = 'Просмотр тикета';
$tk = new token();

if ($get_ticket['status'] == 'Закрыта'):
	header('Location: /tickets/list/');
	exit;
endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):
	
	if (!empty($_POST['closeticket'])):
		$update_ticket = $db->update("UPDATE tickets_list SET status = ? WHERE id = ?", array('Закрыта', $_GET['idticket']));
		$updaterow = $db->update("UPDATE tickets_list SET date_upd = ? WHERE id = ?", array(date("Y-m-d H:i:s"), $_GET['idticket']));
		header('Location: /tickets/list/');
		exit;
	endif;
endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	!empty($_POST['message'])
	):

	$updaterow = $db->update("UPDATE tickets_list SET date_upd = ?, status = ? WHERE id = ?", array(date("Y-m-d H:i:s"), 'Без ответа', $_GET['idticket']));
	$insert_ticket_message = $db->insert("INSERT INTO tickets_message (user_id, id_ticket, message, creator, date) VALUES (?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], htmlspecialchars($_GET['idticket']), htmlspecialchars($_POST['message']), 'Юзер', date("Y-m-d H:i:s")));
	header('Location: /tickets/'.$_SESSION['auth']['id'].'/show/'.$_GET['idticket'].'/');
	exit;
endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/showtickets.tpl';