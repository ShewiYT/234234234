
<div class="row">
	<div class="col-lg-6">
		<div class="widget-container fluid-height clearfix">
			<div class="heading">
				<i class="icon-table"></i>Управление Вашими магазинами
			</div>
			<div class="widget-content padded clearfix">
				<?php if (empty($get_shops)): ?>
				<h6>Вы еще не создали ни одного магазина</h6>
				<?php else: ?>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Ваш домен</th>
							<th>ПУ магазина</th>
							<th>Осталось дней</th>
							<th class="hidden-xs">Продление</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($get_shops as $key => $value): ?>
						<tr>
							<td><a target="_blank" href="http://<?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?>"><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></a></td>
							<td><a href="/shops/settings/<?=$value['domain']?>/" class="settings">Перейти в панель</a></td>
							<?php 
								$gap = dateGap($value['date'],date("Y-m-d H:i:s"));
							?>
							<?php if ($gap['days'] <= '0'): ?>
							<td><span class="label label-danger">Магазин отключен</span></td>
							<?php else: ?>
							<td><span class="<?php if ($gap['days'] <= '5'): echo "label label-warning"; endif; if ($gap['days'] <= '3'): echo "label label-danger"; endif; if ($gap['days'] > '5'): echo "label label-success"; endif; ?>" style="font-size: 11px;">Осталось дней: <strong><?=$gap['days']?></strong></span></td>
							<?php endif; ?>
							<td class="hidden-xs"><a class="fancybox" href="#pro-shop">Продлить</a></td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
				<?php endif; ?>
				<a href="#create-shop" class="btn btn-info fancybox pull-left">Создать магазин</a>
				<div id="create-shop" style="display: none">
					<h2>
						Создание нового магазина
					</h2>
					<p>
						<div class="alert alert-info">
							Срок аренды <b>1 месяц</b> &mdash; <span><?=$cost[1]?> руб. или <?=round($cost[1]/$cost['dollar'], 2)?> $</span><br>
							Срок аренды <b>3 месяца</b> &mdash; <span><?=$cost[3] * 3?> руб. или <?=round($cost[3] * 3/$cost['dollar'], 2)?> $</span><br>
							Срок аренды <b>6 месяцев</b> &mdash; <span><?=$cost[6] * 6?> руб. или <?=round($cost[6] * 6/$cost['dollar'], 2)?> $</span><br>
						Курс доллара <b>1 USD</b> = <span><?=$cost['dollar']?> руб.</span>
						</div>
						<?=$token?>
						<div class="col-md-8">
							<div class="input-group">
								<span class="input-group-addon">Домен</span><input placeholder="Введите желаемый домен" class="form-control" name="alias" id="alias" type="text">
							</div>
						</div>
						<div class="col-md-4">
							<div class="input-group">
								<span data-toggle="tooltip" id="tooltip-top" data-original-title="Вы можете указать свою зону. Привязка домена БЕСПЛАТНА" class="input-group-addon">Поддомен</span><input value=".<?=DOMAIN?>" class="form-control" name="subalias" id="subalias" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<label class="radio-inline"><input checked="" name="period" id="period1" type="radio" value="1"><span>1 месяц</span></label>
							<label class="radio-inline"><input name="period" id="period3" type="radio" value="3"><span>3 месяца</span></label>
							<label class="radio-inline"><input name="period" id="period6" type="radio" value="6"><span>6 месяцев</span></label>
						</div>
						<div class="col-md-6">
							<?php if (WM_PAY == 1): ?>
							<label class="radio-inline"><input checked="" name="paymethod" id="webmoneyr" type="radio" value="wmr"><span>WMR</span></label>
							<label class="radio-inline"><input name="paymethod" id="webmoneyz" type="radio" value="wmz"><span>WMZ</span></label>
							<?php endif; ?>
							<label class="radio-inline"><input name="paymethod" id="freekassa" type="radio" value="freekassa"><span>Free-Kassa</span></label>
						</div>
						<br><br><br><br><button id="createshop" onclick="create()" class="btn btn-lg btn-block btn-primary">Создать магазин</button>
						<h6>* При создании магазина с собственным доменом, Вам необходимо будет обратиться к техподдержке для активации домена.</h6>
					</p>
				</div>
				<a href="#delete-shop" class="btn btn-danger fancybox pull-right">Удалить магазин</a>
				<div id="delete-shop" style="display: none">
					<h2>
						Удаление существующего магазина
					</h2>
					<p>
						<div class="alert alert-danger">
							При удалении магазина вы НИЧЕГО не получаете взамен. Помните об этом!
						</div>
						<div style="width: 97.2%;">
							<form class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-md-4">Выберите магазин:</label>
									<div class="col-md-8">
										<select id="remofsite" class="form-control">
											<?php foreach ($get_shops as $key => $value): ?>
											<option value="<?=$value['domain']?>"><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></option>
											<? endforeach; ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4">Кодовое слово:</label>
									<div class="col-md-8">
										<input class="form-control" id="kodovoe" placeholder="Введите ваше кодовое слово" type="password">
									</div>
								</div>
							</form>
							<button id="remshop" onclick="noshop()" style="width: 100%;" class="btn btn-danger"><i class="icon-trash"></i>Удалить выбранный магазин</button>
						</div>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="widget-container fluid-height clearfix">
			<div class="heading">
				<i class="icon-table"></i>Список счетов
			</div>
			<div class="widget-content padded clearfix">
				<?php if (empty($get_payments)): ?>
				<h6>У Вас пока что нет счетов</h6>
				<?php else: ?>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Тип</th>
							<th>Домен</th>
							<th class="hidden-xs">Сумма</th>
							<th>Статус</th>
							<th class="hidden-xs"></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($get_payments as $key => $value): ?>
						<tr>
							<td><span class="label label-primary"><?=$value['type']?></span></td>
							<td><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></td>
							<td class="hidden-xs"><?=$value['sum']?> <?=$value['paymethod']?></td>
							<td>
								<?php if ($value['status'] == 'Не оплачен'): ?>
								<span class="label label-danger">Не оплачен</span>
								<?php else: ?>
								<span class="label label-success">Оплачен</span>
								<?php endif; ?>
							</td>
							<td class="hidden-xs">
								<?php if ($value['status'] == 'Не оплачен'): ?>
								<a href="/shops/order/<?=$value['id']?>/">Оплатить</a>
								<?php else: ?>
								<center><font color="#60c560"><span class="icon-check-sign"></span></font></center>
								<?php endif; ?>
							</td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
				<?php endif; ?>
				<button class="btn btn-success">Просмотреть больше счетов</button>
			</div>
		</div>
	</div>
	
</div>

<div id="pro-shop" style="display: none">
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
					<select id="domainprod" class="form-control">
						<?php foreach ($get_shops as $key => $value): ?>
						<option value="<?=$value['domain']?>"><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></option>
						<? endforeach; ?>
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