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
                Настройка оплаты
			</li>
		</ul>
	</div>
	<div class="col-lg-12">
	<?=$err[97]?><?=$err[98]?><?=$err[99]?><?=$err[0]?>
		<div class="bs-example">
			<ul class="nav nav-tabs nav-justified">
				<li class="active"><a data-toggle="tab" href="#defaultpay">Стандартная система приёма платежей</a></li>
				<li><a data-toggle="tab" href="#freepay"><img src="http://www.free-kassa.ru/img/logo.png" style="width: 15px;">  Система приёма платежей - ФриКасса</a></li>
				<li><a data-toggle="tab" href="#interpay"><img src="https://www.interkassa.com/img/ik_logo/Logo-RU-300dpi.png" style="width: 50px;">  Система приёма платежей - ИнтерКасса</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div id="defaultpay" class="tab-pane fade in active">
				<div class="widget-container fluid-height clearfix">
					<div class="heading">
						<i class="icon-reorder"></i>Настройка стандартного приёма платежей
					</div>
					<div class="widget-content padded">
						<?php if (!$get_webmoney): ?>
						<form class="form-horizontal" action="/shops/settings/<?=$_GET['shop']?>/payment/" method="post" enctype="multipart/form-data" autocomplete="off">
							<?=$token?>
							<div class="form-group">
								<label class="control-label col-md-2">WMID</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите Ваш WMID" name="wmid" id="wmid" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">WMR</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите Ваш WMR - рублёвый кошелек" name="wmr" id="wmr" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">WMZ</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите Ваш WMZ - долларовый кошелек" name="wmz" id="wmz" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Пароль к файлу-ключей</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите пароль от файла ключей" autocomplete="off" name="wmpassword" id="wmpassword" type="password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Путь к файлу ключей</label>
								<div class="col-md-4">
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="input-group">
											<div class="form-control">
												<i class="icon-file fileupload-exists"></i><span class="fileupload-preview"></span>
											</div>
											<div class="input-group-btn">
												<a class="btn btn-default fileupload-exists" data-dismiss="fileupload" href="#">Удалить</a><span class="btn btn-default btn-file"><span class="fileupload-new">Найти</span><span class="fileupload-exists">Изменить</span><input name="keyfile" type="file"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary" onclick="if (!confirm('Вы уверены, что хотите подключить WebMoney?\nFree-Kassa НЕ будет отключена, если он включена.')) return false;" data-loading-text="Передаем данные...">Сохранить настройки ВебМани</button>
							<?php if (!$get_yandex): ?>
							<a class="btn btn-primary pull-right" onclick="if (!confirm('Вы уверены, что хотите подключить Яндекс.Деньги?\nFree-Kassa НЕ будет отключена, если он включена.')) return false;" href="/shops/settings/<?=$_GET['shop']?>/payment/yandex/">Привязать кошелёк Яндекс.Деньги</a>
							<?php else: ?>
							<a class="btn btn-danger pull-right" href="/shops/settings/<?=$_GET['shop']?>/payment/yandex/off/" onclick="if (!confirm('Вы уверены, что хотите отключить прием Яндекс.Денег?\nВсе незавершенные заказы невозможно будет выполнить.')) return false;">Отключить кошелёк Яндекс.Деньги</a>
							<?php endif; ?>
						</form>
						<?php else: ?>
						<form class="form-horizontal" action="/shops/settings/<?=$_GET['shop']?>/payment/" method="post" enctype="multipart/form-data" autocomplete="off">
							<?=$token?>
							<div class="form-group">
								<label class="control-label col-md-2">WMID</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="<?=$get_webmoney['wmid']?>" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">WMR</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="<?=$get_webmoney['wmr']?>" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">WMZ</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="<?=$get_webmoney['wmz']?>" type="text">
								</div>
							</div>
							<a href="/shops/settings/<?=$_GET['shop']?>/payment/webmoney/off/" onclick="if (!confirm('Вы уверены, что хотите отключить прием WebMoney?\nВсе незавершенные заказы невозможно будет выполнить.')) return false;" class="btn btn-danger" data-loading-text="Передаем данные...">Отключить приём денежных средств с помощью ВебМани</a>
							<?php if (!$get_yandex): ?>
							<a class="btn btn-primary pull-right" onclick="if (!confirm('Вы уверены, что хотите подключить Яндекс.Деньги?\nFree-Kassa НЕ будет отключена, если он включена.')) return false;" href="/shops/settings/<?=$_GET['shop']?>/payment/yandex/">Привязать кошелёк Яндекс.Деньги</a>
							<?php else: ?>
							<a class="btn btn-danger pull-right" href="/shops/settings/<?=$_GET['shop']?>/payment/yandex/off/" onclick="if (!confirm('Вы уверены, что хотите отключить прием Яндекс.Денег?\nВсе незавершенные заказы невозможно будет выполнить.')) return false;">Отключить кошелёк Яндекс.Деньги</a>
							<?php endif; ?>
						</form>
						<?php endif; ?>
					</div>
				</div>
			</div>
			<div id="freepay" class="tab-pane fade">
				<div class="widget-container fluid-height clearfix">
					<div class="heading">
						<i class="icon-reorder"></i>Настройка системы приёма платежей - ФриКасса
					</div>
					<div class="widget-content padded">
						<? if (!$get_freekassa): ?>
						<form class="form-horizontal" action="/shops/settings/<?=$_GET['shop']?>/payment/" method="post" enctype="multipart/form-data">
							<?=$token?>
							<div class="form-group">
								<label class="control-label col-md-2">ID магазина</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите ID магазина в системе Free-Kassa" name="id_shop_fk" id="id_shop_fk" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Секретное сл. 1</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите секретное слово 1" name="secret1" id="secret1" type="password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Секретное сл. 2</label>
								<div class="col-md-7">
									<input class="form-control" placeholder="Введите секретное слово 2" name="secret2" id="secret2" type="password">
								</div>
							</div>
							<button type="submit" class="btn btn-primary" onclick="if (!confirm('Вы уверены, что хотите подключить платёжную систему Free-Kassa?\nВсе другие методы оплаты НЕ будут отключены.')) return false;" data-loading-text="Сохраняем данные...">Подключить систему приёма платежей ФриКасса</button>
							<button href="#freekassafaq" data-toggle="modal" onclick="event.preventDefault()" class="btn btn-primary pull-right">Как настроить ФриКасса?</button>
							<div id="freekassafaq" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- Заголовок модального окна -->
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h4 class="modal-title">Инструкция по подключению Free-Kassa</h4>
										</div>
										<!-- Основное содержимое модального окна -->
										<div class="modal-body">
											<div class="form-group">
												<label class="col-sm-2" style="width: 100%;">В настройках своего магазина в системе Free-Kassa Вам нужно указать:</label><br><br>
												<table class="table table-hover">
													<tbody>
														<tr>
															<td>Название сайта:</td>
															<td><strong>*Название Вашего сайта*</strong></td>
														</tr>
														<tr>
															<td>URL сайта:</td>
															<td><strong>*URL Вашего магазина*</strong></td>
														</tr>
														<tr>
															<td>Секретное слово:</td>
															<td><strong>*Придумайте Ваше секретное слово*</strong></td>
														</tr>
														<tr>
															<td>Секретное слово 2:</td>
															<td><strong>*Придумайте Ваше секретное слово 2*</strong></td>
														</tr>
														<tr>
															<td>URL оповещения:</td>
															<td><strong>http://*URL Вашего магазина*/item/get/</strong></td>
														</tr>
														<tr>
															<td>Метод оповещения:</td>
															<td><strong>POST</strong></td>
														</tr>
														<tr>
															<td>URL возврата в случае успеха:</td>
															<td><strong>http://*URL Вашего магазина*/item/success/</strong></td>
														</tr>
														<tr>
															<td>Метод отсылки URL в случае успеха:</td>
															<td><strong>POST</strong></td>
														</tr>
														<tr>
															<td>URL возврата в случае неудачи:</td>
															<td><strong>http://*URL Вашего магазина*/item/error/</strong></td>
														</tr>
														<tr>
															<td>Метод отсылки URL в случае неудачи:</td>
															<td><strong>POST</strong></td>
														</tr>
													</tbody></table><br>
													<center><label class="col-sm-2" style="width: 100%;">Остальные настройки производите по Вашему усмотрению.</label></center>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<? else: ?>
						<form class="form-horizontal">
							<div class="form-group">
								<label class="control-label col-md-2">ID магазина</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="<?=$get_freekassa['id_shop_fk']?>" type="text">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Секретное сл. 1</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="********" type="password">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-2">Секретное сл. 2</label>
								<div class="col-md-7">
									<input class="form-control" disabled value="********" type="password">
								</div>
							</div>
							<a class="btn btn-danger" href="/shops/settings/<?=$_GET['shop']?>/payment/freekassa/off/" onclick="if (!confirm('Вы уверены, что хотите отключить платёжную систему Free-Kassa?\nВсе незавершенные заказы невозможно будет выполнить.')) return false;">Отключить платёжную систему ФриКасса</a>
						</form>
						<? endif; ?>
					</div>
				</div>	
				
			</div>
			<div id="interpay" class="tab-pane fade">
				<div class="widget-container fluid-height clearfix">
					<div class="heading">
						<i class="icon-reorder"></i>Настройка системы приёма платежей - ИнтерКасса
					</div>
					<div class="widget-content padded">
						<p>Извините, но в данный момент Вы не можете подключить данную систему приёма платежей.</p>
					</div>
				</div>
			</div>
		</div>				