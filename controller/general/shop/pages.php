<?php
$this->title = 'Управление страницами';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

$err[0] = '';

if (!empty($_GET['delpage']) and
	$check_values->check('delpage','get','float',array('min' => 1, 'max' => 100000000000))):
		$deletepage = $db->delete("DELETE FROM pages WHERE id = ? AND id_shop = ?", array($_GET['delpage'], $get_shop['id']));
		if ($deletepage):
			header("Location: /shops/settings/".$_GET['shop']."/pages/");
		endif;
	endif;

if (
  !empty($_POST['token']) and 
  $tk->check($_POST['token'])
  ):
	//Создание страницы
	if (!empty($_POST['createpage'])):
		if (!empty($_POST['namepage']) and
		$check_values->check('namepage','post','regexp','#^([A-zА-я0-9 ?!\-:.,]*)$#ui') and
		!empty($_POST['prefixpage']) and
		$check_values->check('prefixpage','post','regexp','#^([A-z0-9-]*)$#ui') and
		!empty($_POST['contentpage'])
		):
			$createpage = $db->insert("INSERT INTO pages (name, prefix, id_shop, content) VALUES (?, ?, ?, ?)", array($_POST['namepage'], $_POST['prefixpage'], $get_shop['id'], $_POST['contentpage']));
			if ($createpage):
				$err[0] = '<div class="alert alert-success">
				<button class="close" data-dismiss="alert" type="button">×</button>Страница <strong>'.$_POST['namepage'].'</strong> была успешно создана!
				</div>';
			endif;
		else:
			$err[0] = '<div class="alert alert-danger">
			<button class="close" data-dismiss="alert" type="button">×</button>Вы ввели недопустимую информацию при создании новой страницы!
			</div>';
		endif;
	endif;
	//Создание страницы
	
	//Редактирование страницы
	if (!empty($_POST['editpage'])):
		if (!empty($_POST['pagename']) and
			$check_values->check('pagename','post','regexp','#^([A-zА-я0-9 ?!\-:.,]*)$#ui') and
			!empty($_POST['pageprefix']) and
			$check_values->check('pageprefix','post','regexp','#^([A-z0-9-]*)$#ui') and
			!empty($_POST['pagecontent']) and
			$check_values->check('idpage','post','float',array('min' => 1, 'max' => 10000000000))
			):
	
			$updatepage = $db->update("UPDATE `pages` SET `name` = ?, `content` = ?, `prefix` = ? WHERE `id` = ? AND `id_shop` = ?", array($_POST['pagename'], $_POST['pagecontent'], $_POST['pageprefix'], $_POST['idpage'], $get_shop['id']));
			if ($updatepage):
				$err[0] = '<div class="alert alert-success">
				<button class="close" data-dismiss="alert" type="button">×</button>Страница <strong>'.$_POST['pagename'].'</strong> была успешно отредактирована!
				</div>';
			endif;
		else:
			$err[0] = '<div class="alert alert-danger">
				<button class="close" data-dismiss="alert" type="button">×</button>Вы ввели недопустимую информацию при редактировании страницы!
				</div>';
		endif;
	endif;
	//Редактирование страницы
endif;

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));
$get_newpages = $db->rows("SELECT * FROM pages WHERE id_shop = ?", array("replace" => array($get_shop['id'])));

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/pages.tpl';