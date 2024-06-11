<div class="container-fluid main-content">
	<div class="page-title">
		<br>
	</div>
	<div class="row">
		<div class="col-sm-3">
            <div class="widget-container fluid-height">
				<div class="widget-content">
					<div class="panel-group" id="accordion">
						<div class="panel filter-categories">
							<div class="panel-heading">
								<div class="panel-title">
									<a class="accordion-toggle">
									Меню</a>
								</div>
							</div>
							<div class="panel-collapse collapse in" id="collapseThree">
								<div class="panel-body">
									<div class="btn-group nav nav-tabs">
										<label data-toggle="tab" href="#profile" class="btn btn-block btn-info"><i class="icon-male"></i>Настройки профиля<input type="checkbox"></label>
										<label data-toggle="tab" href="#allmessages" class="btn btn-block btn-info"><i class="icon-info-sign"></i>Все ваши уведомления<input type="checkbox"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br><script type="text/javascript" src="//vk.com/js/api/openapi.js?121"></script>
			
			<!-- VK Widget -->
			<div id="vk_groups"></div>
			<script type="text/javascript">
				VK.Widgets.Group("vk_groups", {mode: 0, width: "292", height: "300", color1: 'F9F6F6', color2: '2B587A', color3: '5bc0de'}, 113747594);
			</script>
		</div>
		<div class="tab-content">
			<div id="profile" class="tab-pane fade in">
				<div class="col-md-9">
					<span id="requeststat"></span>
					<div class="widget-container">
						<div class="heading">
							<i class="icon-shield"></i>Информация о Вас
						</div>
						<div class="widget-content padded">
							<?=$token?>
							<fieldset>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Ваш логин, указанный при регистрации</label><input class="form-control" disabled value="<?=$get_user['login']?>" type="text">
										</div>
										<div class="form-group">
											<label>Ваш Email, указанный при регистрации</label><input class="form-control" disabled value="<?=$get_user['email']?>" type="text">
										</div>
										<div class="form-group">
											<label>Способы связи с Вами</label><input class="form-control" id="skype" name="icq" placeholder="Ваш Skype" value="<?=$get_user['contacts']?>" type="text">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Текущий пароль</label><input class="form-control" placeholder="Если не хотите изменять пароль, оставьте поле пустым" type="password" pattern="^[A-Za-z0-9]{4,20}$" id="password" name="password">
										</div>
										<div class="form-group">
											<label>Новый пароль</label><input class="form-control" placeholder="Если не хотите изменять пароль, оставьте поле пустым" type="password" pattern="^[A-Za-z0-9]{4,20}$" id="newpassword" name="newpassword">
										</div>
										<div class="form-group">
											<label>Подтвердите новый пароль</label><input class="form-control" placeholder="Если не хотите изменять пароль, оставьте поле пустым" type="password" pattern="^[A-Za-z0-9]{4,20}$" id="newpassword2" name="newpassword2">
										</div>
									</div>
								</div>
								<button class="btn btn-primary" id="upd" onclick="updstat()">Сохранить заданные вами настройки</button>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
			<div id="allmessages" class="tab-pane fade in active">
				<div class="col-sm-9">
					<?=$err[0]?>
					<div class="widget-container fluid-height">
						<!-- Table -->
						<table class="table table-filters table-hover">
							<thead>
								<th width="60">
									Метка
								</th>
								<th>
									Сообщение
								</th>
								<th>
									Действие
								</th>
							</thead>
							<tbody>
								<?php foreach ($get_goods as $key => $value): 
								if ($value['count'] <= 0): ?>
								<tr>
									<td class="filter-category red">
										<div class="arrow-left"></div>
										<i class="icon-exclamation"></i>
									</td>
									<td>
										<span class="label label-danger">Внимание!</span> В Вашем магазине <strong><?=$get_shop_uved['domain']?></strong> закончился товар, который имеет ID: [<strong><?=$value['id']?></strong>].
									</td>
									<td>
										<a href="/shops/settings/<?=$get_shop_uved['domain']?>/goods/edit/<?=$value['id']?>/">Пополнить товар</a>
									</td>
								</tr>
								<? endif; ?>
								<? endforeach; ?>
								<? if($counter == 0): ?>
								Новостей в Ваших магазинах нет
								<? endif; ?>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-sm-9">
					<div class="widget-container fluid-height">
						<!-- Table -->
						<table class="table table-filters table-hover">
							<thead>
								<th>Действие</th>
								<th>Дата</th>
								<th>Айпи</th>
								<th>Браузер</th>
							</thead>
							<tbody>
								<? $user_log = $db->rows("SELECT * FROM user_log WHERE user_id = ".$_SESSION['auth']['id']." order by id desc LIMIT 20"); ?>
								<?php foreach ($user_log as $key => $value): ?>
								<tr>
									<td><? if ($value['work'] == 'Авторизация') { ?>
										<span class="label label-primary">Авторизация</span>
										<? } else { ?>
										<span class="label label-success">Смена пароля</span>
									<? } ?>
									</td>
									<td><? echo $value['data']; ?></td>
									<td><? echo $value['ip']; ?></td>
									<td><? echo $value['browser']; ?></td>
								</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>

