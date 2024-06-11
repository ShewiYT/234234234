<br><div class="container-fluid main-content">
	<div class="page-title">
		<h1>
			Центр поддержки пользователей
		</h1>
	</div>
	<div class="row">
		<!-- FAQ Nav -->
		<div class="col-sm-3">
            <div class="list-group">
				<div class="nav">
					<a class="list-group-item" data-toggle="tab" href="#list">
						<p>
							<span class="badge">5</span>Список Ваших заявок
						</p>
						</a><a class="list-group-item" href="/faq/">
						<p>
							<span class="badge">4</span>Часто задаваемые вопросы
						</p>
					</a>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="list" class="tab-pane fade in active">
				<div class="col-sm-9">
					<?php if (empty($get_tickets)): ?>
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<div class="alert alert-warning">Вы еще не создали ни одного тикета</div>
							<a href="#create-ticket" class="btn btn-block btn-info btn-sm fancybox" style="width: 295px;float:left;" data-loading-text="Загружаем данные..."><span class="icon-plus"></span>Создать новый тикет</a>
						</div>
					</div>
					<?php else: ?>
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>ID</th>
										<th>Тема</th>
										<th>Статус</th>
										<th>Заявка создана</th>
										<th>Заявка обновлена</th>
										<th>Действия</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($get_tickets as $key => $value): ?>
									<tr>
										<td><?=$value['id']?></td>
										<td><?=$value['subject']?></td>
										<td><span class="<? if ($value['status'] == 'Без ответа'): echo 'label label-warning'; endif;
											if ($value['status'] == 'Отвечен'): echo 'label label-green'; endif;
										if ($value['status'] == 'Закрыта'): echo 'label label-danger'; endif;?>" style="font-size: 11px;"><?=$value['status']?></span></td>
										<td><span class="label label-info" style="font-size: 11px;"><?=$value['date_add']?></span></td>
										<td><span class="label label-info" style="font-size: 11px;"><?=$value['date_upd']?></span></td>
										<td><?php if ($value['status'] != 'Закрыта'):?>
											<a href="/tickets/<?=$_SESSION['auth']['id']?>/show/<?=$value['id']?>/">Просмотреть тикет</a>
											<?php else: ?>
										<a href="/tickets/<?=$_SESSION['auth']['id']?>/delete/<?=$value['id']?>/">Удалить тикет</a></td>
										<?php endif; ?>
									</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
							<a href="#create-ticket" class="btn btn-block btn-info btn-sm fancybox" style="width: 295px;float:left;" data-loading-text="Загружаем данные..."><span class="icon-plus"></span>Создать новый тикет</a>
							<h6 style="float:right;">* При добавлении ответа, Ваш запрос будет перемещен в конец очереди.</h6>
						</div>
					</div>
					<?php endif; ?>
				</div>
			</div>
		</div>
		<div id="create-ticket" style="display: none">
			<h2>
				Создание нового тикета
			</h2>
			<p>
				<div class="alert alert-info">
					* Ваша заявка может рассматриваться от 1-го часа до 72 часов.
				</div>
				<form class="form-horizontal" method="post" action="/tickets/create/">
				<?=$token?>
				<div style="width: 96.6%;">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-md-3">Тема тикета:</label>
							<div class="col-md-9">
								<input class="form-control" placeholder="Введите тему обращения" name="subject" id="subject" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Сообщение:</label>
							<div class="col-md-9">
								<textarea name="message" class="form-control" rows="5" placeholder="Опишите Вашу проблему или задайте вопрос..."></textarea>
							</div>
						</div>
					</form>
					<button type="submit" style="width: 100%;" class="btn btn-info"><i class="icon-ok-circle"></i>Отправить тикет</button>
				</div>
				</form>
			</p>
		</div>
		</div>																										