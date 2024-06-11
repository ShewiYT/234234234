<?php
/**
*
* Контроллер главной страницы самого магазина
*
*
*
*/

$db = $this->info_db;

//Функция поиска URL
function request_url()
{
	$result = '';
	$result .= $_SERVER['SERVER_NAME'];
	$result2 = 'http://'.$_SERVER['REQUEST_URI'];
	$result .= parse_url($result2, PHP_URL_HOST);

  return $result;
}
$request_url = request_url();

// Если в текущем адресе нет нашей зоны, то значит это другой домен.
if (!preg_match("/.rentshops.ru/", $request_url)) {
	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array(request_url()));
}
else {
	$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($this->domain));
}

// Проверку на существование магазина
if (!$get_shop):
	header('Location: http://'.DOMAIN.'/');
	exit;
endif;

$get_category = $db->rows("SELECT * FROM category WHERE id_shop = ?", array("replace" => array($get_shop['id'])));
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));
$this->tpl_info = $get_template;

// Проверяем фильтром пришедшие данные
$check_page = new filter();
$page = $check_page->check('shop_page','get','regexp','~^[a-z]{1,20}$~');
// Проверяем фильтром пришедшие данные

// Подгружаем нужный субконтроллер
if ($page):

	$sub_controller = $_SERVER["DOCUMENT_ROOT"].'/controller/shop/'.$page.'.php';

	if (file_exists($sub_controller)):
		require $sub_controller;
	else:
		echo "Ошибка, субконтроллер не найден";
	endif;

else:
	require $_SERVER["DOCUMENT_ROOT"].'/controller/shop/main.php';
endif;
// Подгружаем нужный субконтроллер