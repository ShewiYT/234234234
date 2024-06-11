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
                Настройки магазина
			</li>
		</ul>
	</div>
	<div class="col-lg-12">
		<?=$err[0]?>
		<div class="bs-example">
			<ul class="nav nav-tabs nav-justified">
				<li class="active"><a data-toggle="tab" href="#defaultsettings"><span class="icon-cog"></span> Основные настройки магазина</a></li>
				<li><a data-toggle="tab" href="#design"><span class="icon-desktop"></span> Настройка дизайна для магазина</a></li>
				<li><a data-toggle="tab" href="#bloks"><span class="icon-th-large"></span> Управление блоками магазина</a></li>
			</ul>
		</div>	
		<div class="tab-content">
			<div id="defaultsettings" class="tab-pane fade in active">
				<div style="width: 49.8%;float:left;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Основные настройки магазина
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post">
								<?=$token?>
								<input type="hidden" name="editglobal" value="on">
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Заголовок магазина:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите желаемый заголовок магазина" name="title" value="<?=$get_template['meta_title']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Description магазина:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите желаемое описание магазина" name="meta_description" value="<?=$get_template['meta_description']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Ключевые слова магазина:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите желаемые ключевые слова магазина" name="meta_keywords" value="<?=$get_template['meta_keywords']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Ссылка на иконку:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите ссылку на иконку для магазина" name="favicon" value="<?=$get_template['meta_favicon']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Ссылка на лого магазина:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите ссылку на логотип для Вашего магазина" name="logo" value="<?=$get_template['logo']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Ссылка на фон магазина:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите ссылку на фон для Вашего магазина" name="background" value="<?=$get_template['background']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Поле для скриптов:</label>
									<div class="col-sm-7">
										<textarea name="text_scripts" class="form-control" rows="3" placeholder="Введите любой скрипт, счётчики и т.д."><?=$get_template['texts_scripts']?></textarea>
									</div>
								</div>
								<? if ($get_template['template'] == 'BlackRed') { ?>
									<div class="form-group">
										<label class="col-sm-2 control-label" style="width: 200px;">Ссылка кнопки "ВКОНТАКТЕ":</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="Введите ссылку на Вашу группу ВКонтакте" name="vk" value="<?=$get_template['vk']?>">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" style="width: 200px;">Ссылка кнопки "СОГЛАШЕНИЕ":</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="Введите ссылку на страницу с соглашением" name="soglas" value="<?=$get_template['soglas']?>">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" style="width: 200px;">Ссылка кнопки "ТЕХПОДДЕРЖКА":</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="Введите ссылку на страницу с Техподдержкой" name="support" value="<?=$get_template['support']?>">
										</div>
									</div>
								<? } ?>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Сохранить настройки</button>
							</form>
						</div>
					</div>
				</div>
				<div style="width: 49.8%;float:right;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Основные настройки магазина
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post">
								<?=$token?>
								<input type="hidden" name="editbloks" value="on">
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Включить/Выключить:</label>
									<div class="col-sm-7">
										<select class="form-control" name="power">
											<option value="2" <? if ($get_shop['status'] == 'Работает'): echo 'selected'; endif; ?>>Включить магазин</option>
											<option value="1" <? if ($get_shop['status'] == 'Выключен' or $get_shop['status'] == 'Заблокирован'): echo 'selected'; endif; ?>>Выключить магазин</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Причина выключения:</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="Введите причину выключения магазина" name="cause" value="<?=$get_shop['causeoff']?>">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Блок последние покупки:</label>
									<div class="col-sm-7">
										<select class="form-control" name="lastbuy">
											<option value="2" <? if ($get_template['lastbuy'] == '2'): echo 'selected'; endif; ?>>Включить блок</option>
											<option value="1" <? if ($get_template['lastbuy'] == '1'): echo 'selected'; endif; ?>>Выключить блок</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Блок категории:</label>
									<div class="col-sm-7">
										<select class="form-control" name="cates">
											<option value="2" <? if ($get_template['cates'] == '2'): echo 'selected'; endif; ?>>Включить блок</option>
											<option value="1" <? if ($get_template['cates'] == '1'): echo 'selected'; endif; ?>>Выключить блок</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" style="width: 200px;">Поиск товара:</label>
									<div class="col-sm-7">
										<select class="form-control" name="searchname">
											<option value="2" <? if ($get_template['searchname'] == '2'): echo 'selected'; endif; ?>>Включить</option>
											<option value="1" <? if ($get_template['searchname'] == '1'): echo 'selected'; endif; ?>>Выключить</option>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Применить настройки</button>
							</form>
						</div>
					</div>
				</div>
			</div>			
			<div id="design" class="tab-pane fade">
				<div class="widget-container fluid-height clearfix">
					<div class="heading">
						<i class="icon-reorder"></i>Настройка дизайна для магазина
					</div>
					<div class="widget-content padded">
						<ul class="gallery-grid clearfix">
							<li><form class="form-horizontal" method="post" id="texts">
								<?=$token?>
								<figure>
									<img src="/style/general/images/light.png" style="height: 200px;">
									<div class="caption">
										<h3>
											Light [NEW]
										</h3>
										<?php if ($get_template['template'] == 'light'): ?>
										<button disabled class="btn btn-success">Этот дизайн уже установлен</button>
										<? else: ?>
										<button type="submit" class="btn btn-warning" name="template" value="light">Установить этот дизайн</button>
										<? endif; ?>
									</div>
								</figure>
							</li></form>
							<li><form class="form-horizontal" method="post" id="texts">
								<?=$token?>
								<figure>
									<img src="/style/general/images/lequeshop.png" style="height: 200px;">
									<div class="caption">
										<h3>
											LequeShop [NEW]
										</h3>
										<?php if ($get_template['template'] == 'lequeshop'): ?>
										<button disabled class="btn btn-success">Этот дизайн уже установлен</button>
										<? else: ?>
										<button type="submit" class="btn btn-warning" name="template" value="lequeshop">Установить этот дизайн</button>
										<? endif; ?>
									</div>
								</figure>
							</li></form>
							<li><form class="form-horizontal" method="post" id="texts">
								<?=$token?>
								<figure>
									<img src="/style/general/images/blackred.png" style="height: 200px;">
									<div class="caption">
										<h3>
											BlackRed [NEW]
										</h3>
										<?php if ($get_template['template'] == 'BlackRed'): ?>
										<button disabled class="btn btn-success">Этот дизайн уже установлен</button>
										<? else: ?>
										<button type="submit" class="btn btn-warning" name="template" value="BlackRed">Установить этот дизайн</button>
										<? endif; ?>
									</div>
								</figure>
							</li></form>
							<li><form class="form-horizontal" method="post" id="texts">
								<?=$token?>
								<figure>
									<img src="/style/general/images/minkex.png" style="height: 200px;">
									<div class="caption">
										<h3>
											MinKex [NEW]
										</h3>
										<?php if ($get_template['template'] == 'MinKex'): ?>
										<button disabled class="btn btn-success">Этот дизайн уже установлен</button>
										<? else: ?>
										<button type="submit" class="btn btn-warning" name="template" value="MinKex">Установить этот дизайн</button>
										<? endif; ?>
									</div>
								</figure>
							</li></form>
							<li><form class="form-horizontal" method="post" id="texts">
								<?=$token?>
								<figure>
									<img src="/style/general/images/assel.png" style="height: 200px;">
									<div class="caption">
										<h3>
											Assel [NEW]
										</h3>
										<?php if ($get_template['template'] == 'Assel'): ?>
										<button disabled class="btn btn-success">Этот дизайн уже установлен</button>
										<? else: ?>
										<button type="submit" class="btn btn-warning" name="template" value="Assel">Установить этот дизайн</button>
										<? endif; ?>
									</div>
								</figure>
							</li></form>
						</ul>
					</div>
				</div>
			</div>
			<div id="bloks" class="tab-pane fade">
				<div style="width: 49.8%;float:left;">
					<div class="widget-container fluid-height clearfix">
						<div class="heading">
							<i class="icon-reorder"></i>Список блоков магазина
						</div>
						<div class="widget-content padded">
						<? if (!$get_bloks):?>
						<div class="alert alert-warning">Вы еще не создали ни одного блока</div>
						<? else: ?>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Название блока</th>
										<th>Отображение</th>
										<th>Действия</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($get_bloks as $key => $value): ?>
									<tr>
										<td><?=$value['id']?></td>
										<td><?=$value['name']?></td>
										<td><?php if ($value['show'] == '2'):?><span class="label label-success" style="font-size: 11px;">Отображается</span>
										<?php endif; if ($value['show'] == '1'):?><span class="label label-danger" style="font-size: 11px;">Не отображается</span><?php endif; ?></td>
										<td><a data-toggle="modal" href="#editblok<?=md5($value['id'])?>">Редактировать</a> \ <a onclick="if (!confirm('Вы уверены, что хотите удалить блок?')) return false;" href="/shops/settings/<?=$_GET['shop']?>/delblok/<?=$value['id']?>/">Удалить</a></td>
										
										<div class="modal fade" id="editblok<?=md5($value['id'])?>">
											<div class="modal-dialog">
												<form action="" method="POST" class="form-horizontal">
												<?=$token?>
													<div class="modal-content">
														<div class="modal-header">
															<button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
															<h4 class="modal-title">
																Редактирование блока
															</h4>
														</div>
														<div class="modal-body">
															<input type="hidden" name="editblok" value="on">
															<input type="hidden" name="idblok" value="<?=$value['id']?>">
															<div class="form-group">
																<label class="control-label col-md-3">Название блока:</label>
																<div class="col-md-8">
																	<input class="form-control" value="<?=$value['name']?>" placeholder="Введите желаемое название блока" name="blokname" type="text" style="margin-bottom: 10px;">
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3">Отображение:</label>
																<div class="col-md-8">
																	<select class="form-control" name="blokshow" style="margin-bottom: 10px;">
																		<option value="2" <? if ($value['show'] == '2'): echo 'selected'; endif;?>>Отображать блок</option>
																		<option value="1" <? if ($value['show'] == '1'): echo 'selected'; endif;?>>Скрыть блок</option>
																	</select>
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3">Содержание:</label>
																<div class="col-md-8">
																	<textarea name="blokcontent" class="form-control" rows="3" placeholder="Содержание блока..." style="margin-bottom: 20px;"><?=$value['content']?></textarea>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button class="btn btn-primary" type="submit">Сохранить изменения</button><button class="btn btn-default-outline" data-dismiss="modal" type="button">Закрыть</button>
														</div>
													</div>
												</form>
											</div>
										</div>
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
							<i class="icon-reorder"></i>Создание нового блока
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post" enctype="multipart/form-data" autocomplete="off">
								<?=$token?>
								<input type="hidden" name="createbloks" value="on">
								<div class="form-group">
									<label class="control-label col-md-3">Название блока:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите желаемое название блока" name="nameblok" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Отображение:</label>
									<div class="col-md-8">
										<select class="form-control" name="show">
											<option value="2">Отображать блок</option>
											<option value="1">Скрыть блок</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Содержание:</label>
									<div class="col-md-8">
										<textarea name="contentblok" class="form-control" rows="3" placeholder="Содержание блока..."></textarea>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Создать новый блок</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		