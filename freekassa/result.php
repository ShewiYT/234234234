<? 
include(htmlspecialchars($_SERVER["DOCUMENT_ROOT"]).'/class/database.class.php');
include(htmlspecialchars($_SERVER["DOCUMENT_ROOT"]).'/config.php');
//Необходимые данные для ФриКассы
$merchant_id = MERCH_ID; // ID магазина во ФриКассе
$merchant_secret = SECRET_2; // Секретное слово №2
//Необходимые данные для ФриКассы
$db = new database(BASE_DB, "mysql", BASE_SERVER, BASE_USER, BASE_PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
///////////////////////////////////////////////////////////////////////////////////////////////////////

//Проверка на взлом
/*function getIP() {
if(isset($_SERVER['HTTP_X_REAL_IP'])) return $_SERVER['HTTP_X_REAL_IP'];
   return $_SERVER['REMOTE_ADDR'];
}
if (!in_array(getIP(), array('136.243.38.147', '136.243.38.149', '136.243.38.150', '136.243.38.151', '136.243.38.189'))) {
    die("hacking attempt!");
} */
$sign = md5($merchant_id.':'.$_REQUEST['AMOUNT'].':'.$merchant_secret.':'.$_REQUEST['MERCHANT_ORDER_ID']);
if ($sign != $_REQUEST['SIGN']) {
    die('wrong sign');
}
//Проверка на взлом

$get_order = $db->row("SELECT * FROM shop_payments WHERE id_user = ? AND id = ? AND status = ?", array($_GET['us_account'], $_GET['us_idorder'], 'Не оплачен'));
// Если не существует такого заказа или он уже оплачен
if (empty($get_order)):
	$errorr = 'Ошибка проведения запроса.';
	echo $errorr;
	exit;
endif;
// Если не существует такого заказа или он уже оплачен
if ($_REQUEST['AMOUNT'] < $get_order['sum']) {
	//Если оплатили меньше, чем стоимость магазина.
	$ostatok = $get_order['sum'] - $_REQUEST['AMOUNT'];
	$update_ostatok = $db->update("UPDATE shop_payments SET sum = ? WHERE id = ?", array($ostatok, $_GET['us_idorder']));
	exit;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////
if ($_GET['us_type'] == 'reg') {
	// Создаём магазин
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['us_idorder']));
		// Рассчитываем время окончания аренды магазина
		$date = time();
		$sec_per_month = date("t")*86400;
		$sec_per_all_mounths = $sec_per_month * $get_order['count'];
		$final_date = date("Y-m-d H:i:s",$date + $sec_per_all_mounths);
		// Рассчитываем время окончания аренды магазина

		// Определяем максимальную позицию для каталога
		$catalog_position = $db->row("SELECT min(catalog_position) as max FROM shop");
		if (!$catalog_position):
			$catalog_position = 1;
		else:
			$catalog_position = $catalog_position['max'] - 1;

		endif;
		// Определяем максимальную позицию для каталога

		$insert_shop = $db->insert("INSERT INTO shop (id_user, domain, date, status, catalog_position) VALUES (?, ?, '$final_date', 'Работает', '$catalog_position')", array($_GET['us_account'], $get_order['domain']));

		$db->insert("INSERT INTO template (id_shop, meta_title, logo, background, template) VALUES (?, ?, ?, ?, ?)", array($insert_shop, 'RentShops.Ru', '/style/shop/css/templates/Assel/images/h-logo.png', '/style/shop/css/templates/Assel/images/bg.jpg', 'Assel'));
		
		die('YES');
	// Создаём магазин
}
if ($_GET['us_type'] == 'next') {
		// Продлеваем магазин
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['us_idorder']));

		// Достаём информацию о магазине по заявке
		$get_shop = $db->row("SELECT * FROM shop WHERE domain = ?", array($get_order['domain']));
		// Достаём информацию о магазине по заявке


		// Рассчитываем время окончания аренды магазина
		if (strtotime($get_shop['date']) > time()):
			$date = strtotime($get_shop['date']);
		else:
			$date = time();
		endif;

		$sec_per_month = date("t")*86400;
		$sec_per_all_mounths = $sec_per_month * $get_order['count'];
		$final_date = date("Y-m-d H:i:s",$date + $sec_per_all_mounths);
		// Рассчитываем время окончания аренды магазина


		$updaterow = $db->update("UPDATE shop SET date = '$final_date' WHERE domain = ?", array($get_order['domain']));
		die('YES');
	// Продлеваем магазин
}
if ($_GET['us_type'] == 'up') {
	// Поднимаем магазин в каталоге
		$updaterow = $db->update("UPDATE shop_payments SET status = ? WHERE id = ?", array("Оплачен", $_GET['us_idorder']));


		// Определяем максимальную позицию для каталога
		$catalog_position = $db->row("SELECT max(catalog_position) as max FROM shop");
		if (!$catalog_position):
			$catalog_position = 0;
		else:
			$catalog_position = $catalog_position['max'] + 1;
		endif;
		// Определяем максимальную позицию для каталога


		$updaterow = $db->update("UPDATE shop SET catalog_position = ? WHERE domain = ?", array($catalog_position, $get_order['domain']));

		die('YES');
	// Поднимаем магазин в каталоге
}
///////////////////////////////////////////////////////////////////////////////////////////////////////
?>