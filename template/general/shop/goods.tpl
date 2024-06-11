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
                Список товаров
			</li>
		</ul>
	</div>
	<div class="col-sm-12">
		<?=$err[89]?>
	</div>
	<div class="col-sm-9">
		<div class="widget-container fluid-height">
			<!-- Table -->
			<table class="table table-hover table-bordered" id="sortable">
				<tbody class="ui-sortable">
					<thead>
						<tr>
							<th>ID</th>
							<th>Название</th>
							<th>Кол-во</th>
							<th>Покупок</th>
							<th>Цена</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<?php if (empty($items)): ?>
					
					<td>Товары отстутствуют</td>
					
					<?php else: ?>
					<script type="text/javascript">
						$(document).ready(function(){
							$('#sortable tbody').sortable({ opacity: 0.6, cursor: 'move',
								update: function(event, ui) {
									var newOrder = $(this).sortable("serialize");
									$.post('/shops/settings/<?=$_GET['shop']?>/goods/sortable/', newOrder);
								}
							});
						});
					</script>
					<?php foreach ($items as $key => $value): ?>
					<? $get_sells = $db->row("SELECT count(id) as count FROM orders WHERE id_shop = ? AND status = ? AND id_goods = ?", array($get_shop['id'], 'Оплачен', $value['id'])); ?>
					<?php if (empty($value['cost_rub'])): ?>
					<tr id="position_separator<?=$value['id']?>">
						<td colspan="10" class="separator"><?=$value['name']?></td>
						<td><a href="/shops/settings/<?=$_GET['shop']?>/separator/remove/" data-id="<?=$value['id']?>" class="remove_separator"><span class="glyphicon glyphicon-trash"></a></td>
						</tr>
						<?php else: ?>
						<tr id="position_<?=$value['id']?>">
							<td><?=$value['id']?></td>
							<td class="title"><?=$value['name']?><div class="icon_social_<?=$value['ico']?>"></div></td>
							<td><?=$value['count']?></td>
							<td><?=$get_sells['count']?></td>
							<td><strong><?=$value['cost_rub']?></strong> руб. / <strong><?=$value['cost_usd']?></strong> $</td>
							<td><center><a href="/shops/settings/<?=$_GET['shop']?>/goods/edit/<?=$value['id']?>/"><span class="label label-info"><span class="icon-edit-sign"></span>  Изменить</span></a></center></td>
							<td><center><a href="/shops/settings/<?=$_GET['shop']?>/goods/download/<?=$value['id']?>/"><span class="label label-warning"><span class="icon-download-alt"></span>  Скачать все</span></a></center></td>
							<td><center><a onclick="if (!confirm('Вы уверены, что хотите удалить товар?\nВсе аккаунты так же будут удалены.')) return false;" href="/shops/settings/<?=$_GET['shop']?>/goods/remove/<?=$value['id']?>/"><span class="label label-danger"><span class="icon-remove"></span>  Удалить все</span></a></center></td>
							
							
						</tr>
						<?php endif; ?>
						
						<?php endforeach; ?>
					</tbody></table>
					<?php endif; ?>
			</tbody>
		</table>
	</div>
	<button data-toggle="modal" href="#additem" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Добавить новый товар</button>
	<div class="modal fade" id="additem">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 class="modal-title">
						Добавление товара
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="/shops/settings/<?=$_GET['shop']?>/goods/add/" method="post" id="goods_add" enctype="multipart/form-data">
						<?=$token?>
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Название:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите желаемое название товара" name="title" id="title">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" style="width: 170px;">Категория:</label>
								<div class="col-md-7">
									<select class="form-control" name="category">
									<?php foreach ($get_category as $key => $value): ?>
										<option value="<?=$value['id']?>"><?=$value['name']?></option>
									<? endforeach; ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Цена за 1 штуку (Руб.):</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите желаемую стоимость товара в рублях" name="price_rub" id="price_rub">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Цена за 1 штуку ($):</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите желаемую стоимость товара в долларах" name="price_wmz" id="price_wmz">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Мин. кол-во:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите минимальное количество для покупки" name="min_count" id="min_count" value="1">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Описание:</label>
								<div class="col-sm-7">
									<textarea name="description" class="form-control" rows="3" placeholder="Опишите Ваш товар..."></textarea>
								</div>
							</div>
							<? if ($get_template['template'] == 'BlackRed' or $get_template['template'] == 'MinKex' or $get_template['template'] == 'light' or $get_template['template'] == 'Assel'): ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Картинка товара:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите ссылку на картинку для этого товара" name="image" id="image">
								</div>
							</div>
							<? else: ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Иконка:</label>
								<div class="col-sm-7">
									<label><input type="radio" name="icon" value="0"/><span style="display:inline-block;margin-left:8px;">&nbsp;Нет</span></label>
									<?php foreach ($icons as $key => $value): ?>
									<label><input type="radio" name="icon" value="<?=$value?>"/><img width="30px" src="/style/general/images/icons/social/<?=$value?>.png" alt="<?=$value?>" /></label>
									<?php endforeach; ?>
								</div>
							</div>
							<? endif; ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Файл с товаром:</label>
								<div class="col-sm-7">
									<input type="file" name="file" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit">Создать новый товар</button><button class="btn btn-default-outline" data-dismiss="modal" type="button">Закрыть</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-3">
	<div class="widget-container fluid-height">
		<!-- Table -->
		<table class="table table-hover table-bordered">
			<tbody class="ui-sortable">
				<thead>
					<tr>
						<th>Категория</th>
						<th></th>
					</tr>
				</thead>
				
				<?php if (empty($get_category)): ?>
				<td>Категории отстутствуют</td>
				<?php else: ?>
				<?php foreach ($get_category as $key => $value): ?>
				<tr>
					<td class="title"><?=$value['name']?></td>
					<td><center><a onclick="if (!confirm('Вы уверены, что хотите удалить категорию?')) return false;" href="/shops/settings/<?=$_GET['shop']?>/goods/rem/<?=$value['id']?>/"><span class="label label-danger"><span class="icon-remove"></span>  Удалить</span></a></center></td>
				</tr>
				<?php endforeach; ?>
				<? endif; ?>
				
			</tbody>
		</table>
	</div>
	<button data-toggle="modal" href="#addcategory" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-plus"></span> Добавить новую категорию</button>
	<div class="modal fade" id="addcategory">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
					<h4 class="modal-title">
						Добавление категории
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
						<?=$token?>
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label" style="width: 170px;">Название:</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" placeholder="Введите желаемое название категории" name="category">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit">Создать категорию</button><button class="btn btn-default-outline" data-dismiss="modal" type="button">Закрыть</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>