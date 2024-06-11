<!DOCTYPE html>
<html>
	<head>
		<link media="screen" href="/style/shop/css/templates/Assel/css/app.css" type="text/css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="/style/shop/css/templates/Assel/js/slides.js"></script>
		<script type="text/javascript" src="/style/shop/css/templates/Assel/js/app.js"></script>
		<link rel="shortcut icon" href="http://zonakeys.ru/static/images/favicon.png" type="image/x-icon">
		<script src="/style/general/js/shop.js"></script>
		<style>
			html,
			body {
			background:#151719 url('<?=$get_template['background']?>') no-repeat center 0;
			margin:0;
			padding:0;
			font-family:calibri;
			font-size:14px;
			color:#464646;
			}
			a.h-logo {
			background:url('<?=$get_template['logo']?>') no-repeat 0 0;
			display:block;
			width:227px;
			height:47px;
			float:left;
			margin:61px 0 0 65px;
			transition:all 0.3s ease;
			}
			
			a.h-logo:hover {
			opacity:0.5;
			}
		</style>
	</head>
	<body>
		<div class="kouti message_container"></div>
		<div class="wrapper">
			<div class="full">
				<div class="header">
					<ul class="h-nav">
						<li><a href="/">Главная страница</a></li>
						<?php foreach ($get_pages as $key => $value): ?>
						<li><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
						<?php endforeach; ?>
					</ul>
					<div class="h-soc">
						<a href="<?=$get_template['vk']?>" class="h-soc-1"></a>
					</div>
					<div class="clear"></div>
					<a href="/" class="h-logo"></a>
					<? if ($get_template['searchname'] == '2'): ?>
					<form action="/search/" method="POST" class="h-search">
						<input type="text" placeholder="Поиск по товарам ..." name="search" value="">
						<input type="submit" value="Искать">
					</form>
					<? endif; ?>
					<div class="clear"></div>
					<div class="h-about">
						<div class="h-about-1">Моментальная доставка товара</div>
						<div class="h-about-2">Очень низкие цены на все</div>
						<div class="h-about-3">Удобные способы оплаты</div>
					</div>
				</div>
				<div class="content">
					<div class="c-left">
						<? if ($get_template['cates'] == '2'): ?>
						<div class="block">
							<div class="block-top">Навигация</div>
							<ul class="b-nav">
								<li><a href="/" class="layer">Все товары</a></li>
								<?php foreach ($get_category as $key => $value): ?>
								<li><a href="/category/<?=$value['id']?>/" class="layer"><?=$value['name']?></a></li>
								<? endforeach; ?>
							</ul>
						</div>
						<? endif; ?>
						<div class="block">
							<div class="block-top">ТОП товаров</div>
							<? $get_randoms = $db->rows("SELECT goods.name, goods.image, goods.id FROM goods WHERE goods.id_shop = ? GROUP BY goods.id LIMIT 2", array("replace" => array($get_shop['id']))); ?>
							<?php foreach ($get_randoms as $key => $value): ?>
							<a href="/goods/info/<?=$value['id']?>/" class="b-sale">
								<span class="b-sale-name"><?=$value['name']?></span>
							<img src="<?=$value['image']?>" alt=""></a>
							<? endforeach; ?>
						</div>
						<? if ($get_template['lastbuy'] == '2'): ?>
						<div class="block">
							<div class="block-top">Последние покупки</div>
							<?php foreach ($get_orders as $key => $value): ?>
							<? $get_one_good = $db->row("SELECT * FROM goods WHERE id = ?", array($value['id_goods']));?>
							<a href="/goods/info/<?=$value['id_goods']?>/" class="b-sale">
								<span class="b-sale-name"><?=$value['name']?></span>
							<img src="<?=$get_one_good['image']?>" alt=""></a>
							<? endforeach; ?>
						</div>
						<? endif; ?>
						<?php foreach ($get_bloks as $key => $value): ?>
						<? if ($value['show'] == '2'): ?>
						<div class="block">
							<div class="block-top"><?=$value['name']?></div>
							<p><?=$value['content']?></p>
						</div>
						<? endif; ?>
						<? endforeach; ?>
					</div>
					<div class="c-in">
						<div class="viewn-full">
							<div class="viewn-full-name"><?=$get_goods['name']?></div>
							<div class="viewn-full-screen">
								<img src="<?=$get_goods['image']?>" alt="">
							</div>
							<div class="viewn-full-in">
								<div class="viewn-full-price">Цена товара:<span><?=$get_goods['cost_rub']?><b>RUB</b></span></div>
								<form name="control" action="/order/" method="POST">
									<?=$token?> 
									<input type="hidden" name="type" id="type" value="<?=$get_goods['id']?>" data-min_count="<?=$get_goods['min_count']?>" data-count="<?=$count_q['count']?>" />
									<div class="viewn-full-info">
										<b>Моментальная доставка</b>Данные придут через несколько секунд<br> после покупки, на Ваш почтовый ящик!
									</div><br>
									<a href="/cash/<?=$get_goods['id']?>/" class="viewn-full-link">Купить данный товар</a>
								</form>
							</div>
							<div class="clear"></div>
							<div class="viewn-full-dess">Описание товара:</div>
							<?=$get_goods['description']?>
						</div>
						<div class="site-info">
							<div class="site-info-name">Как купить?</div>
							<ol>
								<li>1) Вводите ваш E-mail в поле ввода</li>
								<li>2) Выбираете наиболее удобный метод оплаты</li>
								<li>3) Нажимаете кнопку "Купить"</li>
								<li>4) Следуете инструкциям</li>
								<li>5) Через некоторое время после оплаты на E-mail вам придет письмо, подтверждающее покупку</li>
							</ol>
						</div>
					</div>
				</div>
				<div class="footer">
					<div class="f-text">Аренда магазина предоставлена сервисом<br>
						<a href="http://rentshops.ru/" style="color: rgb(255, 0, 0);    text-shadow: 0px 0px 2px rgb(255, 0, 0), 0 0 1em rgb(0, 0, 0);font-size: 11px;font-family: arial;background: url(http://i.imgur.com/darLNdO.gif);">RENTSHOPS.RU</a> © 2015-2016
					</div>
					<a href="http://lsart.ru/" onclick="window.open(this.href); return false;" class="f-copy"></a>
					<div class="f-advert"></div>
				</div>
			</div>
		</div>
	</body>
</html>																											