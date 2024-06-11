
<body class="login2">
    <!-- Signup Screen -->
    <div class="login-wrapper">
		<a href="/"><img height="100" src="/style/general/images/logotype.png" /></a>
		<form method="post">
			<?=$token?>
			<? if((empty($err[8]))) { if ($err[0] != '' or $err[6] != '' or $err[7] != '' or $err[2] != '' or $err[3] != '' or $err[4] != '' or $err[5] != '' or $err[9] != '' or $err[10] != '' or $err[11] != '') { ?>
				<div class="alert alert-danger"><?=$err[0]?><?=$err[6]?><?=$err[1]?><?=$err[7]?><?=$err[2]?><?=$err[3]?><?=$err[4]?><?=$err[5]?><?=$err[9]?><?=$err[10]?><?=$err[11]?></div>
			<? } } ?>
			<?php if (empty($err[8])): ?>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon-male"></i></span><input name="login" class="form-control" type="text" placeholder="Введите логин" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Мин. 3 символа">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon-envelope"></i></span><input name="email" class="form-control" type="text" placeholder="Введите Email" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Изменить будет невозможно">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon-lock"></i></span><input name="password" class="form-control" type="password" placeholder="Придумайте пароль" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Мин. 6 символов">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon-ok"></i></span><input name="password2" class="form-control" type="password" placeholder="Повторите написанный выше пароль">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon-exclamation-sign"></i></span><input name="secretkey" class="form-control" type="password" placeholder="Придумайте кодовое слово" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Изменить будет невозможно">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<img src="http://rentshops.ru/secpic.php" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Нажмите, если не видно" onclick="document.getElementById('captcha').src = 'http://rentshops.ru/secpic.php?' + Math.random()" style="margin: 2px auto;height: 44px;width: 127px;float: right;" id="captcha">
					<input style="width: 290px;" type="text" id="secpic" name="secpic" class="form-control" placeholder="Введите код с картинки">
				</div>
			</div>
			<div class="form-group">
				<label class="checkbox text-left"><input type="checkbox" name="agree"><span>Я прочитал и согласен с <a href="/agreement/" target="_blank">правилами соглашения</a></span></label>
			</div>
			<input class="btn btn-lg btn-primary btn-block" onclick="submit();" type="submit" value="Зарегистрироваться" data-loading-text="Регистрируем...">
			<p>
				Уже имеется зарегистрированный аккаунт?
			</p>
			<a class="btn btn-default-outline btn-block" href="/auth/">Авторизоваться</a>
			<?php else: ?>
			<div class="alert alert-success">Спасибо за регистрацию! Теперь вы можете <a href="/auth/">войти</a> в свой аккаунт.</div>
			<?php endif; ?>
		</form>
	</div>
	<script>
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
    <!-- End Signup Screen -->
</body>