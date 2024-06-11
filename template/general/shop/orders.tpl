<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
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
                Список заказов
			</li>
		</ul>
	</div>
	<div class="col-sm-12">
		<form action="/shops/settings/<?=$_GET['shop']?>/orders/" method="post">
		<?=$token?>
			<table class="search_orders">
				<tr>
					<td><input type="text" name="id" class="form-control" placeholder="ID:" /></td>
					<td style="padding: 6px;"><input type="text" name="purse" class="form-control" placeholder="Email:" /></td>
					<td><input class="btn btn-primary" style="margin-top: 10px;" type="submit" value="Найти указанные заказы" /></td>
				</tr>
			</table>
		</form>
		<div class="widget-container fluid-height">
			<!-- Table -->
			<table class="table table-filters table-bordred">
                <thead>
					<tr>
						<th>Статус</th>
						<th class="hidden-xs">Айди</th>
						<th>Дата</th>
						<th>Товар</th>
						<th class="hidden-xs">Кол-во</th>
						<th class="hidden-xs">Контакты</th>
						<th class="hidden-xs">Сумма</th>
					</tr></thead>
					<tbody>
						<?php if (empty($get_orders)): ?>
						<tr>
						<td>Заказов нет</td>
						
						</tr>
						<?php else: ?>
						<?php foreach ($get_orders as $key => $value): ?>
						<?php if ($value['status'] == 'Не оплачен'): ?>
						<tr class="danger">
							<td class="filter-category red">
								<div class="arrow-left"></div>
								<i class="icon-remove-sign"></i>
							</td>
							<td class="hidden-xs">#<?=$value['id_orders']?></td>
							<td><?=date("d.m.Y H:i:s",strtotime($value['date']))?></td>
							<?php if ($value['method'] != 'freekassa'): ?>
							<td><a href="/pay/<?=$value['id_orders']?>/" class="check_order" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Проверить платёж"><?=substr($value['name'], 0, 60)?></a></td>
							<?php else: ?>
							<td><?=substr($value['name'], 0, 60)?></td>
							<?php endif; ?>
							<td class="hidden-xs"><?=$value['count']?></td>
							<td class="hidden-xs"><?=$value['email']?></td>
							<td class="hidden-xs"><?=$value['sum']?> <?=$value['method']?></td>
							
						</tr>
						<?php else: ?>
						<tr class="success">
							<td class="filter-category green">
								<div class="arrow-left"></div>
								<i class="icon-check-sign"></i>
							</td>
							<td class="hidden-xs"><a href="/accounts/<?=$value['secret']?>/" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Скачать этот товар">#<?=$value['id_orders']?></a></td>
							<td><?=date("d.m.Y H:i:s",strtotime($value['date']))?></td>
							<td><a href="/accounts/<?=$value['secret']?>/" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Скачать этот товар"><?=substr($value['name'], 0, 60)?></a></td>
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
<script>
	$(function () {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>