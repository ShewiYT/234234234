<!DOCTYPE html>
<html class="">
	<head>
		<meta content="True" name="HandheldFriendly">
		<meta name="viewport" content="width=995">
		<link href="/style/shop/css/templates/Darkness/css/css.css" rel="stylesheet" type="text/css">
		<link href="/style/shop/css/templates/Darkness/css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body id="body">
		<div class="wrap">
			<header class="header-top"></header>
			<nav class="header-nav">
				<div class="wrapper">
					<ul class="header-nav-list">
						<li><a href="/">ГЛАВНАЯ</a></li>
						<?php foreach ($get_page as $key => $value): ?>
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
				
				<div class="block-title"><i class="icv ic-items"></i> <span>Товары магазина</span></div>
				<div class="block-wrap">
					<?php if (empty($items)): ?>
					Извините, но в данный момент товаров нет. Приходите позже!
					<? else: ?>
					<?php foreach ($items as $key => $value): ?>
					<? $cate = $db->row("SELECT * FROM category WHERE id = ?", array($value['category'])); ?>
					<div class="o-item">
						<div class="o-pict-crop" style="background-image:url(<?=$value['image']?>);"></div>
						<div class="i-price"><span class="i-price-val"><?=$value['cost_rub']?></span> рублей</div>
						<div class="i-content">
							<p class="i-titles"><a href="/goods/info/<?=$value['id']?>/"><?=$value['name']?></a></p>
							<ul class="o-props">
								<li>Категория: <span class="i-value"><?=$cate['name']?></span></li>
								<li>В наличии: <span class="i-value"><?=$value['count']?> шт.</span></li>
							</ul>
						</div>
						<a class="i-link" href="/goods/info/<?=$value['id']?>/">Подробнее</a>
					</div>
					<? endforeach; ?>
					<? endif; ?>
				</div>
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