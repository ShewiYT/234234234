<?php
$this->title = 'Редактирование товара';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

if (empty($_GET['id'])):
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	exit;
endif;

$tk = new token();
$check_values = new filter();

$err[4] = '';

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));
$get_good = $db->row("SELECT * FROM goods WHERE id = ? AND id_shop = ?", array($_GET['id'], $get_shop['id']));
$get_category = $db->rows("SELECT * FROM category WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

// Редактируем товар
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token']) and 
	!empty($_POST['title']) and 
	$check_values->check('price_rub','post','float',array('min' => 1, 'max' => 100000)) and 
	$check_values->check('price_wmz','post','float',array('min' => 1, 'max' => 100000)) and 
	$check_values->check('min_count','post','float',array('min' => 1, 'max' => 100000)) and
	$check_values->check('category','post','regexp','~^[0-9]{1,20}$~')
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
		$get_cate = $db->row("SELECT * FROM category WHERE id = ? AND id_shop = ?", array($_POST['category'], $get_shop['id']));
		if ($get_cate):
			$category = $_POST['category'];
		else:
			die('Данная категория Вам не принадлежит!');
		endif;
	endif;
	
	// Товар из формы
	if (!empty($_POST['accounts'])):

		$str = explode("\n", $_POST['accounts']);
		$str = str_replace(array("\n","\r"), '', $str);
		
			foreach ($str as $key => $value):

				if (!empty($value)):
					$insert_goods_object = $db->insert("INSERT INTO goods_object (id_goods, text) VALUES (?, ?)", array($_GET['id'], $value));
				endif;
			endforeach;

	endif;
	// Товар из формы


	// Записываем загруженный товар
	foreach ($_FILES as $key => $value):
		
		if ($value['type'] == 'text/plain' and $value['error'] == 0):
			$file = file($value['tmp_name']);

			foreach ($file as $key => $value):
				$value = str_replace("\r\n",'',$value);
				$value = str_replace("\n",'',$value);
				if (!empty($value)):
					$insert_goods_object = $db->insert("INSERT INTO goods_object (id_goods, text) VALUES (?, ?)", array($_GET['id'], $value));
				endif;
			endforeach;

		endif;

	endforeach;
	// Записываем загруженный товар


	$update_goods = $db->update("UPDATE goods SET name = ?, cost_rub = ?, cost_usd = ?, min_count = ?, ico = ?, description = ?, image = ?, category = ? WHERE id = ?", array($_POST['title'], $_POST['price_rub'], $_POST['price_wmz'], $_POST['min_count'], $ico, $description, $image, $category, $_GET['id']));

	if ($update_goods):
		header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	else:
		$err[4] = '<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Вы не обновили информацию о товаре!
	</div>';
	endif;

endif;
// Редактируем товар





$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/goodsedit.tpl';