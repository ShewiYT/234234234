<?php
/**
*
* Контроллер магазина (главной части)
*
* Файлы хранятся:
* \controller\general\
* \template\general\
*
*/
$db = $this->info_db;
$cost = $this->info_cost;

// Если не передан, то отправляем на main
if (empty($_GET['page'])):
	$_GET['page'] = 'main';
	$page = 'main';
endif;
// Если не передан, то отправляем на main

// Проверяем фильтром пришедшие данные
$check_page = new filter();
if (empty($page)):
	$page = $check_page->check('page','get','regexp','~^[a-z]{1,20}$~');
endif;
// Проверяем фильтром пришедшие данные

// Удаление всех не оплаченных магазинов в течении 14 суток
$del_per = DEL_NOT_PAY;
$deleteshop_reg = $db->delete("DELETE FROM shop WHERE status != ? AND DATE_ADD(date, INTERVAL $del_per DAY) < CURDATE()", array("заглушка"));
// Удаление всех не оплаченных магазинов в течении 14 суток

// Подгружаем нужный субконтроллер
if ($page):
	$sub_controller = $_SERVER["DOCUMENT_ROOT"].'/controller/general/'.$page.'.php';
	if (file_exists($sub_controller)):
		require $sub_controller;
	else:
		//echo "Ошибка, субконтроллер не найден";
		header('Location: /');
	endif;
else:
	//echo "Ошибка, не пройдена валидация субконтроллера";
	header('Location: /');
endif;
// Подгружаем нужный субконтроллер

// Формируем меню
if (empty($_SESSION['auth'])):
	$arr = $this->info_menu_no_auth;
else:
	$arr = $this->info_menu_auth;
endif;

$mnu = new menu();
$this->menu = $mnu->gen($arr,'page');
// Формируем меню