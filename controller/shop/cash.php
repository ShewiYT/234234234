<?php
$this->title = 'Оплата заказа';

if (empty($_GET['idgood'])):
	header('Location: /');
	exit;
endif;

$tk = new token();

$get_shop = $db->row("SELECT * FROM shop WHERE id IN (SELECT id_shop FROM goods WHERE id = ?)", array(htmlspecialchars($_GET['idgood'])));

if (!$get_shop):
	header('Location: /');
	exit;
endif;

$get_good = $db->row("SELECT goods.id, goods.name, goods.cost_rub, goods.cost_usd, goods.min_count, goods.id_shop FROM goods WHERE goods.id = ? AND goods.id_shop = ?", array(htmlspecialchars($_GET['idgood']), $get_shop['id']));
$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($get_good['id']));

$get_webmoney = $db->row("SELECT * FROM payment_webmoney WHERE id_shop = ?", array($get_shop['id']));
$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
$get_qiwi = $db->row("SELECT * FROM payment_qiwi WHERE id_shop = ?", array($get_shop['id']));
$get_freekassa = $db->row("SELECT * FROM payment_freekassa WHERE id_shop = ?", array($get_shop['id']));

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/shop/cash.tpl';