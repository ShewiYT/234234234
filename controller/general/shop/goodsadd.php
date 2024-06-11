<?php
if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();
$check_values = new filter();


$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));

echo $_POST['title'];
echo $_POST['price_rub'];
echo $_POST['price_wmz'];
echo $_POST['min_count'];
echo $_POST['category'];

// Создаём товар
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	!empty($_POST['title']) and 
	$check_values->check('price_rub','post','float',array('min' => 1, 'max' => 100000)) and 
	$check_values->check('price_wmz','post','float',array('min' => 1, 'max' => 100000)) and 
	$check_values->check('min_count','post','float',array('min' => 1, 'max' => 100000)) and
	$check_values->check('category','post','float',array('min' => 1, 'max' => 10000000))
	):


	// Проверяем иконку
	if ($check_values->check('icon','post','regexp','~^[A-Za-z0-9_-]{1,20}$~')):
		$ico = $_POST['icon'];
	else:
		$ico = null;
	endif;
	// Проверяем иконку

	// Проверяем комментарий
	if (!empty($_POST['description'])):
		$description = htmlentities($_POST['description'], ENT_QUOTES, "UTF-8");
	else:
		$description = null;
	endif;
	// Проверяем комментарий
	
	if (!empty($_POST['image'])):
		$image = $_POST['image'];
	else:
		$image = 'null';
	endif;
	
	if (!empty($_POST['category'])):
		$get_category = $db->row("SELECT * FROM category WHERE id = ? AND id_shop = ?", array($_POST['category'], $get_shop['id']));
		if ($get_category):
			$category = $_POST['category'];
		else:
			die('Данная категория Вам не принадлежит!');
		endif;
	endif;

	// Определяем максимальную позицию товара
	$position_shop = $db->row("SELECT max(position) as max FROM goods WHERE id_shop = ?", array($get_shop['id']));
	if (!$position_shop):
		$position_sh = 0;
	else:
		$position_sh = $position_shop['max'] + 1;
	endif;
	// Определяем максимальную позицию товара

	$insert_goods = $db->insert("INSERT INTO goods (id_shop, name, cost_rub, cost_usd, min_count, ico, description, position, image, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", array($get_shop['id'], $_POST['title'], $_POST['price_rub'], $_POST['price_wmz'], $_POST['min_count'], $ico, $description, $position_sh, $image, $category));


	// Записываем загруженный товар
	foreach ($_FILES as $key => $value):
		
		if ($value['type'] == 'text/plain' and $value['error'] == 0):
			$file = file($value['tmp_name']);

			foreach ($file as $key => $value):
				$value = str_replace("\r\n",'',$value);
				$value = str_replace("\n",'',$value);
				if (!empty($value)):
					$insert_goods_object = $db->insert("INSERT INTO goods_object (id_goods, text) VALUES (?, ?)", array($insert_goods, $value));
				endif;
			endforeach;

		endif;

	endforeach;
	// Записываем загруженный товар


header('Location: /shops/settings/'.$_GET['shop'].'/goods/');

else:
	$err[89] = '<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Похоже, вы что-то упустили при создании товара. Попробуйте еще раз!
	</div>';
	$token = $tk->input();
	require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/goods.tpl';
endif;
// Создаём товар