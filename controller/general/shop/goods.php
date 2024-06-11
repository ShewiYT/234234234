<?php
$this->title = 'Список товаров';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();
$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

if (!$get_shop):
	exit;
endif;
$err[89] = '';
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));
$get_category = $db->rows("SELECT * FROM category WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

$check_values = new filter();

$get_goods = $db->rows("SELECT
  goods.name,
  goods.ico,
  goods.cost_usd,
  goods.cost_rub,
  goods.description,
  goods.`position`,
  goods.id
FROM goods
WHERE goods.id_shop = ?
GROUP BY goods.ico,
         goods.id
ORDER BY goods.`position`", array("replace" => array($get_shop['id'])));

// Вычисляем число непроданных товаров
foreach ($get_goods as $key => $value):
  $count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
  $get_goods[$key]['count'] = $count_q['count'];
endforeach;
// Вычисляем число непроданных товаров


if (!empty($get_goods)):
  // Объеденение массивов и сортировка
  $items = array_merge($get_goods);
  foreach($items as $key=>$value){
  	$data_position[$key]=$value['position'];
  }
  array_multisort($data_position, SORT_NUMERIC, $items);
  // Объеденение массивов и сортировка
endif;

if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	$check_values->check('category','post','regexp','#^([A-zА-я \-:]*)$#ui')
	):
	$insert_сategory = $db->insert("INSERT INTO category (id_shop, name) VALUES (?, ?)", array($get_shop['id'], $_POST['category']));
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
endif;

if ($check_values->check('remcat','get','float',array('min' => 1, 'max' => 100000))):
	$get_cat_in_goods = $db->row("SELECT * FROM goods WHERE id_shop = ? AND category = ?", array($get_shop['id'], $_GET['remcat']));
	if (!$get_cat_in_goods):
		$deletecat = $db->delete("DELETE FROM category WHERE id = ? AND id_shop = ?", array($_GET['remcat'], $get_shop['id']));
		header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	else:
		$err[89] = '<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Сначала удалите товары, которые связаны с данной категорией!
	</div>';
	endif;
endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/goods.tpl';