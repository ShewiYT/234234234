<?php
$this->title = 'Управление скидочными купонами';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$err[0] = '';
$err[1] = '';
$err[2] = '';

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

$tk = new token();
$check_values = new filter();

// Создаём скидку
if (
	!empty($_POST['token']) and 
	!empty($_POST['goods']) and 
	$tk->check($_POST['token']) and 
	$check_values->check('percent','post','int',array('min' => 1, 'max' => 90)) and 
	$check_values->check('count','post','int',array('min' => 1, 'max' => 100000))
	):


	// Формируме запись ID товаров
	foreach ($_POST['goods'] as $key => $value):

		if ($value > 0 and $value < 100000000):
			$goods_arr[] = $value;
		endif;
	endforeach;



	if (!empty($goods_arr)):
		$goods_serial = serialize($goods_arr);
	endif;
	// Формируме запись ID товаров


	// Проверяем комментарий
	if (!empty($_POST['comment'])):
		$comment = htmlentities($_POST['comment'], ENT_QUOTES, "UTF-8");
	else:
		$comment = null;
	endif;
	// Проверяем комментарий

	$code = hash('adler32',uniqid(rand(),1));

	// Записываем скидку в базу
	if (!empty($goods_serial)):

		$insert_discounts = $db->insert("INSERT INTO discounts (id_shop, percent, count, comment, items, code) VALUES (?, ?, ?, ?, ?, ?)", array($get_shop['id'], $_POST['percent'], $_POST['count'], $comment, $goods_serial, $code));
		$err[2] = '<div class="alert alert-success">
		<button class="close" data-dismiss="alert" type="button">×</button>Скидочный купон был успешно создан!
		</div>';
	endif;
	// Записываем скидку в базу
	
	//header('Location: /shops/settings/'.$_GET['shop'].'/discount/');

endif;
// Создаём скидку




if (!empty($_POST['token'])):

	if (empty($_POST['percent']) or strlen($_POST['percent']) < 1 or strlen($_POST['percent']) > 90):
		$err[0] = '<div class="alert alert-danger">
		<button class="close" data-dismiss="alert" type="button">×</button>В целях безопасности, вы не можете создавать купоны, у которых процент скидки меньше чем 1% и больше 90%
		</div>';
	endif;
	
	if (empty($_POST['goods'])):
		$err[1] = '<div class="alert alert-danger">
		<button class="close" data-dismiss="alert" type="button">×</button>Вы не выбрали ни одного товара, для которого действовал бы данный купон
		</div>';
	endif;

endif;

$get_discounts = $db->rows("SELECT * FROM discounts WHERE id_shop = ? ORDER BY id DESC", array("replace" => array($get_shop['id'])));
$get_goods = $db->rows("SELECT * FROM goods WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/discount.tpl';