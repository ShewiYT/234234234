<br>
<script type="text/javascript" src="http://cdn.wysibb.com/js/jquery.wysibb.min.js"></script>
<link rel="stylesheet" href="http://cdn.wysibb.com/css/default/wbbtheme.css" type="text/css">
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
                Управление страницами
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
							<i class="icon-reorder"></i>Список страниц магазина
						</div>
						<div class="widget-content padded">
						<? if (!$get_newpages):?>
						<div class="alert alert-warning">Вы еще не создали ни одной страницы</div>
						<? else: ?>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Название страницы</th>
										<th>Префикс</th>
										<th>Действия</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($get_newpages as $key => $value): ?>
									<tr>
										<td><?=$value['id']?></td>
										<td><?=$value['name']?></td>
										<td><?=$value['prefix']?></td>
										<td><a data-toggle="modal" href="#editpage<?=md5($value['id'])?>">Редактировать</a> \ <a onclick="if (!confirm('Вы уверены, что хотите удалить страницу?')) return false;" href="/shops/settings/<?=$_GET['shop']?>/delpage/<?=$value['id']?>/">Удалить</a></td>
										
										<div class="modal fade" id="editpage<?=md5($value['id'])?>">
											<div class="modal-dialog">
												<form action="" method="POST" class="form-horizontal">
												<?=$token?>
													<div class="modal-content">
														<div class="modal-header">
															<button aria-hidden="true" class="close" data-dismiss="modal" type="button">&times;</button>
															<h4 class="modal-title">
																Редактирование страницы
															</h4>
														</div>
														<div class="modal-body">
															<input type="hidden" name="editpage" value="on">
															<input type="hidden" name="idpage" value="<?=$value['id']?>">
															<div class="form-group">
																<label class="control-label col-md-3">Название:</label>
																<div class="col-md-8">
																	<input class="form-control" value="<?=$value['name']?>" placeholder="Введите желаемое название страницы" name="pagename" type="text" style="margin-bottom: 10px;">
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3">Ссылка:</label>
																<div class="col-md-8">
																	<input class="form-control" value="<?=$value['prefix']?>" placeholder="Введите желаемую ссылку на страницу (Только латинские символы и цифры)" name="pageprefix" type="text" style="margin-bottom: 10px;">
																</div>
															</div>
															<div class="form-group">
																<label class="control-label col-md-3">Содержание:</label>
																<div class="col-md-8">
																	<textarea name="pagecontent" class="form-control" rows="3" placeholder="Содержание страницы..." style="margin-bottom: 20px;"><?=$value['content']?></textarea>
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
							<i class="icon-reorder"></i>Создание новой страницы
						</div>
						<div class="widget-content padded">
							<form class="form-horizontal" action="" method="post" enctype="multipart/form-data" autocomplete="off">
								<?=$token?>
								<input type="hidden" name="createpage" value="on">
								<div class="form-group">
									<label class="control-label col-md-3">Название страницы:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите желаемое название страницы" name="namepage" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Ссылка страницы:</label>
									<div class="col-md-8">
										<input class="form-control" placeholder="Введите желаемую ссылку на страницу (Только латинские символы и цифры)" name="prefixpage" type="text">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">Содержание:</label>
									<div class="col-md-8">
										<textarea name="contentpage" id="editor" class="form-control" rows="3" placeholder="Содержание страницы..."></textarea>
									</div>
								</div>
								<button type="submit" class="btn btn-primary" data-loading-text="Передаем данные...">Создать новую страницу</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
$(function() {
$("#editor").wysibb();
})
</script>