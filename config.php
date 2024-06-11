<?php

// Домен сайта
define("DOMAIN", "rentshops.ru");
// Домен сайта


// Пароль от админки
// http://домен/cpanel/ПАРОЛЬ
// В пароле могут использоваться A-z 0-9, до 150 символов
define('CPANEL_PASSWORD', 'verysupermegapassword641');
// Пароль от админки


// Соединение с базой данных
define("BASE_SERVER", "127.0.0.1");
define("BASE_USER", "root");
define("BASE_PASSWORD", "verysupermegapassword641");
define("BASE_DB", "shop");
// Соединение с базой данных

// Парсим курс доллара
$valute = '';
$course = @simplexml_load_file("http://www.cbr.ru/scripts/XML_daily.asp?date_req=".date("d/m/Y"));
if ($course):
	$xml = $course->xpath("//Valute[@ID='R01235']");
	$valute = strval($xml[0]->Value);
	$valute = str_replace(',', '.', $valute);
	$valute = number_format($valute, 2, '.', '');
endif;
	if ($valute > 30 and $valute < 100):
		$cost['dollar'] = $valute;
	else:
		$cost['dollar'] = 70.46; //Ручная настройка курса
	endif;
// Парсим курс доллара

// Стоимость аренды
$cost[1] = 49.00; // При оплате 1-го месяца
$cost[3] = 44.00; // При оплате 3-4-5 месяцев
$cost[6] = 39.00; // При оплате 6-7-8-9-10-11-12 месяцев
$cost['catalog_up'] = 35.00; // Стоимость поднятия в каталоге
$cost['catalog_up_wmz'] = 2.00; // Стоимость поднятия в каталоге в WMZ
// Стоимость аренды

//Данные Free-kassa
define("MERCH_ID", "22164"); //ID магазина в системе Free-kassa
define("SECRET_1", "me80vn29"); // Секретное слово 1 в системе Free-kassa
define("SECRET_2", "Desty"); //Секретное слово 2 в системе Free-kassa
//Данные Free-kassa

// Данные WebMoney
// Оплата аренды через webmoney
define("WM_PAY", 1); // 1 - включено, 0 - выключено
define("WM_WMID", "112205224170"); // WMID
define("WM_WMR", "R331770443226"); // WMR кошелёк
define("WM_WMZ", "Z235592820813"); // WMZ кошелёк
define("WM_KEY_PASSW", "webmoneypass641"); // Пароль от файла ключей
// Файл ключей должен лежать в корне сайта (рядом с index.php, config.php) и иметь название вида: WMID_key.wmk (например: '365447789304_key.wmk')
// Данные WebMoney


// Данные Qiwi
// Оплата аренды через qiwi
define("QIWI_PAY", 0); // 1 - включено, 0 - выключено
define("QIWI_LOGIN", "79835346641");
define("QIWI_PASSWORD", "qiwipass641");
// Данные Qiwi


// Данные yandex
// 1) https://sp-money.yandex.ru/myservices/new.xml
// 2) Использовать проверку подлинности приложения
// 3) После создания приложения появится OAuth2 client_secret

define ('YD_CLIENT_ID', '9EB30B5042D71C26FBCF8039CD499749CB7744ECEF9B09C3053DDDB4CA3AB431'); // Название вашего приложения
define ('YD_REDIRECT_URI', 'http://rentshops.ru/?ajax=ajax&page=addyandex'); // Redirect URI (просто адрес сайта)
define ('YD_CLIENT_SECRET', 'B2E0E0EF63D8AA8C898E8D07908D5D9FE0B67D731753F64548A130C8FF732DEF80D5157770C6B7B8FE198774FECD9E6D5185BEBB3865823AC06D23053E9D8497'); // OAuth2 client_secret
// Данные yandex





// Другие настройки
define("DEL_NOT_PAY", 14); // Через какое количество дней удалять неоплаченные магазины (9999 - не удалять :) 
define("EMAIL_TO_SEND", 'support@rentshops.ru'); // От кого будут отправляться все письма
// Другие настройки




























// Это лучше не трогать


// Список иконок
$icons[] = 'vk';
$icons[] = 'odnoklassniki';
$icons[] = 'fb';
$icons[] = 'twitter';
$icons[] = 'livejournal';
$icons[] = 'instagram';
$icons[] = 'youtube';
$icons[] = 'skype';
$icons[] = 'icq';
$icons[] = 'likest';
$icons[] = 'likest2';
$icons[] = 'olike';
$icons[] = 'turboliker';
$icons[] = 'heart';
$icons[] = 'vtope';
$icons[] = 'email';
$icons[] = 'mailru';
$icons[] = 'gmail';
$icons[] = 'hotmail';
$icons[] = 'yahoo';
$icons[] = 'yandex';
$icons[] = 'vine';
$icons[] = 'blogger';
$icons[] = 'google';
$icons[] = 'google_plus';
$icons[] = 'google_talk';
$icons[] = 'myspace';
$icons[] = 'linkedin';
$icons[] = 'foursquare';
$icons[] = 'pinterest';
$icons[] = 'appstore';
$icons[] = 'deviantart';
$icons[] = 'dribble';
$icons[] = 'dropbox';
$icons[] = 'ebay';
$icons[] = 'itunes';
$icons[] = 'lastfm';
$icons[] = 'opera';
$icons[] = 'origin';
$icons[] = 'psn';
$icons[] = 'steam';
$icons[] = '4game';
$icons[] = 'gta5';
$icons[] = 'wot';
$icons[] = 'skydrive';
$icons[] = 'soundcloud';
$icons[] = 'spotifiy';
$icons[] = 'fotostrana';
$icons[] = 'loveplanet';
$icons[] = 'mamba';
$icons[] = 'nasimke';
// Список иконок



// Меню главной страницы без авторизации
$menu_main_no_auth[0]['name'] = 'Главная';
$menu_main_no_auth[0]['url'] = 'main';
$menu_main_no_auth[0]['position'] = '1';

$menu_main_no_auth[1]['name'] = 'Авторизация';
$menu_main_no_auth[1]['url'] = 'auth';
$menu_main_no_auth[1]['position'] = '2';

$menu_main_no_auth[4]['name'] = 'Регистрация';
$menu_main_no_auth[4]['url'] = 'register';
$menu_main_no_auth[4]['position'] = '3';

$menu_main_no_auth[2]['name'] = 'О сервисе';
$menu_main_no_auth[2]['url'] = 'about';
$menu_main_no_auth[2]['position'] = '4';

$menu_main_no_auth[3]['name'] = 'FAQ';
$menu_main_no_auth[3]['url'] = 'faq';
$menu_main_no_auth[3]['position'] = '5';

$menu_main_no_auth[5]['name'] = 'Наши магазины';
$menu_main_no_auth[5]['url'] = 'catalog';
$menu_main_no_auth[5]['position'] = '6';
// Меню главной страницы без авторизации

// Меню главной страницы с авторизацией
$menu_main_auth[0]['name'] = 'Главная';
$menu_main_auth[0]['url'] = 'main';
$menu_main_auth[0]['position'] = '1';

$menu_main_auth[1]['name'] = 'Личный кабинет';
$menu_main_auth[1]['url'] = 'profile';
$menu_main_auth[1]['position'] = '2';

$menu_main_auth[6]['name'] = 'Мои магазины';
$menu_main_auth[6]['url'] = 'shops';
$menu_main_auth[6]['position'] = '3';

$menu_main_auth[4]['name'] = 'FAQ';
$menu_main_auth[4]['url'] = 'faq';
$menu_main_auth[4]['position'] = '4';

$menu_main_auth[2]['name'] = 'О сервисе';
$menu_main_auth[2]['url'] = 'about';
$menu_main_auth[2]['position'] = '5';

$menu_main_auth[3]['name'] = 'Наши магазины';
$menu_main_auth[3]['url'] = 'catalog';
$menu_main_auth[3]['position'] = '6';
// Меню главной страницы с авторизацией

// Меню страницы управления магазином
$menu_shop[0]['name'] = 'Статистика магазина';
$menu_shop[0]['url'] = 'statistics';
$menu_shop[0]['position'] = '1';

$menu_shop[1]['name'] = 'Ваши заказы';
$menu_shop[1]['url'] = 'orders';
$menu_shop[1]['position'] = '2';

$menu_shop[2]['name'] = 'Все товары';
$menu_shop[2]['url'] = 'goods';
$menu_shop[2]['position'] = '3';

$menu_shop[3]['name'] = 'Скидочные купоны';
$menu_shop[3]['url'] = 'discount';
$menu_shop[3]['position'] = '4';

$menu_shop[4]['name'] = 'Блокировки по IP';
$menu_shop[4]['url'] = 'ban';
$menu_shop[4]['position'] = '5';

$menu_shop[5]['name'] = 'Настройки магазина';
$menu_shop[5]['url'] = 'texts';
$menu_shop[5]['position'] = '6';

$menu_shop[6]['name'] = 'Настройки оплаты';
$menu_shop[6]['url'] = 'payment';
$menu_shop[6]['position'] = '7';
// Меню страницы управления магазином