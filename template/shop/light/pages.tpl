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
				<div class="col-md-8"><br>
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title"> <?=$get_page['name']?></h3>
						</div>
						<div class="panel-body">
							<?=$get_page['content']?> 
						</div>
					</div>
					
					<style>
						.panel {
						margin-bottom: 11px;
						background-color: #FFF;
						padding: 10px 0px 0px 8px;
						margin-top: -13px;
						border-radius: 0px;
						box-shadow: 3px 2px 6px rgba(0, 0, 0, 0.09);
						}
						
						.box {
						margin-bottom: 0px;
						}
						
						.macpay-snapshot {
						display: inline-block;
						vertical-align: top;
						border: 1px solid #DFDFDF;
						border-radius: 3px;
						margin-bottom: 15px;
						margin-right: 10px;
						position: relative;
						text-align: left;
						transition: all 0.5s ease 0s;
						width: 166px;
						}
						
						.box-filter .box-content {
						padding: 15px;
						}
						
						
						.table {
						width: 100%;
						margin-bottom: -6px;
						}
					</style>
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