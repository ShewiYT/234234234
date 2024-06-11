<?php
$this->title = 'Настройки профиля';


if (empty($_SESSION['auth'])):
	header('Location: /auth/');
	exit;
endif;

$tk = new token();

$get_user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));

$get_goods = $db->rows("SELECT goods.id, goods.id_shop FROM goods WHERE goods.id_shop IN (SELECT id FROM shop WHERE id_user = ?)", array("replace" => array($_SESSION['auth']['id'])));


// Вычисляем число непроданных товаров
foreach ($get_goods as $key => $value):
  $get_shop_uved = $db->row("SELECT * FROM shop WHERE id = ? AND id_user = ?", array($value['id_shop'], $_SESSION['auth']['id']));
  $count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
  $get_goods[$key]['count'] = $count_q['count'];
endforeach;
// Вычисляем число непроданных товаров

$counter = 0; 
foreach ($get_goods as $key => $value): 
	if ($value['count'] <= 0):
		$counter++;
	endif;
endforeach;

$delete_info = $db->delete('DELETE FROM user_log
WHERE id <= (
SELECT id FROM (SELECT * FROM user_log WHERE user_id = '.$_SESSION['auth']['id'].') as tmp
ORDER BY id DESC
LIMIT 20,1
)');

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/profile.tpl';