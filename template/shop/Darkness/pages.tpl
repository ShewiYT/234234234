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
				
				<article class="page-full">
					<div class="block-title"><span><?=$get_page['name']?></span></div>
					<div class="block-wrap idesc">
						<div class="page-heads">
							<h1><?=$get_page['name']?></h1>
						</div>
						<? 
						require_once 'bbcode/bbcode.lib.php';
						// Создаем объект и распарсиваем $text
						$bb = new bbcode($get_page['content']);
						// Конвертируем BBCode в HTML и выводим его
						echo $bb -> get_html();?>
						
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