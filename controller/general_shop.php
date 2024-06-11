<?php
/**
*
* Субконтроллер, настройка самого магазина
*
* Файлы хранятся:
* \controller\general\shop\
* \template\general\shop\
*
*/

$db = $this->info_db;
$cost = $this->info_cost;
$icons = $this->info_icons;
$arr = $this->info_menu_shop;

if (empty($_GET['page2']) or empty($_GET['shop'])):
	header("Location: /shops/");
	exit;
endif;

// Проверяем фильтром пришедшие данные
$check_page = new filter();
$page = $check_page->check('page2','get','regexp','~^[a-z]{1,20}$~');
$shop = $check_page->check('shop','get','regexp','~^[-a-z0-9(.)]{3,20}$~');
// Проверяем фильтром пришедшие данные

if (!$shop):
	header("Location: /shops/");
	exit;
else:
	$getshop_control = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
	if (!$getshop_control):
		header("Location: /shops/");
		exit;
	endif;
endif;

// Подгружаем нужный субконтроллер
if ($page):

	$sub_controller = $_SERVER["DOCUMENT_ROOT"].'/controller/general/shop/'.$page.'.php';
	if (file_exists($sub_controller)):
		require $sub_controller;
	else:
		//echo "Ошибка, субконтроллер не найден";
		header("Location: /");
	endif;
else:
	//echo "Ошибка, не пройдена валидация субконтроллера";
	header("Location: /");
endif;
// Подгружаем нужный субконтроллер

// Формируем меню
$mnu = new menu();
$this->menu = $mnu->gen($arr,'page2');
// Формируем меню