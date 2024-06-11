<?php
session_start();

// Автоматический подгрузчик классов
require $_SERVER["DOCUMENT_ROOT"].'/class/autoloader.class.php';
spl_autoload_register(array('autoloader', 'loadPackages'));
// Автоматический подгрузчик классов

// Инициализируем шаблонизатор
$tpl = new template();
// Инициализируем шаблонизатор

// Подгружаем конфиг файл
require $_SERVER["DOCUMENT_ROOT"].'/config.php';
// Подгружаем конфиг файл

// Передаём параметры скрипту
$tpl->info_db = new database(BASE_DB, "mysql", BASE_SERVER, BASE_USER, BASE_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
$tpl->info_icons = $icons; unset($icons);
$tpl->info_cost = $cost; unset($cost);
$tpl->info_menu_no_auth = $menu_main_no_auth; unset($menu_main_no_auth);
$tpl->info_menu_auth = $menu_main_auth; unset($menu_main_auth);
$tpl->info_menu_shop = $menu_shop; unset($menu_shop);
// Передаём параметры скрипту

// Определяем загрузчик
$dmn = new domain();
$domain = $dmn->check(DOMAIN,$_SERVER['HTTP_HOST']);
$tpl->domain = $domain;
// Определяем загрузчик

// Определяем контроллер и шаблон
if ($domain == 'domain'):
		if (!empty($_GET['ajax']) and $_GET['ajax'] == 'ajax'):
			$tpl->controller = $tpl->controller("general_ajax");
			$tpl->template = $tpl->template("template_general_ajax");
		else:
			$tpl->controller = $tpl->controller("general");
			$tpl->template = $tpl->template("template_general");
		endif;

else:

	if (!empty($_GET['ajax']) and $_GET['ajax'] == 'ajax'):
		$tpl->controller = $tpl->controller("general_ajax");
		$tpl->template = $tpl->template("template_general_ajax");
	else:
		$tpl->controller = $tpl->controller("shop");
		$tpl->template = $tpl->template("template_shop");
	endif;

endif;
// Определяем контроллер и шаблон

echo $tpl->template;