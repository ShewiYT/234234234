<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/style/shop/css/templates/MinKex/css/styles.css" type="text/css">
<style>
   #floatTip {
    position: absolute; width: 250px; display: none; 
    border: 1px solid #000; padding: 4px;
    font-family: sans-serif; font-size: 9pt;
    color: #333; background: #ffe5ff;
	z-index: 1000; border-radius: 5px 5px 5px 5px;
   }
  </style>
  <script src="/style/shop/css/templates/MinKex/js/tooltip.js"></script>
</head>
	<body style="background: url(<?=$get_template['background']?>) 50% 0;background-size:cover;">
		<div class="css_body">

			<nav class="css_navigation">
				<a href="/" class="logo"><?=$get_shop['domain']?></a>
				<a href="/">Главная</a>
				<?php foreach ($get_page as $key => $value): ?>
				<a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a>
				<? endforeach; ?>

				<div style="float: right;">
					<a href="<?=$get_template['vk']?>" target="_blank">МЫ В ВКОНТАКТЕ</a>
				</div>
			</nav>
			<div style="width: 100%;" class="css_slider"><img src="<?=$get_template['logo']?>"></div>
			<div class="css_content full">
			<div class="css_block" id="attach_search_hidden" style="display: none;">&nbsp;</div>
			<? if ($get_template['searchname'] == '2'): ?>
				<div class="css_block" id="attach_search" style="position: relative; margin-top: 20px; box-shadow: gray 0px 0px 0px 0px; border-color: rgb(211, 211, 211); width: 998px; top: 0px; z-index: 10000; background-color: rgb(235, 237, 238);">
					<form action="/" method="GET" class="form-horizontal search">
						<input type="text" maxlength="40" name="search" placeholder="Найти товар..." style="height: 40;">
						<input type="submit" class="button" value="Поиск">
					</form>
				</div>
				<? endif; ?>
				<? if (!$get_goods): ?>
				<h4>Товаров нет! Приходите позже!</h4>
				<? else: ?>
				<?php foreach ($items as $key => $value): ?>
				<?php if (empty($value['cost_rub'])): ?>
				<?php else: ?>
				<div class="css_games">
					<div class="css_sticker">&nbsp;</div>
					<p><img src="<?=$value['image']?>" alt="Товар" onMouseOver="toolTip('<?=$value['description']?>')" onMouseOut="toolTip()"></p>
					<span class="tag orange"><?=$value['name']?></span>
					<? if ($value['count'] == 0) { ?>
					<a class="css_button pricegamesd" disabled>Нет в наличии</a>
					<? } else { ?>
					<a href="/goods/info/<?=$value['id']?>/" class="css_button pricegames">КУПИТЬ ЗА <strong><?=$value['cost_rub']?></strong> RUB</a>
					<? } ?>
				</div>
				<div id="floatTip"></div>
				<?php endif; ?>
				<?php endforeach; ?>
				<?php endif; ?>
			</div>
			<div class="css_content">&nbsp;</div>
			<div class="css_footer">Магазин предоставлен в аренду сервисом <a href="http://rentshops.ru/" target="_blank" style="color: rgb(255, 0, 0);    text-shadow: 0px 0px 2px rgb(255, 0, 0), 0 0 1em rgb(0, 0, 0);    font-size: 11px;    font-family: arial;    background: url(http://i.imgur.com/darLNdO.gif);">RENTSHOPS.RU</a>
			</div>
		</div>
<style type="text/css">

body{font-family:Arial;
font-size:13px;
color:black;
text-shadow:;
}
.modal-content {background-color:#ffffff}
#copybill{
cursor: pointer;
}
#copyfund
{
cursor: pointer;
}
</body>
</html>