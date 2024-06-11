  <body class="login2">
    <!-- Login Screen -->
    <div class="login-wrapper">
		<a href="/"><img height="100" src="/style/general/images/logotype.png" /></a>
      <form method="post">
	  <?=$token?>
	  <?=$err[0]?><?=$err[1]?><?=$err[2]?><?=$err[3]?><?=$err[4]?>
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-addon"><i class="icon-envelope"></i></span><input name="email" class="form-control" placeholder="Введите ваш Email" type="text">
          </div>
        </div>
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-addon"><i class="icon-lock"></i></span><input name="secretkey" class="form-control" placeholder="Введите ваше кодовое слово" type="password">
          </div>
        </div>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Восстановить пароль">
      </form>
    </div>
    <!-- End Login Screen -->
  </body>