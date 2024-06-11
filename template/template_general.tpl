<?php if ($_GET['page'] == 'auth' or $_GET['page'] == 'register' or $_GET['page'] == 'forgot'): ?>
<html>
	<head>
		<title><?=$this->title?></title>
		<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<link href="/style/general/2/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
		
		<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
		<meta charset="utf-8">
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
				$("body").fadeIn(800);
			});
		</script>
	</head>
	<?=$this->controller?>
</html>
<? else: ?>
<?php if ($_GET['page'] == 'main' or $_GET['page'] == 'faq' or $_GET['page'] == 'about' or $_GET['page'] == 'catalog' or $_GET['page'] == 'error'  or $_GET['page'] == 'agreement' or $_GET['page'] == 'ops'): ?>
<!DOCTYPE html>
<html>
	<head>
		<title><?=$this->title?></title>
		<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<link href="/style/general/2/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="/style/general/2/gen/style.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="/style/general/2/gen/animate.css">
		<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		
		<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
		<script src="/style/general/2/gen/wow.min.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
			});
			var wow = new WOW;
			wow.init();
			$(document).ready(function() {
				$("body").css("display", "none");
				$("body").fadeIn(800);
			});
		</script>
	</head>
	<body>
		<div class="modal-shiftfix">
			<!-- Navigation -->
			<div class="navbar navbar-fixed-top scroll-hide">
				<div class="container-fluid top-bar">
					<button class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a href="/"><img src="/style/general/images/logotype.png" style="height: 45px;float: left;"></a>
					<div class="navbar-form form-inline col-lg-2 hidden-xs">
						<script type="text/javascript" src="//vk.com/js/api/openapi.js?121"></script>
						
						<!-- VK Widget -->
						<div id="vk_subscribe"></div>
						<script type="text/javascript">
							VK.Widgets.Subscribe("vk_subscribe", {mode: 1, soft: 1}, -113747594);
						</script>
					</div>
				</div>
				<? if (!empty($_SESSION['auth'])): ?>
				<div class="container-fluid main-nav clearfix">
					<div class="nav-collapse">
						<ul class="nav">
							<li>
								<a class="current" href="/"><span aria-hidden="true" class="icon-home"></span>Главная страница</a>
							</li>
							<li><a href="/profile/">
							<span aria-hidden="true" class="icon-user"></span>Личный кабинет</a>
							</li>
							<li><a href="/shops/">
							<span aria-hidden="true" class="icon-puzzle-piece"></span>Все ваши магазины</a>
							</li>
							<li><a href="/faq/">
							<span aria-hidden="true" class="icon-question"></span>FAQ по сервису</a>
							</li>
							<li><a href="/agreement/">
							<span aria-hidden="true" class="icon-foursquare"></span>Соглашение</a>
							</li>
							<li><a href="/tickets/list/">
							<span aria-hidden="true" class="icon-warning-sign"></span>Техподдержка</a>
							</li>
							<li><a href="/logout/">
							<span aria-hidden="true" class="icon-signout"></span>Выход</a>
							</li>
						</ul>
					</div>
				</div>
				<? else: ?>
				<div class="container-fluid main-nav clearfix">
					<div class="nav-collapse">
						<ul class="nav">
							<li>
								<a class="current" href="/"><span aria-hidden="true" class="icon-home"></span>Главная страница</a>
							</li>
							<li><a href="/auth/">
							<span aria-hidden="true" class="icon-signin"></span>Авторизация</a>
							</li>
							<li><a href="/register/">
							<span aria-hidden="true" class="icon-plus-sign-alt"></span>Регистрация</a>
							</li>
							<li><a href="/faq/">
							<span aria-hidden="true" class="icon-question"></span>FAQ по сервису</a>
							</li>
							<li><a href="/agreement/">
							<span aria-hidden="true" class="icon-foursquare"></span>Соглашение</a>
							</li>
							<li><a href="/demo/">
							<span aria-hidden="true" class="icon-lemon"></span>Демо-магазин</a>
							</li>
						</ul>
					</div>
				</div>
				<? endif; ?>
			</div>
			<!-- End Navigation -->
			<?=$this->controller?>
		</div>
	</body>
</html>

<? else: $db = $this->info_db; $get_user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));?>
<? if ($_GET['page'] == 'shopsorder'): ?>
<?=$this->controller?>
<? else: ?>
<!DOCTYPE html>
<html>
	<head>
		<title><?=$this->title?></title>
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
		
		<link href="/style/general/2/stylesheets/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
		
		<link href="/style/general/2/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
		
		<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
		
		
		
		<script src="/style/general/2/javascripts/jquery.bootstrap.wizard.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/fullcalendar.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/gcal.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.dataTables.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/datatable-editable.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.easy-pie-chart.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/excanvas.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.isotope.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/isotope_extras.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/modernizr.custom.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.fancybox.pack.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/select2.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/styleswitcher.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/wysiwyg.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/summernote.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.inputmask.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.validate.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap-fileupload.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap-datepicker.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap-timepicker.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap-colorpicker.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap-switch.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/typeahead.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/daterange-picker.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/date.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/morris.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/skycons.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/fitvids.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/jquery.sparkline.min.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/main.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/respond.js" type="text/javascript"></script>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
		
		<script src="http://<?=$_SERVER['HTTP_HOST']?>/style/general/js/deer.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
				$("body").fadeIn(800);
			});
		</script>
		<?php
			if (empty($_GET['page2'])):
			//Для блока Общее количество магазинов
			$get_all_shops = $db->row("SELECT count(*) AS count FROM shop WHERE id_user = ?", array($_SESSION['auth']['id']));
			if (!$get_all_shops['count']):
			$get_all_shops['count'] = 0;
			endif; 
			//Для блока Общее количество магазинов
			
			//Для блока Общее количество товаров
			$get_all_goods = $db->row("SELECT count(*) AS count FROM goods WHERE id_shop IN (SELECT id FROM shop WHERE id_user = ?)", array($_SESSION['auth']['id']));
			if (!$get_all_goods['count']):
			$get_all_goods['count'] = 0;
			endif; 
			//Для блока Общее количество товаров
			
			//Для блока Общая прибыль со всех магазинов
			$sum_all_goods = $db->row("SELECT SUM(sum) FROM orders WHERE status = 'Оплачен' AND id_shop IN (SELECT id FROM shop WHERE id_user = ?)", array($_SESSION['auth']['id']));
			$end_sum = round($sum_all_goods['SUM(sum)']);
			//Для блока Общая прибыль со всех магазинов
			
			//Для блока Общее количество проданных товаров
			$count_all_goods = $db->row("SELECT count(*) AS count FROM orders WHERE status = 'Оплачен' AND id_shop IN (SELECT id FROM shop WHERE id_user = ?)", array($_SESSION['auth']['id']));
			if (!$count_all_goods['count']):
			$count_all_goods['count'] = 0;
			endif;
			//Для блока Общее количество проданных товаров 
			
			else:
			
			$get_shop = $db->row("SELECT * FROM shop WHERE domain = ? AND id_user = ?", array(htmlspecialchars($_GET['shop']), $_SESSION['auth']['id']));
			
			//Для блока Кол-во заказов в этом магазине
			$get_all_shops = $db->row("SELECT count(*) AS count FROM orders WHERE id_shop = ?", array($get_shop['id']));
			if (!$get_all_shops['count']):
			$get_all_shops['count'] = 0;
			endif; 
			//Для блока Кол-во заказов в этом магазине
			
			//Для блока Кол-во товаров в этом магазине
			$get_all_goods = $db->row("SELECT count(*) AS count FROM goods WHERE id_shop = ?", array($get_shop['id']));
			if (!$get_all_goods['count']):
			$get_all_goods['count'] = 0;
			endif; 
			//Для блока Кол-во товаров в этом магазине
			
			//Для блока Прибыль с этого магазина
			$sum_all_goods = $db->row("SELECT SUM(sum) FROM orders WHERE status = 'Оплачен' AND id_shop = ?", array($get_shop['id']));
			$end_sum = round($sum_all_goods['SUM(sum)']);
			//Для блока Прибыль с этого магазина
			
			//Для блока Кол-во проданных товаров в этом магазине
			$count_all_goods = $db->row("SELECT count(*) AS count FROM orders WHERE status = 'Оплачен' AND id_shop = ?", array($get_shop['id']));
			if (!$count_all_goods['count']):
			$count_all_goods['count'] = 0;
			endif;
			//Для блока Кол-во проданных товаров в этом магазине
			
			endif;
			
			$get_goods = $db->rows("SELECT goods.id, goods.id_shop FROM goods WHERE goods.id_shop IN (SELECT id FROM shop WHERE id_user = ?)", array("replace" => array($_SESSION['auth']['id'])));
			
			// Вычисляем число непроданных товаров
			foreach ($get_goods as $key => $value):
			$count_q = $db->row("SELECT count(id) as count FROM goods_object WHERE id_goods = ? AND id_orders IS NULL", array($value['id']));
			$get_goods[$key]['count'] = $count_q['count'];
			endforeach;
			// Вычисляем число непроданных товаров
			
			$counter = 0; 
			foreach ($get_goods as $key => $value):
			if ($value['count'] <= 0):
			$counter++;
			endif;
			endforeach;
		?>
		<style type="text/css">
			#footer {
			position: fixed;
			left: 0; bottom: 0;
			padding: 10px;
			background: #fff;
			color: #666;
			width: 100%;
			font-size: 12px;
			}
		</style>
	</head>
	<body>
		<div class="modal-shiftfix">
			<!-- Navigation -->
			<div class="navbar navbar-fixed-top scroll-hide">
				<div class="container-fluid top-bar">
					<div class="pull-right">
						<ul class="nav navbar-nav pull-right">
							<li class="dropdown notifications hidden-xs">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span aria-hidden="true" class="icon-envelope-alt"></span>
									<div class="sr-only">
										Оповещения
									</div>
									<p class="counter">
										<?=$counter?>
									</p>
								</a>
								<ul class="dropdown-menu">
									<?php foreach ($get_goods as $key => $value): 
									if ($value['count'] <= 0): ?>
									<? $get_shop_uved = $db->row("SELECT * FROM shop WHERE id = ? AND id_user = ?", array($value['id_shop'], $_SESSION['auth']['id'])); ?>
									<li><a href="/shops/settings/<?=$get_shop_uved['domain']?>/goods/edit/<?=$value['id']?>/">
										<div class="notifications label label-danger">
											Важно
										</div>
										<p>
											Внимание: Закончился товар [ID: <?=$value['id']?>]
										</p></a>
									</li>
									<? endif; ?>
									<? endforeach; ?>
									<? if ($counter == 0): ?>
									<li><a href="#">
										<p>
											Оповещений нет
										</p></a>
									</li>
									<? endif;?>
								</ul>
							</li>
							<!--<li class="dropdown messages hidden-xs">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span aria-hidden="true" class="se7en-envelope"></span>
								<div class="sr-only">
								Messages
								</div>
								<p class="counter">
								3
								</p>
								</a>
								<ul class="dropdown-menu messages">
								<li><a href="#">
								<img width="34" height="34" src="images/avatar-male2.png" />Could we meet today? I wanted...</a>
								</li>
								<li><a href="#">
								<img width="34" height="34" src="images/avatar-female.png" />Important data needs your analysis...</a>
								</li>
								<li><a href="#">
								<img width="34" height="34" src="images/avatar-male2.png" />Buy Se7en today, it's a great theme...</a>
								</li>
								</ul>
							</li> -->
							<li class="dropdown user hidden-xs"><a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<img width="34" height="34" src="/style/general/images/client.png" />Привет, <?=$get_user['login']?><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="/profile/">
								<i class="icon-user"></i>Личный кабинет</a>
								</li>
								<li><a href="/logout/">
								<i class="icon-signout"></i>Выход</a>
								</li>
							</ul>
							</li>
						</ul>
					</div>
					<button class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a href="/"><img src="/style/general/images/logotype.png" style="height: 45px;float: left;"></a>
					<div class="navbar-form form-inline col-lg-2 hidden-xs">
						<script type="text/javascript" src="//vk.com/js/api/openapi.js?121"></script>
						
						<!-- VK Widget -->
						<div id="vk_subscribe"></div>
						<script type="text/javascript">
							VK.Widgets.Subscribe("vk_subscribe", {mode: 1, soft: 1}, -113747594);
						</script>
					</div>
				</div>
				<?php if (empty($_GET['page2'])): ?>
				<div class="container-fluid main-nav clearfix">
					<div class="nav-collapse">
						<ul class="nav">
							<li>
								<a class="current" href="/"><span aria-hidden="true" class="icon-home"></span>Главная страница</a>
							</li>
							<li><a href="/profile/">
							<span aria-hidden="true" class="icon-user"></span>Личный кабинет</a>
							</li>
							<li><a href="/shops/">
							<span aria-hidden="true" class="icon-puzzle-piece"></span>Все ваши магазины</a>
							</li>
							<li><a href="/faq/">
							<span aria-hidden="true" class="icon-question"></span>FAQ по сервису</a>
							</li>
							<li><a href="/agreement/">
							<span aria-hidden="true" class="icon-foursquare"></span>Соглашение</a>
							</li>
							<li><a href="/tickets/list/">
							<span aria-hidden="true" class="icon-warning-sign"></span>Техподдержка</a>
							</li>
						</ul>
					</div>
				</div>
				<? else: ?>
				<div class="container-fluid main-nav clearfix">
					<div class="nav-collapse">
						<ul class="nav">
							<li>
								<a class="current" href="/shops/"><span aria-hidden="true" class="icon-reply"></span>Ко всем магазинам</a>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/">
							<span aria-hidden="true" class="icon-info"></span>Статистика магазина</a>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/orders/">
							<span aria-hidden="true" class="icon-shopping-cart"></span>Заказы в магазине</a>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/goods/">
							<span aria-hidden="true" class="icon-gamepad"></span>Управление товарами</a>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/discount/">
							<span aria-hidden="true" class="icon-gift"></span>Скидочные купоны</a>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/ban/">
							<span aria-hidden="true" class="icon-ban-circle"></span>Блокировки по IP</a>
							</li>
							<li class="dropdown"><a data-toggle="dropdown" href="#">
							<span aria-hidden="true" class="icon-cog"></span>Настройки магазина<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li>
									<a href="/shops/settings/<?=$_GET['shop']?>/pages/">Редактирование страниц</a>
								</li>
								<li>
									<a href="/shops/settings/<?=$_GET['shop']?>/texts/">Настройки дизайна</a>
								</li>
							</ul>
							</li>
							<li><a href="/shops/settings/<?=$_GET['shop']?>/payment/">
							<span aria-hidden="true" class="icon-edit-sign"></span>Настройки оплаты</a>
							</li>
						</ul>
					</div>
				</div>
				<? endif; ?>
			</div>
			<!-- End Navigation -->
			<div class="container-fluid main-content">
				<? if (empty($_GET['page2'])): ?>
				<div class="row">
					<div class="col-lg-12">
						<div class="widget-container stats-container">
							<div class="col-md-3">
								<div class="number">
									<div class="icon globe"></div>
									<?=$get_all_shops['count']?>
								</div>
								<div class="text">
									Общее количество ваших магазинов
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon visitors"></div>
									<?=$get_all_goods['count']?>
								</div>
								<div class="text">
									Общее количество товаров
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon money"></div>
									<?=$end_sum?> Р
								</div>
								<div class="text">
									Общая прибыль со всех магазинов
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon chat-bubbles"></div>
									<?=$count_all_goods['count']?>
								</div>
								<div class="text">
									Общее количество проданных товаров
								</div>
							</div>
						</div>
					</div>
				</div>
				<? else: ?>
				<div class="row">
					<div class="col-lg-12">
						<div class="widget-container stats-container">
							<div class="col-md-3">
								<div class="number">
									<div class="icon globe"></div>
									<?=$get_all_shops['count']?>
								</div>
								<div class="text">
									Кол-во заказов в этом магазине
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon visitors"></div>
									<?=$get_all_goods['count']?>
								</div>
								<div class="text">
									Кол-во товаров в этом магазине
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon money"></div>
									<?=$end_sum?> Р
								</div>
								<div class="text">
									Прибыль с этого магазина
								</div>
							</div>
							<div class="col-md-3">
								<div class="number">
									<div class="icon chat-bubbles"></div>
									<?=$count_all_goods['count']?>
								</div>
								<div class="text">
									Кол-во проданных товаров в этом магазине
								</div>
							</div>
						</div>
					</div>
				</div>
				<? endif; ?>
				<!-- End Statistics -->
				<?=$this->controller?>
			</div>
		</div>
		
	</body>
	
</html>
<? endif; ?>
<? endif; ?>
<link href="http://codeseven.github.io/toastr/build/toastr.min.css" rel="stylesheet" type="text/css">
<script src="http://codeseven.github.io/toastr/build/toastr.min.js"></script>
<script src="http://codeseven.github.io/toastr/glimpse.toastr.js"></script>
<script type="text/javascript">
	toastr.options = {
		"closeButton": true,
		"debug": false,
		"newestOnTop": false,
		"progressBar": true,
		"positionClass": "toast-top-right",
		"preventDuplicates": false,
		"onclick": null,
		"showDuration": "300",
		"hideDuration": "1000",
		"timeOut": "5000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "fadeIn",
		"hideMethod": "fadeOut"
	}
</script>
<script>
	function getXmlHttp() {
		var xmlhttp;
		try {
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
			try {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (E) {
				xmlhttp = false;
			}
		}
		if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
			xmlhttp = new XMLHttpRequest();
		}
		return xmlhttp;
	}
	function noshop() {
		var tokenrem = document.getElementById("token").value;
		var remofsite = $("select#remofsite").val();
		var kodovoe = document.getElementById("kodovoe").value;
		
		document.getElementById('remshop').disabled = true;
		document.getElementById('remshop').innerHTML = 'Загрузка данных...';
		
		var xmlhttp = getXmlHttp(); // Создаём объект XMLHTTP
		xmlhttp.open('POST', '/shops/delete/', true); // Открываем асинхронное соединение
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // Отправляем кодировку
		xmlhttp.send("token=" + encodeURIComponent(tokenrem) + "&deletesite=" + encodeURIComponent(remofsite) + "&secretkey=" + encodeURIComponent(kodovoe)); // Отправляем POST-запрос
		xmlhttp.onreadystatechange = function() { // Ждём ответа от сервера
			if (xmlhttp.readyState == 4) { // Ответ пришёл
				if(xmlhttp.status == 200) { // Сервер вернул код 200 (что хорошо)
					toastr["warning"](xmlhttp.responseText, "Внимание!");
					//alert(xmlhttp.responseText);
					document.getElementById('remshop').disabled = false;
					document.getElementById('remshop').innerHTML = 'Удалить выбранный магазин';
					} else {
					toastr["error"]("Сервер временно недоступен. Попробуйте позже.", "Ошибка");
					//alert('Сервер временно недоступен. Попробуйте позже.');
					document.getElementById('remshop').disabled = false;
					document.getElementById('remshop').innerHTML = 'Удалить выбранный магазин';
				}
			}
		};
	}
	function create() {
		var token = document.getElementById("token").value;
		var domain = document.getElementById("alias").value;
		var subdomain = document.getElementById("subalias").value;
		
		if ($("#period1").prop("checked")) {
			var period = document.getElementById("period1").value;
		}
		if ($("#period3").prop("checked")) {
			var period = document.getElementById("period3").value;
		}
		if ($("#period6").prop("checked")) {
			var period = document.getElementById("period6").value;
		}
		
		if ($("#webmoneyr").prop("checked")) {
			var paymethod = document.getElementById("webmoneyr").value;
		}
		if ($("#webmoneyz").prop("checked")) {
			var paymethod = document.getElementById("webmoneyz").value;
		}
		if ($("#freekassa").prop("checked")) {
			var paymethod = document.getElementById("freekassa").value;
		}
		
		document.getElementById('createshop').disabled = true;
		document.getElementById('createshop').innerHTML = 'Загрузка данных...';
		
		var xmlhttp = getXmlHttp(); // Создаём объект XMLHTTP
		xmlhttp.open('POST', '/shops/create/', true); // Открываем асинхронное соединение
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // Отправляем кодировку
		xmlhttp.send("token=" + encodeURIComponent(token) + "&alias=" + encodeURIComponent(domain) + "&subalias=" + encodeURIComponent(subdomain) + "&period=" + encodeURIComponent(period) + "&paymethod=" + encodeURIComponent(paymethod)); // Отправляем POST-запрос
		xmlhttp.onreadystatechange = function() { // Ждём ответа от сервера
			if (xmlhttp.readyState == 4) { // Ответ пришёл
				if(xmlhttp.status == 200) { // Сервер вернул код 200 (что хорошо)
					if (xmlhttp.responseText.match (new RegExp ('http'))) {
						document.getElementById('createshop').innerHTML = 'Переходим в форму оплаты...';
						location.href = xmlhttp.responseText;
						} else {
						toastr["warning"](xmlhttp.responseText, "Внимание!");
						//alert(xmlhttp.responseText);
						document.getElementById('createshop').disabled = false;
						document.getElementById('createshop').innerHTML = 'Создать магазин';
					}
					} else {
					toastr["error"]("Сервер временно недоступен. Попробуйте позже.", "Ошибка");
					//alert('Сервер временно недоступен. Попробуйте позже.');
					document.getElementById('createshop').disabled = false;
					document.getElementById('createshop').innerHTML = 'Создать магазин';
				}
			}
		};
	}
	function prod() {
		var token = document.getElementById("token").value;
		var domainprod = $("select#domainprod").val();
		
		if ($("#periodprod1").prop("checked")) {
			var period = document.getElementById("periodprod1").value;
		}
		if ($("#periodprod3").prop("checked")) {
			var period = document.getElementById("periodprod3").value;
		}
		if ($("#periodprod6").prop("checked")) {
			var period = document.getElementById("periodprod6").value;
		}
		
		
		if ($("#webmoneyrprod").prop("checked")) {
			var paymethod = document.getElementById("webmoneyrprod").value;
		}
		if ($("#webmoneyzprod").prop("checked")) {
			var paymethod = document.getElementById("webmoneyzprod").value;
		}
		if ($("#F-K").prop("checked")) {
			var paymethod = document.getElementById("F-K").value;
		}
		
		document.getElementById('prodshop').disabled = true;
		document.getElementById('prodshop').innerHTML = 'Загрузка данных...';
		
		var xmlhttp = getXmlHttp(); // Создаём объект XMLHTTP
		xmlhttp.open('POST', '/shops/prolongation/'+domainprod+'/', true); // Открываем асинхронное соединение
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // Отправляем кодировку
		xmlhttp.send("token=" + encodeURIComponent(token) + "&domainprod=" + encodeURIComponent(domainprod) + "&period=" + encodeURIComponent(period) + "&paymethod=" + encodeURIComponent(paymethod)); // Отправляем POST-запрос
		xmlhttp.onreadystatechange = function() { // Ждём ответа от сервера
			if (xmlhttp.readyState == 4) { // Ответ пришёл
				if(xmlhttp.status == 200) { // Сервер вернул код 200 (что хорошо)
					if (xmlhttp.responseText.match (new RegExp ('http'))) {
						document.getElementById('prodshop').innerHTML = 'Переходим в форму оплаты...';
						location.href = xmlhttp.responseText;
						} else {
						toastr["warning"](xmlhttp.responseText, "Внимание!");
						//alert(xmlhttp.responseText);
						document.getElementById('prodshop').disabled = false;
						document.getElementById('prodshop').innerHTML = 'Продлить магазин';
					}
					} else {
					toastr["error"]("Сервер временно недоступен. Попробуйте позже.", "Ошибка");
					//alert('Сервер временно недоступен. Попробуйте позже.');
					document.getElementById('prodshop').disabled = false;
					document.getElementById('prodshop').innerHTML = 'Продлить магазин';
				}
			}
		};
	}
	function updstat() {
		var token = document.getElementById("token").value;
		var skype = document.getElementById("skype").value;
		var password = document.getElementById("password").value;
		var newpassword = document.getElementById("newpassword").value;
		var newpassword2 = document.getElementById("newpassword2").value;
		
		document.getElementById('upd').disabled = true;
		document.getElementById('upd').innerHTML = 'Загрузка данных...';
		
		var xmlhttp = getXmlHttp(); // Создаём объект XMLHTTP
		xmlhttp.open('POST', '/correctprofile/', true); // Открываем асинхронное соединение
		xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // Отправляем кодировку
		if (password != '') {
			xmlhttp.send("token=" + encodeURIComponent(token) + "&icq=" + encodeURIComponent(skype) + "&password=" + encodeURIComponent(password) + "&newpassword=" + encodeURIComponent(newpassword) + "&newpassword2=" + encodeURIComponent(newpassword2)); // Отправляем POST-запрос
			} else {
			xmlhttp.send("token=" + encodeURIComponent(token) + "&icq=" + encodeURIComponent(skype)); // Отправляем POST-запрос
		}
		xmlhttp.onreadystatechange = function() { // Ждём ответа от сервера
			if (xmlhttp.readyState == 4) { // Ответ пришёл
				if(xmlhttp.status == 200) { // Сервер вернул код 200 (что хорошо)
					document.getElementById('requeststat').innerHTML = xmlhttp.responseText;
					document.getElementById('upd').disabled = false;
					document.getElementById('upd').innerHTML = 'Сохранить заданные вами настройки';
					} else {
					document.getElementById('requeststat').innerHTML = 'Сервер временно недоступен. Попробуйте позже.';
					document.getElementById('upd').disabled = false;
					document.getElementById('upd').innerHTML = 'Сохранить заданные вами настройки';
				}
			}
		};
	}
</script>
<? endif; ?>