<body style="background: url(<?=$get_template['background']?>) 50% 0;background-size:cover;">
	<div id="content">
		<a href="/" class="logotype left"><img src="<?=$get_template['logo']?>"></a>
		<? if ($get_template['searchname'] == '2'): ?>
		<div class="header_search left br2">
			<form action="/" method="GET">
				<input type="text" class="search" name="search" maxlength="100" value="Поиск по сайту..." onfocus="this.value=''" onblur="if (this.value==''){this.value='Поиск по сайту...'}"> 
				<input type="submit" value="" class="search_ico right">
			</form>
		</div>
		<? endif; ?>
		<ul class="header_nav br2">
			<li><a href="/">Главная страница</a></li>
			<?php foreach ($get_pages as $key => $value): ?>
			<li><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
			<?php endforeach; ?>
		</ul>
		<div id="maincontent" class="br2">
			<div id="container" class="left">
				<div class="sidebox_title_black br2">Страница - <?=$get_page['name']?><div class="nav"></div></div>
				<table class="table table-striped table-bordered table-hover shop_goods">
					<div class="layer">
						<div style="padding:5px">
							<?=$get_page['content']?>
						</div>
					</div>
				</table>
			</div>
			<div id="sidebar" class="right">
				<? if ($get_template['cates'] == '2'): ?>
				<div class="sidebox">
					<div class="sidebox_title_black br2">Категории<div class="nav"></div></div>
					<div classs="sidebox_content">
						<ul class="menu_nav">
							<li class="layer act"><a href="/">Все товары</a>
								<?php foreach ($get_category as $key => $value): ?>
								<li class="layer"><a href="/?cat_id=<?=$value['id']?>"><?=$value['name']?></a>
									<? endforeach; ?>
								</ul>
							</li>
						</div>
					</div>
					<? endif; ?>
					<? if ($get_template['lastbuy'] == '2'): ?>
					<div class="sidebox">
						<div class="sidebox_title_green br2">Последние продажи<div class="pop"></div></div>
						<div class="sidebox_content">
							<?php foreach ($get_orders as $key => $value): ?>
							<? $get_one_good = $db->row("SELECT * FROM goods WHERE id = ?", array($value['id_goods']));?>
							<div class="pop_file br2">
								<img src="<?=$get_one_good['image']?>" alt="<?=$value['name']?>">
								<div class="pop_file_link"><?=$value['name']?></div>
							</div>
							<? endforeach; ?>
						</div>
					</div>
					<? endif; ?>
					<?php foreach ($get_bloks as $key => $value): ?>
					<? if ($value['show'] == '2'): ?>
					<div class="sidebox">
						<div class="sidebox_title_green br2"><?=$value['name']?><div class="nav"></div></div>
						<div class="sidebox_content">
							<?=$value['content']?>
						</div>
					</div>
					<? endif; ?>
					<? endforeach; ?>
				</div>
			</div>
		</div>
		<div class="footer">
			<center><div class="copyright">Аренда магазина предоставлена сервисом <a href="http://rentshops.ru/">RENTSHOPS.RU</a></div></center>
		</div>
	</div>	