  <body class="login2">
    <!-- Login Screen -->
    <div class="login-wrapper">
	<a href="/"><img height="100" src="/style/general/images/logotype.png" /></a>
      <form method="post">
	  <?=$token?>
	  <? if ($err[0] != '' or $err[1] != '' or $err[2] != '' or $err[3] != '' or $err[4] != '' or $err[5] != '') { ?>
			<div class="alert alert-danger"><?=$err[0]?><?=$err[1]?><?=$err[2]?><?=$err[3]?><?=$err[4]?><?=$err[5]?></div>
		<? } ?>
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-addon"><i class="icon-envelope"></i></span><input name="login" class="form-control" placeholder="Введите ваш логин" type="text">
          </div>
        </div>
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-addon"><i class="icon-lock"></i></span><input name="password" class="form-control" placeholder="Введите ваш пароль" type="password">
          </div>
        </div>
		<div class="form-group">
			<div class="input-group">
            <span class="input-group-addon"><i class="icon-exclamation-sign"></i></span><input name="secretkey" class="form-control" placeholder="Введите ваше кодовое слово" type="password">
          </div>
        </div>
		<div class="form-group">
			<div class="input-group">
			<img src="http://rentshops.ru/secpic.php" data-toggle="tooltip" title="" rel="nofollow" data-original-title="Нажмите, если не видно" onclick="document.getElementById('captcha').src = 'http://rentshops.ru/secpic.php?' + Math.random()" style="margin: 2px auto;height: 44px;width: 127px;float: right;" id="captcha">
                <input style="width: 290px;" type="text" id="secpic" name="secpic" class="form-control" placeholder="Введите код с картинки">
			</div>
		</div>
        <a class="pull-right" href="/forgot/">Забыли пароль?</a>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Авторизоваться">
      </form>
      <p>
        Еще не зарегистрированы в нашей системе?
      </p>
      <a class="btn btn-default-outline btn-block" href="/register/">Зарегистрироваться сейчас</a>
    </div>
    <!-- End Login Screen -->
  </body>
		  <script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>