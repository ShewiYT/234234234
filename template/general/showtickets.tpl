
<br><div class="container-fluid main-content">
	<div class="page-title">
		<h1>
			Просмотр созданного Вами тикета
		</h1>
	</div>
	<div class="row">
		<!-- FAQ Nav -->
		<div class="col-sm-3">
            <div class="list-group">
				<div class="nav">
					<a class="list-group-item" href="/tickets/list/">
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
					<div class="widget-container scrollable chat">
						<div class="heading">
							<i class="icon-comments"></i>Диалог с <a href="#">Технической поддержкой</a>
						</div>
						<div class="widget-content padded">
							<ul>
							<?php foreach ($get_tickets as $key => $value): ?>
								<?php if ($value['creator'] == 'Юзер'): ?>
								<li class="current-user">
									<img width="30" height="30" src="/style/general/images/client.png" />
									<div class="bubble">
										<a class="user-name" href="#">Клиент</a>
										<p class="message">
											<?=$value['message']?>
										</p>
										<p class="time">
											<?=$value['date']?>
										</p>
									</div>
								</li>
								<?php else: ?>
								<li>
									<img width="30" height="30" src="/style/general/images/support.jpg" />
									<div class="bubble">
										<a class="user-name" href="#">Техническая поддержка</a>
										<p class="message">
											<?=$value['message']?>
										</p>
										<p class="time">
											<?=$value['date']?>
										</p>
									</div>
								</li>
								<?php endif; ?>
								<?php endforeach; ?>
							</ul>
						</div>
						<form action="" method="post">
						<?=$token?>
						<div class="post-message">
							<input class="form-control" name="message" placeholder="Напишите Ваше сообщение...." type="text"><input type="submit" value="Отпр.">
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>																										
