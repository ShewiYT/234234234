<div class="css_body">
	<nav class="css_navigation">
		<a href="/" class="logo"><?=$get_shop['domain']?></a>
		<a href="/">Главная</a>
		<?php foreach ($get_pages as $key => $value): ?>
		<a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a>
		<? endforeach; ?>
		<div style="float: right;">
			<a href="<?=$get_template['vk']?>" target="_blank">Мы в ВКОНТАКТЕ</a>
		</div>
	</nav>
	<div style="width: 100%;" class="css_slider"><img src="<?=$get_template['logo']?>"></div>
	<div class="css_content full">
		<div class="digiseller-productpage">
			<div class="digiseller-breadcrumbs css_block view_game">
				<a href="/"><?=$get_shop['domain']?></a> &gt; <a href="/page/<?=$get_page['name']?>/"><?=$get_page['name']?></a>
			</div>
			<table class="css_game">
				<tbody>
					<tr>
						<td>
							<p class="css_names"><?=$get_page['name']?></p>
							<hr>
							<div class="css_info" style="word-wrap: break-word;">
								<?=$get_page['content']?>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="css_footer">Магазин предоставлен в аренду сервисом <a href="http://rentshops.ru/" target="_blank" style="color: rgb(255, 0, 0);    text-shadow: 0px 0px 2px rgb(255, 0, 0), 0 0 1em rgb(0, 0, 0);    font-size: 11px;    font-family: arial;    background: url(http://i.imgur.com/darLNdO.gif);">RENTSHOPS.RU</a></div>
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
</style>