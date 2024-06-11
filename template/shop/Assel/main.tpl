<!DOCTYPE html>
<html>
	<head>
		<link media="screen" href="/style/shop/css/templates/Assel/css/app.css" type="text/css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript" src="/style/shop/css/templates/Assel/js/slides.js"></script>
		<script type="text/javascript" src="/style/shop/css/templates/Assel/js/app.js"></script>
	</head>
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
	<body>
		<div class="kouti message_container"></div>
		<div class="wrapper">
			<div class="full">
				<div class="header">
					<ul class="h-nav">
						<li><a href="/">Главная страница</a></li>
						<?php foreach ($get_page as $key => $value): ?>
						<li><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
						<?php endforeach; ?>
					</ul>
					<div class="h-soc">
						<a href="<?=$get_template['vk']?>" class="h-soc-1"></a>
					</div>
					<div class="clear"></div>
					<a href="/" class="h-logo"></a>
					<? if ($get_template['searchname'] == '2'): ?>
					<form action="/" method="GET" class="h-search">
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
						<div class="slides">
							<div class="slides_switch">
								<div class="prev"></div>
								<div class="next"></div>
							</div>
							<div class="slides_container">
								<? $get_big = $db->rows("SELECT goods.name, goods.image, goods.id FROM goods WHERE goods.id_shop = ? GROUP BY goods.id LIMIT 4", array("replace" => array($get_shop['id']))); ?>
								<?php foreach ($get_big as $key => $value): ?>
								<a href="/goods/info/<?=$value['id']?>/"><span class="slides-name"><?=$value['name']?></span><img src="<?=$value['image']?>" alt=""></a>
								<? endforeach; ?>
							</div>
						</div>
						<div id="sortItemContainer">
							<?php if (empty($items)): ?>
							Извините, но в данный момент товаров нет. Приходите позже!
							<? else: ?>
							<?php foreach ($items as $key => $value): ?>
							<? $cate = $db->row("SELECT * FROM category WHERE id = ?", array($value['category'])); ?>
							<div data-item-category="steam" class="viewn">
								<a href="/goods/info/<?=$value['id']?>/">
									<img src="<?=$value['image']?>" alt="">
								</a>
								<div class="viewn-name"><?=$value['name']?></div>
								<div class="viewn-cat">Категория: <?=$cate['name']?></div>
								<div class="viewn-price"><?=$value['cost_rub']?><b>RUB</b> | <?=$value['cost_usd']?><b>USD</b><span></span>
								</div>
							</div>
							<? endforeach; ?>
							<? endif; ?>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="footer">
					<div class="f-text">Аренда магазина предоставлена сервисом<br>
						<a href="http://rentshops.ru/" style="color: rgb(255, 0, 0);text-shadow: 0px 0px 2px rgb(255, 0, 0), 0 0 1em rgb(0, 0, 0);font-size: 11px;font-family: arial;background: url(http://i.imgur.com/darLNdO.gif);">RENTSHOPS.RU</a> © 2015-2016
					</div>
					<a href="http://lsart.ru/" onclick="window.open(this.href); return false;" class="f-copy"></a>
					<div class="f-advert"></div>
				</div>
			</div>
		</div>
	</body>
</html>																											