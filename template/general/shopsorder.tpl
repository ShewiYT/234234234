<!DOCTYPE html>
<html>
	<head>
		<title><?=$this->title?></title>
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="/style/general/2/pay/cardinfo.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script type="text/javascript" src="/style/general/js/jquery.min.js"></script>
		<script src="/style/general/js/deer.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="main_wrap">
			<div class="header">
				<div class="brs-logo"></div>
				<div class="clear"></div>
			</div>
			<form action="/shops/checkpay/<?=$_GET['id_order']?>/" method="post" id="check_pay">
			<?=$token?>
			<div class="content_wrap">
				<div class="title">
					Оплата счета #<?=$_GET['id_order']?>
				</div>
				<div class="shadow"></div>
				<div class="payinfo">
					<div class="row border">
						<label>Операция:</label>
						<div class="value"><strong><?=$get_payments['type']?> магазина</strong></div>
						<div class="clear"></div>
					</div>
					<div class="row border">
						<label>Ваш домен:</label>
						<div class="value"><strong><?=$get_payments['domain']?><? if (!preg_match("/\./", $get_payments['domain'])) { ?>.<?=DOMAIN?><? } ?></strong></div>
						<div class="clear"></div>
					</div>
					<div class="row border">
						<label>Период аренды:</label>
						<div class="value"><strong><?=$get_payments['count']?> мес.</strong></div>
						<div class="clear"></div>
					</div>
					<div class="row border">
						<label>Кошелёк для оплаты:</label>
						<div class="value"><strong><?=$purse?></strong></div>
						<div class="clear"></div>
					</div>
					<div class="row border">
						<label>Сумма к оплате:</label>
						<div class="value"><strong><?=$get_payments['sum']?> <?=$get_payments['paymethod']?></strong></div>
						<div class="clear"></div>
					</div>
					<div class="row border">
						<label>Примечание:</label>
						<div class="value"><strong>Оплата заказа #<?=$_GET['id_order']?></strong></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="left-shadow"></div>
				<div class="right-shadow"></div>
					<div class="form-actions">
						<div class="action_wrap">
							<input type="submit" value="Проверить оплату" id="submit_card_form">
						</div>
						<div class="action_wrap">
							<span class="or">или</span>
							<a onclick="javascript:alert('Вы можете в любой момент оплатить этот счет, зайдя в раздел Ваши магазины и нажав на кнопку Оплатить напротив данного счета.');" href="/shops/" class="cancel_pay">Оплатить позже</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="right"></div>
				</form>
				<div class="add-info">
					Переведите деньги за заказанную Вами услугу с указанным примечанием на указанный кошелек и нажмите кнопку "Проверить оплату".
				</div>
			</div>
			<div class="footer">
				<div class="add-info">
					<center>Площадка онлайн-магазинов <a target="_blank" href="http://rentshops.ru">RENTSHOPS.RU</center>
					</div>
				</div>
			</div>
		</body>
	</html>		
