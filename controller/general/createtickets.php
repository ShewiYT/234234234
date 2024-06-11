<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and
	!empty($_POST['subject']) and
	!empty($_POST['message'])
	):
	
	if(empty($_POST['subject']) or strlen($_POST['subject']) < 5):
	die('<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Минимальный объём темы - 5 символов.
			</div>');
	else:

	if(empty($_POST['message']) or strlen($_POST['message']) < 10):
	die('<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Минимальный объём сообщения для обращения - 10 символов.
			</div>');
	else:
		$secret = md5(uniqid(rand(), true));
		$insert_ticket = $db->insert("INSERT INTO tickets_list (user_id, subject, status, date_add, date_upd, secret) VALUES (?, ?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], htmlspecialchars($_POST['subject']), 'Без ответа', date("Y-m-d H:i:s"), date("Y-m-d H:i:s"), $secret));
		$get_ticket = $db->row("SELECT * FROM tickets_list WHERE secret = ?", array($secret));
		$insert_ticket_message = $db->insert("INSERT INTO tickets_message (user_id, id_ticket, message, creator, date) VALUES (?, ?, ?, ?, ?)", array($_SESSION['auth']['id'], $get_ticket['id'], htmlspecialchars($_POST['message']), 'Юзер', date("Y-m-d H:i:s")));
		header('Location: /tickets/list/');
		exit;
endif;
endif;
endif;

if (!empty($_POST['token'])):

if(empty($_POST['subject'])):
	die('<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Минимальный объём темы - 5 символов.
			</div>');
endif;

if(empty($_POST['message'])):
	die('<div class="alert alert-danger alert-dismissible">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Возникла ошибка!</h4>
                Минимальный объём сообщения для обращения - 10 символов.
			</div>');
endif;
else:
	header('Location: /tickets/list/');
	exit;
endif;