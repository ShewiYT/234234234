
	<form action="/order/" method="POST">
	<?=$token?>
<div id="paymodal" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4>Выбор способа оплаты</h4>
	</div>
	<div class="modal-body">
		<table style="color: rgb(0, 0, 0);width: 90%;margin-left: auto;margin-right: auto;">
		<tbody><tr style="font-size: 12px;">
		<td>Наименование товара:</td>
		<td style="width:60%;"> <select style="color:black;float:right;width:100%;background:rgba(255, 0, 0, 0);border:0px transparent;" disabled="disabled" class="form-control input-small disabled" id="item-selected" name="item">
			<option value="21" data-id="21" data-min_order="1"><?=$get_goods['name']?></option>
		</select></td>
		</tr>
		
		<tr style="font-size: 12px;">
			<td>Количество:</td>
			<td><input type="text" style="width: 100%;height: 30px;" placeholder="Количество" class="form-control input-small" value="1" name="count"> 
			<input type="hidden" class="form-control" name="type" id="type" value="<?=$get_goods['id']?>" data-min_count="<?=$get_goods['min_count']?>" data-count="<?=$count_q['count']?>" /></td>
		</tr>
		<tr style="font-size: 12px;">
		<td>Ваш E-mail:</td>
		<td><input type="text" style="width: 100%;height: 30px;" <?php if ($get_freekassa): ?>placeholder="На этот E-mail придет оплаченный товар!"<?php else: ?>placeholder="Введите Вашу электронную почту"<?php endif; ?> class="form-control input-small" name="email"> </td>
		</tr>
			
		<tr style="font-size: 12px;">
		<td>Купон (если есть):</td>
		<td><input type="text" style="width: 100%;height: 30px;" placeholder="Если у Вас есть купон, введите его в это поле." class="form-control input-small" name="discount_code"></td>
		</tr>
			</tbody></table>
			<?php if ($get_freekassa): ?>
			<script>
			function isEmail() {
				if (confirm("Вы подтверждаете правильность введенного Вами E-mail'a?\nНа указанный e-mail будет отправлен оплаченный товар!")) {
					
				} else {
					event.preventDefault();
				}
			};
			</script>
			<button type="submit" onclick="isEmail();" name="paymethod" id="paymethod" value="freekassa" class="btn btn-warning" style="WIDTH: 100%;">КУПИТЬ ЧЕРЕЗ <strong>FREE-KASSA</strong></button>
			<?php endif; ?>
			<?php if ($get_webmoney): ?>
			<button type="submit" name="paymethod" id="paymethod" value="wmr" class="btn btn-warning" style="WIDTH: 100%;margin-top: 5px;">КУПИТЬ ЧЕРЕЗ <strong>WebMoney - WMR</strong></button>
			<button type="submit" name="paymethod" id="paymethod" value="wmz" class="btn btn-warning" style="WIDTH: 100%;margin-top: 5px;">КУПИТЬ ЧЕРЕЗ <strong>WebMoney - WMZ</strong></button>
			<?php endif; ?>
			<?php if ($get_yandex): ?>
			<button type="submit" name="paymethod" id="paymethod" value="yandex" class="btn btn-warning" style="WIDTH: 100%;margin-top: 5px;">КУПИТЬ ЧЕРЕЗ <strong>Яндекс.Деньги</strong></button>
			<?php endif; ?>
	</div>
</div>
</form>
		<div class="css_body">
			<nav class="css_navigation">
				<a href="/" class="logo"><?=$get_shop['domain']?></a>
				<a href="/">Главная</a>
				<div style="float: right;">
					<a href="<?=$get_template['vk']?>" target="_blank">Мы в ВКОНТАКТЕ</a>
				</div>
			</nav>
			<div style="width: 100%;" class="css_slider"><img src="<?=$get_template['logo']?>"></div>
			<div class="css_content full">
			<div class="digiseller-productpage">
				<div class="digiseller-breadcrumbs css_block view_game">
					<a href="/"><?=$get_shop['domain']?></a> &gt; <a href="/goods/info/<?=$get_goods['id']?>/"><?=$get_goods['name']?></a>
				</div>
	<table class="css_game">
		<tbody><tr>
			<td width="250">
				<img src="<?=$get_goods['image']?>">
				<a href="#modal" role="button" class="btn" data-toggle="modal" style="WIDTH: 89%;" disabled=""><strong><?=$get_goods['cost_rub']?></strong> RUB или <strong><?=$get_goods['cost_usd']?></strong> USD</a>
				<a href="/cash/<?=$get_goods['id']?>/" role="button" class="btn btn-sucCess" data-toggle="modal" style="WIDTH: 89%;">КУПИТЬ</a>
			</td>
			<td>
				<p class="css_names">Товар</p>
				<hr>
				<ul class="css_info">
									<li><text>Название товара:</text> <?=$get_goods['name']?></li>
					<li><text>Минимальное кол-во для покупки:</text> <?=$get_goods['min_count']?> Шт.</li>
					<li><text>В наличии:</text> <?=$count_q['count']?> Шт.</li>
				</ul>
				<p class="css_names">Описание товара</p>
				<hr>
				<div class="css_info" style="word-wrap: break-word;">
					<?=$get_goods['description']?>
			</div></td>
		</tr>
	</tbody></table>
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