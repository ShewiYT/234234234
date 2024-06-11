<?php
$this->title = 'RENTSHOPS.RU - Аренда онлайн-магазинов';



$get_stat_full_rub = $db->row("SELECT sum(sum) as sum FROM orders WHERE method != 'wmz' AND status = 'Оплачен'");
if (!$get_stat_full_rub['sum']):
	$get_stat_full_rub['sum'] = 0;
endif;

$get_stat_full_usd = $db->row("SELECT sum(sum) as sum FROM orders WHERE method = 'wmz' AND status = 'Оплачен'");
if (!$get_stat_full_usd['sum']):
	$get_stat_full_usd['sum'] = 0;
endif;


$dollar_cost = $cost['dollar'] * $get_stat_full_usd['sum']; // Стоимость доллара рассчитывается по курсу нацбанка РФ

$rub_plus_usd = $get_stat_full_rub['sum'] + $dollar_cost;

$total_sum = number_format($rub_plus_usd, 0, ' ', ' ');

require $_SERVER["DOCUMENT_ROOT"].'/template/general/main.tpl';