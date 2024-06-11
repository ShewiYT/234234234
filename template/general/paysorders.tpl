<html>
	<head>
		<title>Оплата товара <?=$imya;?></title>
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/isotope.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/fullcalendar.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/wizard.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/select2.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/morris.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/datatables.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/datepicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/timepicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/colorpicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/daterange-picker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/typeahead.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/summernote.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/pygments.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
		<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
		<script src="/style/general/js/shop.js"></script>
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
	<body>
<div class="modal-shiftfix">
	<!-- Navigation -->
	<div class="navbar navbar-fixed-top scroll-hide">
		<div class="container-fluid top-bar">
			<button class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a href="http://rentshops.ru"><img src="/style/general/images/logotype.png" style="height: 45px;float: left;"></a>
		</div>
		<div class="container-fluid main-nav clearfix">
			<div class="nav-collapse">
				<ul class="nav">
					<li style="float:left;">
						<a href="http://<?=$get_shop['domain']?><? if (!preg_match("/\./", $get_shop['domain'])) { ?>.<?=DOMAIN?><? } ?>/"><span aria-hidden="true" class="icon-mail-reply-all"></span>Вернуться в магазин</a>
					</li>
					<li style="float:right;"><a href="#">
					<span aria-hidden="true" class="icon-shield"></span>Пожаловаться на магазин</a>
					</li>
					<li style="float:right;"><a href="#">
					<span aria-hidden="true" class="icon-shopping-cart"></span>Мои совершенные покупки</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid main-content">
		<div class="invoice">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-body">
							<div class="col-md-6" style="float:left;">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 style="padding: 10px;" class="panel-title">Инструкция по оплате</h3>
									</div>
									<div class="panel-body">
										<h4>Оплата через ВебМани</h4>
										Здесь указан пример заполнения формы перевода <br>
										<a target="_blank" href="http://i.imgur.com/X25XUaM.png"> Открыть ссылку в новой вкладке </a>		
										<hr>
										<h4>Оплата через Яндекс.Деньги</h4>
										Здесь указан пример заполнения формы перевода <br>
										<a target="_blank" href="http://i.imgur.com/I0PidjK.png"> Открыть ссылку в новой вкладке </a>
										<hr>
									</div>
								</div>
							</div>
							<div class="col-md-6" style="float:right;">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 style="padding: 10px;" class="panel-title">Оплата товара <?=$imya;?></h3>
									</div>
									<div class="panel-body">
									<form action="/pay/" method="POST" id="pay">
									<input name="order" value="<? echo $insert_order;?>" type="hidden">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>
														Количество:</td>
														<td class="text-center"><?=$kolvo;?></td>
													</tr>
													<tr>
														<td>
														Кошелек для перевода:</td>
														<td class="text-center"><?=$cash;?></td>
													</tr>
													
													<tr>
														<td>К оплате:</td>
														<td class="text-center"><?=$sum.' '.$paymetod;?></td>
													</tr>
													<tr>
														<td>Примечание к оплате:</td>
														<td class="text-center">Оплата заказа #<?=$insert_order;?></td>
													</tr>
													<tr>
														<td>Ваша скидка в процентах:</td>
													<td class="text-center"><? if(!empty($skidka)): echo $skidka.'%'; else: echo 'Вы не использовали купон'; endif; ?></td>
													</tr>
												</tbody>
											</table>
											<table class="check_pay" style="width: 100%;">
											<tbody>
												<tr>
													<td><button class="btn btn-primary" type="submit" style="width: 100%;">Проверить платёж</button></td>
												</tr>
												<td class="check"></td>
											</tbody>
										</table>
										</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</body>
</html>
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
		"preventDuplicates": true,
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
	function oplata(pay) {
		var form_field='<input type="hidden" name="paymethod" id="paymethod" value="'+pay+'" />'
		$('#methodcash').empty();
		$('#methodcash').append(form_field);
		
		var email = document.getElementById("email").value;
		var	count = document.getElementById("count").value;
		var	select_type = $('select[name=type]').val();
		var	min_count = $('#type').attr('data-min_count');
		var	paym = $('#paymethod').val();
		var	count_accs = $('#type').attr('data-count');
		
		if (!validateEmail(email))
		{
			toastr["error"]("Введите Ваш email", "Ошибка");
			return false;
		}
		
		if (count < min_count)
		{
			toastr["error"]("Мин. кол-во товара " + min_count, "Ошибка");
			return false;
		}
		
		if (count_accs < count)
		{
			toastr["error"]("Такого кол-ва товара нет", "Ошибка");
			return false;
		}
		
        if (paym == 0)
        {
            toastr["error"]("Вы не выбрали способ оплаты", "Ошибка");
            return false;
		}
		
		toastr["success"]("Выполняется обработка данных...", "Успешно");
		document.getElementById('info').submit();
		return false;
	}
</script>
