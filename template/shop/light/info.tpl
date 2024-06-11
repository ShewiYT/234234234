<!DOCTYPE html>
<html lang="ru">
	<head>
		<script src="/style/shop/css/templates/light/js/app.js"></script>
		<script src="/style/shop/css/templates/light/js/jquery.toastmessage.js"></script>
		<script src="/style/shop/css/templates/light/js/main.js"></script>
		
		<link href="/style/shop/css/templates/light/css/jquery.toastmessage.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="/style/shop/css/templates/light/css/bot.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link href="http://fonts.googleapis.com/css?family=Roboto:100normal,100italic,300normal,300italic,400normal,400italic,500normal,500italic,700normal,700italic,900normal,900italic|Open+Sans:400normal|Lato:400normal|Oswald:400normal|Raleway:400normal|PT+Sans:400normal|Source+Sans+Pro:400normal|Droid+Sans:400normal|Ubuntu:400normal|Roboto+Condensed:400normal|Montserrat:400normal&amp;subset=all" rel="stylesheet" type="text/css">
	</head>
	<body style="font-family: Roboto; background-image: url(<?=$get_template['background']?>);">
		<div class="container cc">
			<div class="row">
				<div class="hedd">
					<a href="/"> <img style="height: 35px;" src="<?=$get_template['logo']?>"></a>
					<? if ($get_template['searchname'] == '2'): ?>
					<form action="/" method="GET" class="navbar-form pull-right" style="margin-top: 0;">
						<input type="text" class="form-control input-small" name="search" placeholder="Поиск товара...">
						<button type="submit" class="btn btn-primary">Найти товар</button>
					</form>
					<? endif; ?>
				</div>
				<nav class="navbar navbar-default" role="navigation" style="margin-left: -17px;margin-right: -17px;border-radius: 0px;">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="/">Главная</a></li>
								<?php foreach ($get_pages as $key => $value): ?>
								<li> <a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a> </li>
								<? endforeach; ?>
							</ul>
							
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>
				<div class="col-md-8">&#65279;
					<ol class="breadcrumb">
						<li><a href="/">Главная</a></li>
						<li><a href="/">Товары</a></li>
						<li class="active"><?=$get_goods['name']?></li>
					</ol>
					<hr>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title"><?=$get_goods['name']?></h3>
						</div>
						<div class="panel-body">
							<div class="pull-left" style=" width: 65%; ">
								<img src="<?=$get_goods['image']?>" alt="<?=$get_goods['name']?>" class="img-thumbnail">
							</div>
							<div class="pull-right" style="text-overflow: ellipsis;width: 33%;white-space: nowrap;overflow: hidden;">
								<b style="padding: 7px 13px; font-size: 18px; " alt="<?=$get_goods['name']?>"><?=$get_goods['name']?></b>
								<center>
									<h2><?=$get_goods['cost_rub']?> <i class="fa fa-rub"></i> </h2>
								</center>
								<hr>
								<p> Мин. заказ: <?=$get_goods['min_count']?> шт. </p>
								<p> В наличии: <?=$count_q['count']?> шт. </p>
								<center>
									<a href="/cash/<?=$get_goods['id']?>/" class="btn btn-success" style="width: 100%;"><i class="ion-bag"></i> Оплатить товар</a>
								</center>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Описание</h3>
						</div>
						<div class="panel-body">
							<?=$get_goods['description']?>      
						</div>
					</div>
					<br>
					<form action="/order/" method="POST">
						<?=$token?>
						<div class="modal fade" id="setWayForMoney">
							<div style="margin-top: 30px;margin-centre: 10px;width:350px;" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title">Выберите способ оплаты</h4>
									</div>
									<div class="modal-body">
										<input type="text" class="form-control input-small" name="count" placeholder="Желаемое количество" value="<?=$get_goods['min_count']?>">
										<input type="hidden" class="form-control" name="type" id="type" value="<?=$get_goods['id']?>" data-min_count="<?=$get_goods['min_count']?>" data-count="<?=$count_q['count']?>" />
										<input type="email" class="form-control input-small" name="email" <?php if ($get_freekassa): ?>placeholder="На этот E-mail придет оплаченный товар!"<?php else: ?>placeholder="Введите Вашу электронную почту"<?php endif; ?> style="margin-top: 5px;">
									</div>
									<center>
										<?php if ($get_freekassa): ?>
										<script>
											function isEmail() {
												if (confirm("Вы подтверждаете правильность введенного Вами E-mail'a?\nНа указанный e-mail будет отправлен оплаченный товар!")) {
													
													} else {
													event.preventDefault();
												}
											};
										</script>
										<button type="submit" onclick="isEmail();" name="paymethod" id="paymethod" value="freekassa" class="btn btnbuy btn-white btn-lg btn-block" style="padding: 5px;margin-left: 0px;margin-top: 1px;"><img src="/style/general/images/freepay.png" style="height:45px;"></button>
										<? endif; ?>
										<?php if ($get_webmoney): ?>
										<button type="submit" name="paymethod" id="paymethod" value="wmr" class="btn btnbuy btn-white btn-lg btn-block" style="padding: 5px;margin-left: 0px;margin-top: 1px;"><img src="/style/general/images/wmr.png" style="height:45px;"></button>
										<button type="submit" name="paymethod" id="paymethod" value="wmz" class="btn btnbuy btn-white btn-lg btn-block" style="padding: 5px;margin-left: 0px;margin-top: 1px;"><img src="/style/general/images/wmz.png" style="height:45px;"></button>
										<? endif; ?>
										<?php if ($get_yandex): ?>
										<button type="submit" name="paymethod" id="paymethod" value="yandex" class="btn btnbuy btn-white btn-lg btn-block" style="padding: 5px;margin-left: 0px;margin-top: 1px;"><img src="/style/general/images/yandex.png" style="height:45px;"></button>
										<? endif; ?>
									</center>
									<center>
										<div style="margin-top:10px;">
											
											<a style="font-size: 15px;font-family: &quot;Open Sans&quot;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;" data-toggle="modal" data-target="#agreement" class="btn btnbuy btn-primary btn-lg btn-block">Скидочный купон (Если имеется)</a>
										</div>
									</center>
								</div>
							</div>
						</div>
						<div class="modal fade" id="agreement">
							<div style="margin-top: 30px;margin-centre: 10px;width:350px;" class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" style="opacity:1;font-size:28px;" data-dismiss="modal" aria-hidden="true"></button>
										<input type="text" class="form-control input-small" name="discount_code" placeholder="Вставьте купон" style="width:280px;margin-centre:5px;">
										
									</div>
									<div class="">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-4">
					<a type="button" style="background-color:#5B7FA6 ;width:100%" href="<?=$get_template['vk']?>" class="btn btn-primary"><i class="fa fa-vk"></i> Вконтакте</a>
					<hr>
					<div class="list-group">
						<a href="#" class="list-group-item active">
							Страницы
						</a>
						<?php foreach ($get_pages as $key => $value): ?>
						<a href="/page/<?=$value['prefix']?>/" class="list-group-item"><?=$value['name']?></a>
						<? endforeach; ?>
					</div>
					<hr>
					<? if ($get_template['cates'] == '2'): ?>
					<div class="list-group">
						<a href="#" class="list-group-item active">
							Категории
						</a>
						<a href="/" class="list-group-item">Все категории</a>
						<?php foreach ($get_category as $key => $value): ?>
						<a href="/category/<?=$value['id']?>/" class="list-group-item"><?=$value['name']?></a>
						<? endforeach; ?>
					</div>
					<? endif; ?>
					<? if ($get_template['lastbuy'] == '2'): ?>
					<div class="list-group">
						<a href="#" class="list-group-item active">
							Последние покупки
						</a>
						<ul class="list-group">
						<?php foreach ($get_orders as $key => $value): ?>
							<li class="list-group-item">
								<span class="badge"><?=$value['method']?></span>
								<?=$value['name']?>
							</li>
						<? endforeach; ?>
						</ul>
					</div>
					<? endif; ?>
					<?php foreach ($get_bloks as $key => $value): ?>
					<? if ($value['show'] == '2'): ?>
					<div class="list-group">
						<a href="#" class="list-group-item active">
							<?=$value['name']?>
						</a>
						<ul class="list-group">
							<?=$value['content']?>
						</ul>
					</div>
					<? endif; ?>
					<? endforeach; ?>
					<br>
				</div>
			</div>
		</div>
		<footer class="container footer">
			<table>
				<tbody>
					<tr>
						<td>
							<a style="text-decoration: none;">
								<a href="http://rentshops.ru" target="_blank"><div class="bp1" style="color: rgb(255, 255, 255);text-shadow: 0px 0px 2px rgb(255, 255, 255), 0 0 1em rgb(0, 0, 0);font-family: arial;background: url(http://i.imgur.com/darLNdO.gif);">Площадка интернет-магазинов RENTSHOPS.RU</div></a>
							</a>
						</td>
						<td>
						</td>
					</tr>
				</tbody>
			</table>
		</footer>			
	</body>
</html>												