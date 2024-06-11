<?php
$this->title = 'ПУ | Список тикетов';

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

$new_tickets = $db->row("SELECT count(*) AS count FROM tickets_list WHERE status = 'Без ответа'");
if (!$new_tickets['count']):
	$new_tickets['count'] = 0;
endif;

$get_tickets = $db->rows("SELECT * FROM tickets_list");

require $_SERVER["DOCUMENT_ROOT"].'/template/general/controlpanellist.tpl';