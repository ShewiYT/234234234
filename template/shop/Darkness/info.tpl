<!DOCTYPE html>
<html class="">
	<head>
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=995">
		<link href="/style/shop/css/templates/Darkness/css/css.css" rel="stylesheet" type="text/css">
		<link href="/style/shop/css/templates/Darkness/css/style.css" rel="stylesheet" type="text/css">
		<script src="http://imgscrcssjsdomainleque.lequeshop.ru/source/custom/js/wf-game/jquery.js"></script>
		<script src="http://imgscrcssjsdomainleque.lequeshop.ru/source/custom/js/wf-game/script_site.js"></script>
		<script src="http://imgscrcssjsdomainleque.lequeshop.ru/assets/js/bootstrap.min.js"></script>
	</head>
	<body id="body">
		<div class="wrap">
			<header class="header-top"></header>
			<nav class="header-nav">
				<div class="wrapper">
					<ul class="header-nav-list">
						<li><a href="/">ГЛАВНАЯ</a></li>
						<?php foreach ($get_pages as $key => $value): ?>
						<li><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
						<? endforeach; ?>
					</ul>
				</div>
			</nav>
			<div class="wrapper">
				<? if ($get_template['cates'] == '2'): ?>
				<div class="content-top-category">
					<div class="block-title"><i class="icv ic-category"></i> <span>Категории</span></div>
					<div class="nav-category-list-wrap">
						<div class="nav-category-list-ins">
							<ul class="nav-category-list">
								<li><a href="/" class="current"><span>Все категории</span></a></li>
								<?php foreach ($get_category as $key => $value): ?>
								<li><a href="/category/<?=$value['id']?>/" class="current"><span><?=$value['name']?></span></a></li>
								<? endforeach; ?>
							</ul>
						</div>
					</div>
				</div>
				<? endif; ?>
				<div class="content-top-item clearfix">
					<div class="side-block left">
						<div class="block-title"><i class="icv ic-sell-top"></i><span>Топ товаров</span></div>
						<div class="block-wrap i-sell-top">
							<ul class="list-items-sell-top">
								<? $get_randoms = $db->rows("SELECT goods.name, goods.image, goods.id, goods.cost_rub FROM goods WHERE goods.id_shop = ? GROUP BY goods.id LIMIT 3", array("replace" => array($get_shop['id']))); ?>
								<?php foreach ($get_randoms as $key => $value): ?>
								<li>
									<p class="i-titles"><a href="/goods/info/<?=$value['id']?>/"><?=$value['name']?></a></p>
									<div class="i-details">
										<div class="i-take-buy">Лучший товар магазина</div>
										<div class="i-price">Цена товара: <span class="i-value"><?=$value['cost_rub']?></span> руб.</div>
									</div>
								</li>
								<? endforeach; ?>
							</ul>
						</div>
					</div>
					<? if ($get_template['lastbuy'] == '2'): ?>
					<div class="side-block right">
						<div class="block-title"><i class="icv ic-sell-last"></i> <span>Последние покупки</span></div>
						<div class="block-wrap i-sell-last">
							<ul class="list-items-sell-last">
								<?php foreach ($get_orders as $key => $value): ?>
								<? $get_one_good = $db->row("SELECT * FROM goods WHERE id = ?", array($value['id_goods']));?>
								<li><a href="#"><?=$value['name']?></a></li>
								<? endforeach; ?>
							</ul>
						</div>
					</div>
					<? endif; ?>
				</div>
				
				<article class="item-full">
					<div class="block-title"><i class="icv ic-items"></i> <span><?=$get_goods['name']?></span></div>
					<div class="block-wrap">
						<div class="item-full-pict">
							<div class="i-pict"><a href="<?=$get_goods['image']?>" rel="gallery"><img src="<?=$get_goods['image']?>" alt=""></a></div>
							<div class="item-full-picts">	
							</div>
						</div>
						<div class="item-full-content">
							<div class="i-heads">
								<div class="i-price"><span class="i-price-val"><?=$get_goods['cost_rub']?></span> рублей</div>
								<div class="i-content">
									<div class="i-titles"><h1><?=$get_goods['name']?></h1></div>
									<ul class="o-props">
										<li>Платформа: <span class="i-value">WarFace</span></li>
										<li>В наличии: <span class="i-value"><?=$get_goods['count']?></span></li>
									</ul>
								</div>
							</div>
							<div class="idesc js-tabs-wrap">
								<div class="js-tabs-btn">
									<a href="#" class="current">ОПИСАНИЕ</a>
									<a href="#" class="">КАК КУПИТЬ</a>
								</div>
								<div class="js-tabs-box current" style="display: block;">
									<?=$get_goods['description']?>
								</div>
								<div class="js-tabs-box" style="display: none;">
									1. Нажать кнопку "КУПИТЬ ТОВАР"<br>
									2. Заполнить необходимые данные и выбрать способ оплаты.<br>
									3. Оплатить и ждать товар на Ваш Email.</div>
							</div>
							<div class="item-full-buy"><a class="btn-buy js_fbox" href="/cash/<?=$get_goods['id']?>/">КУПИТЬ ТОВАР</a></div>
						</div>
					</div>
				</article>
				
				<footer class="footer-bottom">
					<div class="footer-left">
						<img src="/style/shop/css/templates/Darkness/images/designs.png" alt="">
					</div>
					<div class="footer-right">
						<p onclick="document.location.href=&quot;http://rentshops.ru&quot;;" class="copyleque">RENTSHOPS.RU<br>
						Площадка интернет-магазинов</p>
					</div>
					<div class="footer-center">
						<p class="i-site-name"><?=$get_shop['domain']?></p>
						<p>Все права защищены © 2016</p>
					</div>
				</footer>
			</div>
		</div>
	</body>
</html>																																																									