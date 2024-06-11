<?php

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();
// Проверяем фильтром пришедшие данные
$check_page = new filter();
$page = $check_page->check('page2','get','regexp','~^[a-z]{1,20}$~');
// Проверяем фильтром пришедшие данные

if (!$page):
	$this->title = 'Центр поддержки пользователей';

	$get_tickets = $db->rows("SELECT * FROM tickets_list WHERE user_id = ?", array("replace" => array($_SESSION['auth']['id'])));
	$token = $tk->input();
	require $_SERVER["DOCUMENT_ROOT"].'/template/general/listtickets.tpl';
endif;