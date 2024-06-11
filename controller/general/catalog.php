<?php
$this->title = 'Список наших магазинов';


$getrows = $db->rows("SELECT * FROM template INNER JOIN shop ON template.id_shop = shop.id ORDER BY shop.catalog_position LIMIT 10"); // Список магазинов каталога
$getmax = $db->row("SELECT max(catalog_position) as max FROM shop"); // Максимальный ID




if (!empty($_SESSION['auth'])):

	$myshops = $db->rows("SELECT * FROM shop WHERE id_user = ?", array("replace" => array($_SESSION['auth']['id'])));
	$myshops_arr = '';
	foreach ($myshops as $key => $value):
		if ($value['catalog_position'] < $getmax['max']-9):
			$myshops_arr[$key] = $value;
		endif;
	endforeach;

endif;


require $_SERVER["DOCUMENT_ROOT"].'/template/general/catalog.tpl';