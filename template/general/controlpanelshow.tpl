<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="/style/general/panel/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/style/general/panel/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper"> 
 <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" style="margin-top: -47px;">
        <li class="header">АДМИН-ЦЕНТР</li>
		<li>
          <a href="/">
            <i class="fa fa-th"></i> <span>Главная страница</span>
          </a>
        </li>
		<li>
          <a href="/controlpanel/">
            <i class="glyphicon glyphicon-shopping-cart"></i> <span>Список магазинов</span>
          </a>
        </li>
		<li>
          <a href="/controlpanel/tickets/">
            <i class="glyphicon glyphicon-envelope"></i> <span>Список тикетов</span>
			<? if ($new_tickets['count'] == '0'): echo '<span class="label label-success pull-right"><strong>0</strong></span>'; else: echo '<span class="label label-danger pull-right"><strong>'.$new_tickets['count'].'</strong></span>'; endif;?>
          </a>
        </li>
        </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Диалог с пользователем
      </h1>
    </section>
    <section class="content">
	      <div class="row">
        <div class="col-md-12">
          <div class="box box-danger direct-chat direct-chat-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Диалог с пользователем</h3>
            </div>
            <div class="box-body">
              <div class="direct-chat-messages">
			  <?php foreach ($get_tickets as $key => $value): ?>
			  <?php if ($value['creator'] == 'Админ'): ?>
                <div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-left">Вы</span>
                    <span class="direct-chat-timestamp pull-right"><?=$value['date']?></span>
                  </div>
                  <img class="direct-chat-img" src="/style/general/images/support.jpg">
                  <div class="direct-chat-text">
                    <?=$value['message']?>
                  </div>
                </div>
				<?php else: ?>
				<div class="direct-chat-msg right">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-right">Пользователь</span>
                    <span class="direct-chat-timestamp pull-left"><?=$value['date']?></span>
                  </div>
                  <img class="direct-chat-img" src="/style/general/images/client.png">
                  <div class="direct-chat-text">
                    <?=$value['message']?>
					</div>
                </div>
				<?php endif; ?>
				<?php endforeach; ?>
              </div>
            </div>
            <div class="box-footer">
              <form action="" method="post">
			  <?=$token?>
                <div class="input-group">
                  <input type="text" name="message" placeholder="Введите ответ..." class="form-control">
                      <span class="input-group-btn">
					  <script>
						function isEmail() {
						if (confirm("Вы действительно хотите закрыть тикет?\nОткрыть вновь будет невозможно!")) {
												
						} else {
							event.preventDefault();
						}
						};
						</script>
                        <button type="submit" data-loading-text="Отвечаем..." class="btn btn-primary btn-flat">Ответить</button>
						<button type="submit" name="closeticket" value="1" onclick="isEmail();" data-loading-text="Закрываем..." class="btn btn-danger btn-flat">Закрыть</button>
                      </span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
	</section>
  </div>
	<? include './template/template_panel_footer.tpl'; ?>
</div>
</body>
</html>