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
  <?php if (empty($chk)): ?>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Список всех магазинов
      </h1>
    </section>
    <section class="content">
	<div class="alert alert-info alert-dismissible">
                <h4><i class="icon fa fa-info"></i> Информация!</h4>
            Прибыль сервиса: <span><strong><?=$get_stat_full_rub_service['sum']?></strong></span> руб. и <span><strong><?=$get_stat_full_usd_service['sum']?></strong></span> $<br/>
	        Всего работающих магазинов: <span><strong><?=$count_shops['count']?></strong></span>
    </div>
	<div class="row">
        <div class="col-xs-12">
          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">Список работающих магазинов</h3>
            </div>
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody>
				<tr>
				<th>Домен</th>
                <th>Оплачен до</th>
				<th>Статус</th>
				<th>Действия</th>
                </tr>
				<?php foreach ($get_all_shops as $key => $value): ?>
				<tr>
				<td><span><a target="_blank" href="http://<?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?>"><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></a></span></td>
				<td><small style="font-size: 11px;" class="<?php if ($value['date'] < date("Y-m-d H:i:s")): echo "label bg-red"; else: echo "label bg-green"; endif; ?>"><?=date('d.m.Y H:i',strtotime($value['date']))?></small></td>
				<td><small style="font-size: 11px;" class="<?php if ($value['status'] == 'Заблокирован'): echo "label bg-red"; else: echo "label bg-green"; endif; ?>"><?=$value['status']?></small></td>
				<td><form method="post" action=""><input type="hidden" name="domain" id="domain" value="<?=$value['domain']?>" /><input type="submit" value="Подробнее" /></form></td>
				</tr>
				<?php endforeach; ?>
              </tbody></table>
            </div>
          </div>
        </div>
      </div>
	</section>
  </div>
  <?php else: ?>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Редактирование магазина <?=$get_shop['domain']?>
      </h1>
    </section>
    <section class="content">
	<div class="alert alert-info alert-dismissible">
                <h4><i class="icon fa fa-info"></i> Информация!</h4>
            Прибыль сервиса: <span><strong><?=$get_stat_full_rub_service['sum']?></strong></span> руб. и <span><strong><?=$get_stat_full_usd_service['sum']?></strong></span> $<br/>
	        Всего работающих магазинов: <span><strong><?=$count_shops['count']?></strong></span>
    </div>
	<div class="box box-danger">	  
            <div class="box-header with-border">
              <h3 class="box-title">Редактировать магазин</h3>
            </div>
              <div class="box-body">
			 <form class="form-horizontal" method="post" action="">
                <div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Имя домена:</label>
				  <div class="col-sm-7">
                    <input type="text" class="form-control" disabled value="<?=$get_shop['domain']?>">
                  </div>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Оплачен до:</label>
				  <div class="col-sm-7">
                    <input type="text" class="form-control" disabled value="<?=date('d.m.Y H:i',strtotime($get_shop['date']))?>">
                  </div>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Статус:</label>
				  <div class="col-sm-7">
                    <input type="text" class="form-control" disabled value="<?=$get_shop['status']?>">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
				<input type="hidden" name="domain" value="<?=$get_shop['domain']?>" />
                <input type="submit" name="action" class="btn btn-info pull-left" data-loading-text="Передаем данные..." value="<?php if ($get_shop['status'] == 'Заблокирован'): echo "Разблокировать"; else: echo "Заблокировать"; endif; ?>" />
				<a href="<?=htmlspecialchars($_SERVER["HTTP_REFERER"])?>" class="btn btn-info pull-right" data-loading-text="Передаем данные...">Вернуться назад</a>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
		  <div class="alert alert-warning alert-dismissible">
                <h4><i class="icon fa fa-info"></i> Информация!</h4>
            Заработано магазином за последние <strong>24 часа</strong>: <strong><?=$get_stat_day_rub['sum']?></strong> руб. и <strong><?=$get_stat_day_usd['sum']?></strong> $<br/>
	        Заработано магазином за последние <strong>30 дней</strong>: <strong><?=$get_stat_mounth_rub['sum']?></strong> руб. и <strong><?=$get_stat_mounth_usd['sum']?></strong> $<br/>
	        Заработано магазином за <strong>всё время</strong>: <strong><?=$get_stat_full_rub['sum']?></strong> руб. и <strong><?=$get_stat_full_usd['sum']?></strong> $<br/>
    </div>
	</section>
  </div>
  <?php endif; ?>
	<? include './template/template_panel_footer.tpl'; ?>
</div>
</body>
</html>