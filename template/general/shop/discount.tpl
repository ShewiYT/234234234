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
                Управление скидочными купонами
			</li>
		</ul>
	</div>
	<div class="col-lg-12">
		<?=$err[0]?><?=$err[1]?><?=$err[2]?>	
		<div class="tab-content">		
			<div id="pages" class="tab-pane fade in active">
				<div style="width: 49.8%;float:left;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Список скидочных купонов
						</div>
						<div class="widget-content padded">
							<? if (!$get_goods):?>
							<div class="alert alert-warning">Чтобы создать скидочный купон, сначала нужно создать хотя бы один товар</div>
							<? else: ?>
							<? if (!$get_discounts):?>
							<div class="alert alert-warning">Вы еще не создали ни одного купона</div>
							<? else: ?>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Купон</th>
										<th>Осталось использований</th>
										<th>Комментарий</th>
										<th>Действия</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($get_discounts as $key => $value): ?>
									<tr>
										<td><?=$value['id']?></td>
										<td><?=$value['code']?></td>
										<td><?=$value['count']?></td>
										<td><?=$value['comment']?></td>
										<td><a onclick="if (!confirm('Вы уверены, что хотите удалить скидочный купон?')) return false;" href="/shops/settings/<?=$_GET['shop']?>/discount/remove/<?=$value['id']?>/">Удалить</a></td>
									</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
							<? endif; ?>
							<? endif; ?>
						</div>
					</div>
				</div>
				<div style="width: 49.8%;float:right;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Создание нового купона
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post" enctype="multipart/form-data" autocomplete="off">
								<?=$tk->input();?>
								<input type="hidden" name="createpage" value="on">
								<div class="form-group">
									<label class="control-label col-md-3">Процент скидки:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите процент, на который купон будет снижать стоимость" name="percent" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Кол-во исполь-ий:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите кол-во использований" name="count" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Комментарий:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите комментарий" name="comment" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Товары:</label>
									<div class="col-md-8">
										<select class="form-control" multiple="" name="goods[]">
											<?php foreach ($get_goods as $key => $value): ?>
											<option value="<?=$value['id']?>"><?=$value['name']?></option>
											<?php endforeach; ?>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Создать скидочный купон</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>				