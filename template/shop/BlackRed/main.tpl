<!DOCTYPE html>
<html lang="en" class=" -webkit-">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="/style/shop/css/templates/test/css/reset.css" rel="stylesheet" type="text/css">
		<link href="/style/shop/css/templates/test/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="/style/shop/css/templates/test/css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body data-twttr-rendered="true" style="background: url(<?=$get_template['background']?>) 50% 0;background-size:cover;">  
		<!-- begin header -->
		<header>
			<div class="header-image"></div>
			<div style="height:63px;width:451px;margin:0 auto;background: url(<?=$get_template['logo']?>) no-repeat;position: relative;top:-93px;z-index: 10;"></div>
		</header>
		<!-- end header> 
			
		<!-- begin content -->
		<section class="menu">
			<ul class="menu-list">
				<li class="menu-point1"><a href="/">Главная</a></li>
				<?php foreach ($get_page as $key => $value): ?>
				<li class="menu-point2"><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
				<? endforeach; ?>
			</ul>
		</section>
		<section class="content">
			<? if ($get_template['cates'] == '2'): ?>
			<div class="block block-1 left-block">Категории</div>
			<? endif; ?>
			<div class="block block-2">Топ товаров</div>
			<? if ($get_template['lastbuy'] == '2'): ?>
			<div class="block block-1">Последние покупки</div>
			<? endif; ?>
			
			<? if ($get_template['cates'] == '2'): ?>
			<ul class="category-list">
				<li><a href="/" class="act">Все товары</a></li>
				<?php foreach ($get_category as $key => $value): ?>
				<li><a href="/category/<?=$value['id']?>/"><?=$value['name']?></a></li>
				<? endforeach; ?>
			</ul>
			<? endif; ?>
			
			<ul class="topsales-list">
				<? $get_randoms = $db->rows("SELECT goods.name, goods.image, goods.id, goods.cost_rub FROM goods WHERE goods.id_shop = ? GROUP BY goods.id LIMIT 2", array("replace" => array($get_shop['id']))); ?>
				<?php foreach ($get_randoms as $key => $value): ?>
				<li>
					<div class="medal medal-1"></div>
					<p>
						<a href="/goods/info/<?=$value['id']?>/"><?=$value['name']?></a><br>
						<span class="purchase-info">Лучший товар магазина     -     Цена: <?=$value['cost_rub']?> руб.</span>
					</p>
				</li>
				<? endforeach; ?>
			</ul>
			
			<? if ($get_template['lastbuy'] == '2'): ?>
			<ul class="category-list list2">
				<?php foreach ($get_orders as $key => $value): ?>
				<? $get_one_good = $db->row("SELECT * FROM goods WHERE id = ?", array($value['id_goods']));?>
				<li><a href="/goods/info/<?=$value['id_goods']?>/"><?=$value['name']?></a></li>
				<? endforeach; ?>
			</ul>
			<? endif; ?>
			
			<div class="content-full">      
				<?php foreach ($items as $key => $value): ?>
				<? $cate = $db->row("SELECT * FROM category WHERE id = ?", array($value['category'])); ?>
				<div class="item-body">
					<img width="210px" height="106px" src="<?=$value['image']?>" alt="<?=$value['name']?>">
					<h3 class="game-heading"><?=$value['name']?><div class="underline"></div>
					</h3><br>
					<div class="info-block">
						<p class="text"><?=$value['cost_rub']?> руб.</p>
						<p class="heading">Цена</p>
					</div>
					<div class="info-block">
						<p class="text"><?=$cate['name']?></p>
						<p class="heading">Категория</p>
					</div>
					<? if ($value['count'] == 0): ?>
					<div class="red-text-banner">Нет в наличии</div>
					<? else: ?>
					<div class="green-text-banner">В наличии</div>
					<? endif; ?>
					<a href="/goods/info/<?=$value['id']?>/"><div class="shadow"><button class="purchase-button">Купить</button></div></a>
				</div>
				<?php endforeach; ?>
			</div>
			<br>
		</section>
		<!-- end content -->
		
		<!-- begin footer -->
		<footer>
			<a class="author" href="http://rethorica.com/">
				<div class="authors-link">
					<div class="authors-img"></div>
				</div>
			</a>
			<div class="footer-logo"></div>
			<p class="footer-text">2015 © RENTSHOPS.RU<br> <a class="" href="http://rentshops.ru/" style="margin: 0;float: inherit;text-shadow: 0 0 5px;color: #BDC3C9;">RENTSHOPS.RU - АРЕНДА ОНЛАЙН-МАГАЗИНА</a></p>
		</footer>
		<!-- end footer -->
		
	</body>
</html>																				