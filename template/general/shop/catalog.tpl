
<h1>Поднятие магазина в каталоге</h1>
<div class="description">После оплаты Ваш магазин будет на первом месте в списке всех наших магазинов.</div>
<div class="attention">
Мы не знаем сколько времени Ваш магазин будет на первом месте, <br/>
другие пользователи будут поднимать свои магазины, а Ваш будет опускаться.
</div>
<div class="overflow1">
<div class="form">
<form action="/shops/settings/<?=$get_shop['domain']?>/catalog/" method="post">
        <?=$token?>
        <table class="create_shop" style="width: 100%">
            <tr>
                <td><label for="domain">Домен:</label></td><td><?=$get_shop['domain']?>.<?=DOMAIN?></td>
            </tr>
            <tr>
                <td>Цена:</td><td><?=$cost['catalog_up']?> руб.</td>
            </tr>
			<tr>
				<td>Способ оплаты:</td>
				<td>
					<select name="paymethod" id="paymethod" class="standart">
					<?php if (WM_PAY == 1): ?>
					<option value="wmr">WMR</option>
					<option value="wmz">WMZ</option>
					<?php endif;?>
					<?php if (QIWI_PAY == 1): ?>
					<option value="qiwi">QIWI Wallet</option>
					<?php endif; ?>
					</select>
				</td>
			</tr>
        </table>
		<br><input type="submit" style="width: 100%" value="Оплатить и поднять магазин" />
    </form>
</div>