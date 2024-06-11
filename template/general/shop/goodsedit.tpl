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
			<li>
                <a href="/shops/settings/<?=$_GET['shop']?>/goods/">Список товаров</a>
			</li>
			<li class="active">
				Редактирование товара
			</li>
		</ul>
	</div>
	<div class="col-lg-12">
	<?=$err[4]?>
		<div class="widget-container fluid-height clearfix">
			<div class="heading">
				<i class="icon-reorder"></i>Редактирование товара
			</div>
			<div class="widget-content padded">
				<form class="form-horizontal" action="/shops/settings/<?=$_GET['shop']?>/goods/edit/<?=htmlspecialchars($_GET['id'])?>/" method="post" enctype="multipart/form-data" autocomplete="off">
					<?=$token?>
					<div class="form-group">
						<label class="control-label col-md-2">Название</label>
						<div class="col-md-7">
							<input class="form-control" value="<?=$get_good['name']?>" name="title" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">Категория</label>
						<div class="col-md-7">
							<select class="form-control" name="category">
								<?php foreach ($get_category as $key => $value): ?>
								<? if ($get_good['category'] == $value['id']): ?>
									<option value="<?=$value['id']?>" selected><?=$value['name']?></option>
								<? else: ?>
									<option value="<?=$value['id']?>"><?=$value['name']?></option>
								<? endif; ?>
								<? endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Цена (руб.)</label>
						<div class="col-md-7">
							<input class="form-control" value="<?=$get_good['cost_rub']?>" name="price_rub" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Цена ($)</label>
						<div class="col-md-7">
							<input class="form-control" value="<?=$get_good['cost_usd']?>" name="price_wmz" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Мин. кол-во</label>
						<div class="col-md-7">
							<input class="form-control" value="<?=$get_good['min_count']?>" name="min_count" type="text">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Описание</label>
						<div class="col-md-7">
							<textarea name="description" class="form-control" rows="3"><?=$get_good['description']?></textarea>
						</div>
					</div>
					<? if ($get_template['template'] == 'BlackRed' or $get_template['template'] == 'MinKex' or $get_template['template'] == 'light' or $get_template['template'] == 'Assel'): ?>
					<div class="form-group">
						<label class="control-label col-md-2">Картинка</label>
						<div class="col-md-7">
							<input type="text" class="form-control" placeholder="Введите ссылку на картинку для этого товара" value="<?=$get_good['image']?>" name="image">
						</div>
					</div>
					<? else: ?>
					<div class="form-group">
						<label class="control-label col-md-2">Иконка</label>
						<div class="col-md-7">
							<label><input type="radio" name="icon" value="0"/><span style="display:inline-block;margin-left:8px;">&nbsp;Нет</span></label>
							<?php foreach ($icons as $key => $value): ?>
							<label><input type="radio" name="icon" value="<?=$value?>"/><img width="30px" src="/style/general/images/icons/social/<?=$value?>.png" alt="<?=$value?>" /></label>
							<?php endforeach; ?>
						</div>
					</div>
					<? endif; ?>
					<div class="form-group">
						<label class="control-label col-md-2">Укажите товар</label>
						<div class="col-md-4">
							<div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
								<div class="input-group">
									<div class="form-control">
										<i class="icon-file fileupload-exists"></i><span class="fileupload-preview"></span>
									</div>
									<div class="input-group-btn">
										<a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">Удалить</a><span class="btn btn-default btn-file"><span class="fileupload-new">Найти</span><span class="fileupload-exists">Изменить</span><input name="file" type="file"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-2">Или в строках</label>
						<div class="col-md-7">
							<textarea name="accounts" class="form-control" rows="3" placeholder="Одна строка - один аккаунт"></textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Обновить данные о товаре</button>
				</form>
			</div>
		</div>
	</div>
</div>