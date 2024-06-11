<style>
	.panel-success:hover {
		box-shadow: 0px 0px 5px 0px #428bca;
		-webkit-transition: border-color ease-in-out .35s,box-shadow ease-in-out .35s;
		transition: border-color ease-in-out .35s,box-shadow ease-in-out .35s;
	}
	.panel-success:active {
		
	}
</style>
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
							<div class="row">
								<div class="col-md-12">
									<div id="status"></div>
								</div>
								<div class="col-md-6">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 style="padding: 10px;" class="panel-title">Информация о заказе</h3>
										</div>
										<div class="panel-body" style="height: 177px;">
											<div class="table-responsive">
												<table class="table">
													<tbody>
														<tr>
															<td>Магазин:</td>
															<td class="text-center"><?=$get_shop['domain']?></td>
														</tr>
														<tr>
															<td>Товар для покупки:</td>
															<td class="text-center"><?=$get_good['name']?></td>
														</tr>
														<tr>
															<td>Сумма за <?=$get_good['min_count']?> штук:</td>
															<td class="text-center"><strong><?=$get_good['cost_rub']?></strong> RUB | <strong><?=$get_good['cost_usd']?></strong> USD</td>
														</tr>
														<tr>
															<td>В наличии:</td>
															<td class="text-center"><?=$count_q['count']?> штук</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<form name="control" action="/order/" method="POST" id="info">
										<?=$token?>
										<input type="hidden" name="type" id="type" value="<?=$get_good['id']?>" data-min_count="<?=$get_good['min_count']?>" data-count="<?=$count_q['count']?>" />
										<div id="methodcash"></div>
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 style="padding: 10px;" class="panel-title">Настройки платежа</h3>
											</div>
											<div class="panel-body">
												<div class="form-group">
													<input class="form-control" id="email" name="email" type="email" placeholder="Введите Ваш Email">
												</div>
												<div class="form-group">
													<input class="form-control" id="count" name="count" type="number" placeholder="Количество для покупки">
												</div>
												<div class="form-group">
													<input class="form-control" id="discount_code" name="discount_code" type="text" placeholder="Купон (Если есть)">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<h3 style="padding: 10px;" class="panel-title">Выбор способа оплаты товара</h3>
										</div>						
										<div class="panel-body">
											<? if ($get_webmoney): ?>
											<div class="col-md-3">
												<div class="panel panel-success">
													<div class="panel-body">
														<center><a href="#" onclick="oplata('wmz')"><img src="http://i.imgur.com/MPj6m7N.png" alt="webmoneyz"></a></center>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="panel panel-success">
													<div class="panel-body">
														<center><a href="#" onclick="oplata('wmr')"><img src="http://i.imgur.com/MPj6m7N.png" alt="webmoneyr"></a></center>
													</div>
												</div>
											</div>
											<? endif; ?>
											<? if ($get_yandex): ?>
											<div class="col-md-3">
												<div class="panel panel-success">
													<div class="panel-body">
														<center><a href="#" onclick="oplata('yandex')"><img src="http://i.imgur.com/cIeCSpP.png" alt="yandexmoney"></a></center>
													</div>
												</div>
											</div>
											<? endif; ?>
											<? if ($get_freekassa): ?>
											<div class="col-md-3">
												<div class="panel panel-success">
													<div class="panel-body">
														<center><a href="#" onclick="oplata('freekassa')"><img src="http://i.imgur.com/5dCKX4P.png" alt="freekassa" width="100"></a></center>
													</div>
												</div>
											</div>
											<? endif; ?>
											<? if (!$get_webmoney and !$get_yandex and !$get_freekassa): ?>
											Данный магазин не может принимать платежи, так как владелец не настроил ни единой системы оплаты.
											<? endif; ?>
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
</div>
<link href="http://codeseven.github.io/toastr/build/toastr.min.css" rel="stylesheet" type="text/css">
<script src="http://codeseven.github.io/toastr/build/toastr.min.js"></script>
<script src="http://codeseven.github.io/toastr/glimpse.toastr.js"></script>
<script type="text/javascript">
	function validateEmail(email){
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}
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