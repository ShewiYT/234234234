<body style="background: url(<?=$get_template['background']?>) 50% 0;background-size:cover;">
	<div id="content">
		<a href="/" class="logotype left"><img src="<?=$get_template['logo']?>"></a>
		<? if ($get_template['searchname'] == '2'): ?>
		<div class="header_search left br2">
			<form action="/" method="GET">
				<input type="text" class="search" name="search" maxlength="100" value="Поиск по сайту..." onfocus="this.value=''" onblur="if (this.value==''){this.value='Поиск по сайту...'}"> 
				<input type="submit" value="" class="search_ico right">
			</form>
		</div>
		<? endif; ?>
		<ul class="header_nav br2">
			<li><a href="/">Главная страница</a></li>
			<?php foreach ($get_page as $key => $value): ?>
			<li><a href="/page/<?=$value['prefix']?>/"><?=$value['name']?></a></li>
			<?php endforeach; ?>
		</ul>
		<div id="maincontent" class="br2">
			<div id="container" class="left">
				<div class="sidebox_title_black br2">Товары<div class="nav"></div></div>
				<table class="table table-striped table-bordered table-hover shop_goods">
					<div class="layer">
						<?php if (empty($get_goods)): ?>
						Товары отсутствуют
						<?php else: ?>
						<?php foreach ($items as $key => $value): ?>
						<div class="v_loop"  style=''>
							<div class="v_title br2 left"><div class="icon_social_<?=$value['ico']?>" alt="<?=str_replace(array("\n"), '<br />', $value['description'])?>" title="<?=$value['name']?>" style="position: absolute;padding: 6px;"></div><a onclick="iteminfo('15','<?=$value['description']?>')"><?=$value['name']?></a><div class="leftq"><?=$value['cost_rub']?> руб.</div><div class="leftz"><?=$value['count']?> шт.</div><div onclick="Basket(13)" class="right mb"></div></div><br>         
						</div>
						<?php endforeach; ?>
						<?php endif; ?>
					</div>
				</table>
				<article class="page_shop_index">
					<?php if (!empty($get_goods)): ?>
					<form action="/order/" method="POST" id="order" class="form-inline">
						<?=$token?>
						<input type="text" name="count" placeholder="Кол-во" class="form-control">
						<select type="hidden" class="form-control" name="type" id="type">
							<?php foreach ($get_goods as $key => $value): ?>
							<option type="hidden" value="<?=$value['id']?>" data-min_count="<?=$value['min_count']?>" data-count="<?=$value['count']?>"><?=$value['name']?></option>
							<?php endforeach; ?>
						</select>
						<input type="text" name="email" placeholder="E-mail" class="form-control">
						
						<select class="form-control" name="paymethod" id="paymethod">
							<?php if ($get_freekassa): ?>
							<option value="freekassa">FREE-KASSA</option>
							<?php endif; ?>
							<?php if ($get_webmoney): ?>
							<option value="wmr">WMR</option>
							<option value="wmz">WMZ</option>
							<?php endif; ?>
							<?php if ($get_yandex): ?>
							<option value="yandex">Yandex.Money</option>
							<?php endif; ?>
							<?php if ($get_qiwi): ?>
							<option value="qiwi">QIWI</option>
							<?php endif; ?>
						</select>
						
						<input type="submit" class="btn btn-default btn-primary" value="Оплатить"/>
						<?php if ($get_discounts): echo "<button  type='button' class='btn btn-primary' aria-hidden='true' data-toggle='modal' data-target='#kupon' styl3e='margin-bottom: 10px;width: 86px;padding-left: 1px;font-size: 14px;margin-left: 356px;font-weight: 100;'>Ввод купона</button>"; endif; ?>
						<div class="modal fade" id="kupon">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4  class="modal-title">Введите купон на скидку</h4>
									</div>
									<div class="modal-body" >
										
										<input type="text" placeholder="Если у вас есть купон, введите его в это поле." class="form-control input-small" name="discount_code" style="text-align: center;width: 100%;"></input>
										
									</div>
								</div>
							</div>
						</div>
					</form>
					<?php endif; ?>
				</article>
			</div>
			<div class="modal fade" id="descriptmodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title">Описание товара <a id="nameaj"></a></h4>
						</div>
						<div class="modal-body" >
							<p id="descrajax" style="word-wrap:break-word;"></p>
						</div>
					</div>
				</div>
			</div>
			
			<div id="sidebar" class="right">
				<? if ($get_template['cates'] == '2'): ?>
				<div class="sidebox">
					<div class="sidebox_title_black br2">Категории<div class="nav"></div></div>
					<div classs="sidebox_content">
						<ul class="menu_nav">
							<li class="layer act"><a href="/">Все товары</a>
								<?php foreach ($get_category as $key => $value): ?>
								<li class="layer"><a href="?cat_id=<?=$value['id']?>"><?=$value['name']?></a>
									<? endforeach; ?>
								</ul>
							</li>
						</div>
						
						
					</div>
					<? endif; ?>
					<? if ($get_template['lastbuy'] == '2'): ?>
					<div class="sidebox">
						<div class="sidebox_title_green br2">Последние продажи<div class="pop"></div></div>
						<div class="sidebox_content">
							<?php foreach ($get_orders as $key => $value): ?>
							<? $get_one_good = $db->row("SELECT * FROM goods WHERE id = ?", array($value['id_goods']));?>
							<div class="pop_file br2">
								<img src="<?=$get_one_good['image']?>" alt="<?=$value['name']?>">
								<div class="pop_file_link"><?=$value['name']?></div>
							</div>
							<? endforeach; ?>
						</div>
					</div>
					<? endif; ?>
					<?php foreach ($get_bloks as $key => $value): ?>
					<? if ($value['show'] == '2'): ?>
					<div class="sidebox">
						<div class="sidebox_title_green br2"><?=$value['name']?><div class="nav"></div></div>
						<div class="sidebox_content">
							<?=$value['content']?>
						</div>
					</div>
					<? endif; ?>
					<? endforeach; ?>
				</div>
			</div>
		</div>
		<div class="footer">
			<center><div class="copyright">Аренда магазина предоставлена сервисом <a href="http://rentshops.ru/">RENTSHOPS.RU</a></div></center>
		</div>
	</div>
	<script>
		var getedId=0;
		var numOfItems=0;
		var setepaidway=0;
		
		function iteminfo(id,name)
		{
			$("#loading").show();
			
			$('#descriptmodal').modal('toggle');
			var desc = name;
			$('#descrajax').html(desc);
			$("#loading").hide();
		}
	</script>