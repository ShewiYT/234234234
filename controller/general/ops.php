<?php
$this->title = 'RENTSHOPS.RU - Аренда интернет-магазинов';
$check_values = new filter();

if (!empty($_GET['cause'])):
	if (!empty($_GET['statuserr']) and $_GET['statuserr'] == '1' or $_GET['statuserr'] == '2' or $_GET['statuserr'] == '3' or $_GET['statuserr'] == '4'):
		if ($_GET['statuserr'] == '1'):
			$statuserr = 'Вы были заблокированы в данном магазине';
		endif;
		if ($_GET['statuserr'] == '2'):
			$statuserr = 'Данный магазин был заблокирован администратором сервиса';
		endif;
		if ($_GET['statuserr'] == '3'):
			if ($check_values->check('cause','get','int',array('min' => 1, 'max' => 999999999999999999))):
				$get_cause = $db->row("SELECT causeoff FROM shop WHERE id = ?", array($_GET['cause']));
				$cause = $get_cause['causeoff'];
				$statuserr = 'Данный магазин был выключен';
			else:
				$statuserr = 'Данный магазин был выключен';
			endif;
		endif;
		if ($_GET['statuserr'] == '4'):
			$statuserr = 'Данный магазин был отключен за неуплату';
		endif;
		require $_SERVER["DOCUMENT_ROOT"].'/template/general/ops.tpl';
	else:
		header('Location: /');
	endif;
else:
	header('Location: /');
endif;