<?php
$this->title = 'Настройки дизайна магазина';

if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;
$tk = new token();
$check_values = new filter();

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));

$err[0] = '';

if (!empty($_GET['delblok']) and
	$check_values->check('delblok','get','float',array('min' => 1, 'max' => 100000000000))):
		$deleteblok = $db->delete("DELETE FROM other_bloks WHERE id = ? AND id_shop = ?", array($_GET['delblok'], $get_shop['id']));
		if ($deleteblok):
			header("Location: /shops/settings/".$_GET['shop']."/texts/");
		endif;
	endif;

// Перезаписываем информацию
if (
  !empty($_POST['token']) and 
  $tk->check($_POST['token'])
  ):
  
//Изменение дизайна
if (!empty($_POST['template'])):
	if ($_POST['template'] == 'light' or $_POST['template'] == 'lequeshop' or $_POST['template'] == 'BlackRed' or $_POST['template'] == 'MinKex' or $_POST['template'] == 'Assel'):
		$updaterow = $db->update("UPDATE template SET template = ? WHERE id_shop = ?", array($_POST['template'], $get_shop['id']));
		$err[0] = '<div class="alert alert-success">
	<button class="close" data-dismiss="alert" type="button">×</button>Выбранный дизайн успешно сохранен!
	</div>';
	else:
		$err[0] = '<div class="alert alert-danger">
	<button class="close" data-dismiss="alert" type="button">×</button>Выбранного Вами дизайна не существует!
	</div>';
	endif;
else:
//Изменение дизайна

//Обработка включения/выключения блоков
if (!empty($_POST['editbloks'])):
	if (!empty($_POST['lastbuy']) and $check_values->check('lastbuy','post','float',array('min' => 1, 'max' => 2)) or 
		!empty($_POST['cates']) and $check_values->check('cates','post','float',array('min' => 1, 'max' => 2)) or 
		!empty($_POST['searchname']) and $check_values->check('searchname','post','float',array('min' => 1, 'max' => 2)) and
		!empty($_POST['power']) and $check_values->check('power','post','float',array('min' => 1, 'max' => 2))
		):
	
		if ($get_shop['status'] == 'Заблокирован'):
			$err[0] = '<div class="alert alert-danger">
			<button class="close" data-dismiss="alert" type="button">×</button>Вы не можете вносить правки в этот магазин, так как он был заблокирован администрацией
			</div>';
		else:
			if ($_POST['power'] == '1'): $power_s = 'Выключен'; else: $power_s = 'Работает'; endif;
			if (!empty($_POST['cause'])):
				$power = $db->update("UPDATE shop SET status = ?, causeoff = ? WHERE domain = ?", array($power_s, $_POST['cause'], $get_shop['domain']));
			else:
				$power = $db->update("UPDATE shop SET status = ? WHERE domain = ?", array($power_s, $get_shop['domain']));
			endif;
	
			$lastbuy = $db->update("UPDATE template SET lastbuy = ? WHERE id_shop = ?", array($_POST['lastbuy'], $get_shop['id']));
			$cates = $db->update("UPDATE template SET cates = ? WHERE id_shop = ?", array($_POST['cates'], $get_shop['id']));
			$searchname = $db->update("UPDATE template SET searchname = ? WHERE id_shop = ?", array($_POST['searchname'], $get_shop['id']));
			$err[0] = '<div class="alert alert-success">
			<button class="close" data-dismiss="alert" type="button">×</button>Выбранная вами информация была успешно изменена!
			</div>';
		endif;
	endif;
else:
//Обработка включения/выключения блоков

//Создание блока
if (!empty($_POST['createbloks'])):
	if (!empty($_POST['nameblok']) and
		$check_values->check('nameblok','post','regexp','#^([A-zА-я0-9 \-:.,]*)$#ui') and
		!empty($_POST['show']) and
		$check_values->check('show','post','float',array('min' => 1, 'max' => 2)) and
		!empty($_POST['contentblok'])
		):
	
		$createblok = $db->insert("INSERT INTO other_bloks (name, id_shop, content) VALUES (?, ?, ?)", array($_POST['nameblok'], $get_shop['id'], $_POST['contentblok']));
		if ($createblok):
			$err[0] = '<div class="alert alert-success">
			<button class="close" data-dismiss="alert" type="button">×</button>Блок <strong>'.$_POST['nameblok'].'</strong> был успешно создан!
			</div>';
		endif;
	else:
		$err[0] = '<div class="alert alert-danger">
			<button class="close" data-dismiss="alert" type="button">×</button>Вы ввели недопустимую информацию при создании нового блока!
			</div>';
	endif;
else:
//Создание блока

//Редактирование созданного блока
if (!empty($_POST['editblok'])):
	if (!empty($_POST['blokname']) and
		$check_values->check('blokname','post','regexp','#^([A-zА-я0-9 \-:.,]*)$#ui') and
		!empty($_POST['blokshow']) and
		$check_values->check('blokshow','post','float',array('min' => 1, 'max' => 2)) and
		!empty($_POST['blokcontent']) and
		$check_values->check('idblok','post','float',array('min' => 1, 'max' => 10000000000))
		):
	
		$updateblok = $db->update("UPDATE `other_bloks` SET `name` = ?, `content` = ?, `show` = ? WHERE `id` = ? AND `id_shop` = ?", array($_POST['blokname'], $_POST['blokcontent'], $_POST['blokshow'], $_POST['idblok'], $get_shop['id']));
		if ($updateblok):
			$err[0] = '<div class="alert alert-success">
			<button class="close" data-dismiss="alert" type="button">×</button>Блок <strong>'.$_POST['blokname'].'</strong> был успешно отредактирован!
			</div>';
		endif;
	else:
		$err[0] = '<div class="alert alert-danger">
			<button class="close" data-dismiss="alert" type="button">×</button>Вы ввели недопустимую информацию при редактировании блока!
			</div>';
	endif;
else:
//Редактирование созданного блока

//Редактирование основной информации
if (!empty($_POST['editglobal'])):

	if (!empty($_POST['title'])):
		$meta_title = $_POST['title'];
	else:
		$meta_title = null;
	endif;


	if (!empty($_POST['meta_description'])):
		$meta_description = $_POST['meta_description'];
	else:
		$meta_description = null;
	endif;

	if (!empty($_POST['meta_keywords'])):
		$meta_keywords = $_POST['meta_keywords'];
	else:
		$meta_keywords = null;
	endif;

	if (!empty($_POST['favicon'])):
		$meta_favicon = $_POST['favicon'];
	else:
		$meta_favicon = null;
	endif;

	if (!empty($_POST['logo'])):
		$logo = $_POST['logo'];
	else:
		$logo = null;
	endif;

	if (!empty($_POST['background'])):
		$background = $_POST['background'];
	else:
		$background = null;
	endif;

	if (!empty($_POST['text_scripts'])):
		$texts_scripts = $_POST['text_scripts'];
	else:
		$texts_scripts = null;
	endif;

	if (!empty($_POST['vk'])):
		$vk = $_POST['vk'];
	else:
		$vk = null;
	endif;

	if (!empty($_POST['soglas'])):
		$soglas = $_POST['soglas'];
	else:
		$soglas = null;
	endif;

	if (!empty($_POST['support'])):
		$support = $_POST['support'];
	else:
		$support = null;
	endif;

	$updaterow = $db->update(
		"UPDATE template SET meta_title = ?, 
	meta_description = ?, 
	meta_keywords = ?, 
	meta_favicon = ?,
	logo = ?,
	background = ?,
	texts_scripts = ?,
	vk = ?,
	soglas = ?,
	support = ?
	WHERE id_shop = ?", 
	array(
		$meta_title, 
		$meta_description, 
		$meta_keywords, 
		$meta_favicon,
		$logo,
		$background,
		$texts_scripts,
		$vk,
		$soglas,
		$support,
		$get_shop['id']
		)
	);
  

	$err[0] = '<div class="alert alert-success">
		<button class="close" data-dismiss="alert" type="button">×</button>Основные настройки магазина успешно сохранены!
		</div>';

endif;
//Редактирование основной информации
endif;
endif;
endif;
endif;
endif;
// Перезаписываем информацию

$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array($_GET['shop'], $_SESSION['auth']['id']));
$get_bloks = $db->rows("SELECT * FROM other_bloks WHERE id_shop = ?", array("replace" => array($get_shop['id'])));
$get_template = $db->row("SELECT * FROM template WHERE id_shop = ?", array($get_shop['id']));

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/shop/texts.tpl';