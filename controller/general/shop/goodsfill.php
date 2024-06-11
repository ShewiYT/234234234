<?php
$this->title = 'Пополнение товара';

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


$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

$get_good = $db->row("SELECT * FROM goods WHERE id = ? AND id_shop = ?", array($_GET['id'], $get_shop['id']));

if (!$get_shop or !$get_good):
	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	exit;	
endif;





// Загружаем товар
if (
	!empty($_POST['token']) and 
	$tk->check($_POST['token'])
	):




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



	header('Location: /shops/settings/'.$_GET['shop'].'/goods/');
	exit;


endif;
// Загружаем товар





$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/goodsfill.tpl';