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
        Список всех тикетов
      </h1>
    </section>
    <section class="content">
	<div class="row">
        <div class="col-xs-12">
          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Список всех тикетов</h3>
            </div>
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
				<tr>
				<th>ID</th>
                <th>Тема</th>
				<th>Статус</th>
				<th>Заявка создана</th>
				<th>Заявка обновлена</th>
				<th>Действия</th>
                </tr>
				<?php foreach ($get_tickets as $key => $value): ?>
				<tr>
				<td><?=$value['id']?></td>
				<td><?=$value['subject']?></td>
				<td><small class="<? if ($value['status'] == 'Без ответа'): echo 'label bg-orange'; endif;
				if ($value['status'] == 'Отвечен'): echo 'label bg-green'; endif;
				if ($value['status'] == 'Закрыта'): echo 'label bg-red'; endif;?>" style="font-size: 11px;"><?=$value['status']?></small></td>
				<td><small class="label bg-blue" style="font-size: 11px;"><?=$value['date_add']?></small></td>
				<td><small class="label bg-blue" style="font-size: 11px;"><?=$value['date_upd']?></small></td>
				<td><?php if ($value['status'] != 'Закрыта'):?>
				<a href="/controlpanel/tickets/show/<?=$value['id']?>/">Просмотреть тикет</a>
				<?php else: ?>
				<a href="/controlpanel/tickets/delete/<?=$value['id']?>/">Удалить тикет</a></td>
				<?php endif; ?>
				</tr>
				<?php endforeach; ?>
              </tbody></table>
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