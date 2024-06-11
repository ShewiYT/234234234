<?php

if (empty($_GET['code']) or empty($_SESSION['yd']['shop_id'])):
	header('Location: /');
	exit;
endif;


$get_shop = $db->row("SELECT * FROM shop WHERE id = ?", array($_SESSION['yd']['shop_id']));
if (!$get_shop):
	exit;
endif;

$get_yandex = $db->row("SELECT * FROM payment_yandex WHERE id_shop = ?", array($get_shop['id']));
if ($get_yandex):
	exit;
endif;




$ym = new YandexMoney(YD_CLIENT_ID);
// Получаем токен
$toke = $ym->receiveOAuthToken($_GET['code'],YD_REDIRECT_URI,YD_CLIENT_SECRET);
// Получаем токен


        if ($toke->isSuccess()) {
            $token = $toke->getAccessToken();
        } else {
            print "Error: " . $toke->getError();
            exit;
        }

$cash = explode(".", $token);

// Записываем данные в базу
$insertrow = $db->insert("INSERT INTO payment_yandex (id_shop, login, token) VALUES (?, ?, ?)", array($get_shop['id'], $cash['0'], $token));
// Записываем данные в базу

unset($_SESSION['yd']);
header('Location: /shops/settings/'.$get_shop['domain'].'/payment/');