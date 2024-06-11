<br>
<div class="row">
	<div class="col-lg-12">
		<ul class="breadcrumb">
			<li>
                <a href="#"></a><i class="icon-home"></i>
			</li>
			<li>
                <a href="/shops/settings/<?=$_GET['shop']?>/"><?=$_GET['shop']?></a>
			</li>
			<li class="active">
                Статистика магазина
			</li>
		</ul>
	</div>
	<div class="col-sm-6">
		<div class="widget-container fluid-height">
			<!-- Table -->
			<table class="table table-filters table-hover table-bordred">
                <tbody>
					<tr>
						<td class="filter-category blue">
							<div class="arrow-left"></div>
							<i class="icon-off"></i>
						</td>
						<td>Статус магазина:</td>
						<td><?=$err[9]?></td>
						<td><a href="#power" data-toggle="modal">Изменить</a></td>
					</tr>
					<tr>
						<td class="filter-category blue">
							<div class="arrow-left"></div>
							<i class="icon-picture"></i>
						</td>
						<td>Активный дизайн:</td>
						<td><?=$err[8]?></td>
						<td><a href="/shops/settings/<? echo $get_shop['domain']; ?>/texts/">Изменить</a></td>
					</tr>
					<tr>
						<td class="filter-category blue">
							<div class="arrow-left"></div>
							<i class="icon-calendar"></i>
						</td>
						<td>Работает до:</td>
						<td><?=$err[7]?></td>
						<td><a href="#next-shop" class="fancybox">Продлить</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="widget-container fluid-height">
			<!-- Table -->
			<table class="table table-filters table-hover table-bordred">
                <tbody>
					<tr>
						<td class="filter-category green">
							<div class="arrow-left"></div>
							<i class="icon-external-link-sign"></i>
						</td>
						<td>Заработано за последние 24 часа:</td>
						<td><strong><?=$get_stat_day_rub['sum']?></strong> руб.</td>
						<td><strong><?=$get_stat_day_usd['sum']?></strong> $</td>
					</tr>
					<tr>
						<td class="filter-category green">
							<div class="arrow-left"></div>
							<i class="icon-external-link-sign"></i>
						</td>
						<td>Заработано за последний месяц:</td>
						<td><strong><?=$get_stat_mounth_rub['sum']?></strong> руб.</td>
						<td><strong><?=$get_stat_mounth_usd['sum']?></strong> $</td>
					</tr>
					<tr>
						<td class="filter-category green">
							<div class="arrow-left"></div>
							<i class="icon-external-link-sign"></i>
						</td>
						<td>Заработано за всё время:</td>
						<td><strong><?=$get_stat_full_rub['sum']?></strong> руб.</td>
						<td><strong><?=$get_stat_full_usd['sum']?></strong> $</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
		<div class="widget-container fluid-height">
			<!-- Table -->
			<table class="table table-filters table-hover table-bordred">
                <thead>
					<tr>
						<th>Статус</th>
						<th class="hidden-xs">Айди</th>
						<th>Дата</th>
						<th>Товар</th>
						<th class="hidden-xs">Кол-во</th>
						<th class="hidden-xs">Майл</th>
						<th class="hidden-xs">Сумма</th>
					</tr></thead>
					<tbody>
					<? if (!$get_orders): ?>
					<tr>
					<td><h5>Счетов пока нет</h5></td>
					<td class="hidden-xs"></td>
					<td></td>
					<td></td>
					<td class="hidden-xs"></td>
					<td class="hidden-xs"></td>
					<td class="hidden-xs"></td>
					</tr>
					<? else: ?>
						<?php foreach ($get_orders as $key => $value): ?>
						<?php if ($value['status'] == 'Не оплачен'): ?>
						<tr>
							<td class="filter-category red">
								<div class="arrow-left"></div>
								<i class="icon-remove-sign"></i>
							</td>
							<td class="hidden-xs">#<?=$value['id_orders']?></td>
							<td><?=date("d.m.Y H:i:s",strtotime($value['date']))?></td>
							<td><?=substr($value['name'], 0, 60)?></td>
							<td class="hidden-xs"><?=$value['count']?></td>
							<td class="hidden-xs"><?=$value['email']?></td>
							<td class="hidden-xs"><?=$value['sum']?> <?=$value['method']?></td>
						</tr>
						<?php else: ?>
						<tr>
							<td class="filter-category green">
								<div class="arrow-left"></div>
								<i class="icon-check-sign"></i>
							</td>
							<td class="hidden-xs"><a href="/accounts/<?=$value['secret']?>/">#<?=$value['id_orders']?></a></td>
							<td><?=date("d.m.Y H:i:s",strtotime($value['date']))?></td>
							<td><?=substr($value['name'], 0, 60)?></td>
							<td class="hidden-xs"><?=$value['count']?>
								<?php if ($value['return'] == '1'): ?>
								<a href="/shops/settings/<?=$_GET['shop']?>/orders/return/<?=$value['id_orders']?>/">Возврат</a>
								<?php endif; ?>
							</td>
							<td class="hidden-xs"><?=$value['email']?></td>
							<td class="hidden-xs"><?=$value['sum']?> <?=$value['method']?></td>
						</tr>
						<?php endif; ?>
						<?php endforeach; ?>
						<?php endif; ?>
					</tbody>
			</table>
		</div>
	</div>
</div>
<div class="modal fade" id="power">
	<form class="form-horizontal" method="post" action="">
		<? echo $tk->input(); ?>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 class="modal-title">
						Включение/Выключение сайта
					</h4>
				</div>
				<div class="modal-body">
					<label class="col-sm-2 control-label" style="width: 170px;">Выберите действие:</label>
					<div class="col-sm-8">
						<select class="form-control" name="working" id="working">
							<option value="2" <? if ($get_shop['status'] == 'Работает'): echo 'selected'; endif; ?>>Включить магазин</option>
							<option value="1" <? if ($get_shop['status'] == 'Выключен' or $get_shop['status'] == 'Заблокирован'): echo 'selected'; endif; ?>>Выключить магазин</option>
						</select>
					</div>
					<label class="col-sm-2 control-label" style="width: 170px;margin-top: 5px;">Причина:</label>
					<div class="col-sm-8">
						<input type="text" name="cause" class="form-control" value="<?=$get_shop['causeoff']?>" placeholder="Введите причину выключения" style="margin-top: 5px;margin-bottom: 15px;"/>
					</div>
					<small class="col-sm-12 control-label">* При выключении магазина время аренды не замораживается.</small>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" type="button">Применить настройки</button>
					<button class="btn btn-default-outline" data-dismiss="modal" type="button">Закрыть окно</button>
				</div>
			</div>
		</div>
	</form>
</div>
<div id="next-shop" style="display: none">
	<h2>
		Продление существующего магазина
	</h2>
	<p>
		<div class="alert alert-info">
			Срок аренды <b>1 месяц</b> &mdash; <span><?=$cost[1]?> руб. или <?=round($cost[1]/$cost['dollar'], 2)?> $</span><br>
			Срок аренды <b>3 месяца</b> &mdash; <span><?=$cost[3] * 3?> руб. или <?=round($cost[3] * 3/$cost['dollar'], 2)?> $</span><br>
			Срок аренды <b>6 месяцев</b> &mdash; <span><?=$cost[6] * 6?> руб. или <?=round($cost[6] * 6/$cost['dollar'], 2)?> $</span><br>
			Курс доллара <b>1 USD</b> = <span><?=$cost['dollar']?> руб.</span>
		</div>
		<form class="form-horizontal">
			<?=$token?>
			<div class="col-md-8">
				<label class="control-label col-md-4">Выберите магазин:</label>
				<div class="col-md-8">
					<select disabled id="domainprod" class="form-control">
						<option value="<?=htmlspecialchars($_GET['shop'])?>"><?=htmlspecialchars($_GET['shop'])?><? if (!preg_match("/\./", htmlspecialchars($_GET['shop']))) { ?>.<?=DOMAIN?><? } ?></option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<label class="radio-inline"><input checked="" name="period" id="periodprod1" type="radio" value="1"><span>1 месяц</span></label>
				<label class="radio-inline"><input name="period" id="periodprod3" type="radio" value="3"><span>3 месяца</span></label>
				<label class="radio-inline"><input name="period" id="periodprod6" type="radio" value="6"><span>6 месяцев</span></label>
			</div>
			<div class="col-md-6">
				<?php if (WM_PAY == 1): ?>
				<label class="radio-inline"><input checked="" name="paymethod" id="webmoneyrprod" type="radio" value="wmr"><span>WMR</span></label>
				<label class="radio-inline"><input name="paymethod" id="webmoneyzprod" type="radio" value="wmz"><span>WMZ</span></label>
				<?php endif; ?>
				<label class="radio-inline"><input name="paymethod" id="F-K" type="radio" value="F-K"><span>Free-Kassa</span></label>
			</div>
		</form>
		<br><br><br><br><button id="prodshop" onclick="prod()" class="btn btn-lg btn-block btn-success">Продлить магазин</button>
	</p>
</div>
