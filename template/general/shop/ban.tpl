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
                Управление блокировками
			</li>
		</ul>
	</div>
	<div class="col-lg-12">
		<?=$err[0]?>	
		<div class="tab-content">		
			<div id="pages" class="tab-pane fade in active">
				<div style="width: 49.8%;float:left;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Список заблокированных IP-адресов
						</div>
						<div class="widget-content padded">
							<? if (!$ban_list):?>
							<div class="alert alert-warning">Вы еще не заблокировали ни одного IP</div>
							<? else: ?>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>IP</th>
										<th>Причина</th>
										<th>Действия</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($ban_list as $key => $value): ?>
									<tr>
										<td><?=$value['id']?></td>
										<td><?=$value['ip']?></td>
										<td><?=$value['comment']?></td>
										<td><a onclick="if (!confirm('Вы уверены, что хотите удалить этот IP из бан-листа?')) return false;" href="/shops/settings/<?=$_GET['shop']?>/ban/remove/<?=$value['id']?>/">Удалить</a></td>
									</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
							<? endif; ?>
						</div>
					</div>
				</div>
				<div style="width: 49.8%;float:right;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Блокировка нового IP
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post" enctype="multipart/form-data" autocomplete="off">
								<?=$token?>
								<input type="hidden" name="createpage" value="on">
								<div class="form-group">
									<label class="control-label col-md-3">IP-адрес:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите IP, который нужно заблокировать" name="ip" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Причина бана:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Укажите причину блокировки" name="reason" type="text">
									</div>
								</div>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Заблокировать доступ этому IP</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>		