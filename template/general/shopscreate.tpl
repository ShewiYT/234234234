<? include './template/template_panel.tpl'; ?>
  <script>
	function infodomain() {
		alert("Если вы имеете свой домен, то Вы можете указать свою зону вместо '.rentshops.ru'. Например: '.ru' или '.com' и т.д. Если же Вы хотите использовать наш субдомен, тогда просто укажите основной домен.\r\nP.S. Чтобы Ваш домен работал, Вам нужно направить Ваш домен на наш сервер.");
		event.preventDefault();
	};
</script>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Создание нового онлайн-магазина
      </h1>
    </section>
    <section class="content">
	<div class="alert alert-info alert-dismissible" style="width: 49%;float: right;">
                <h4><i class="icon fa fa-info"></i> Информация!</h4>
                Срок аренды <b>1 месяц</b> &mdash; <span><?=$cost[1]?> руб.</span><br>
				Срок аренды <b>3 месяца</b> &mdash; <span><?=$cost[3] * 3?> руб.</span><br>
				Срок аренды <b>6 месяцев</b> &mdash; <span><?=$cost[6] * 6?> руб.</span><br>
				Курс доллара <b>1 USD</b> = <span><?=$cost['dollar']?> руб.</span>
    </div><br>
	<div class="alert alert-danger alert-dismissible" style="width: 49%;height: 127px;margin-top: -20px;">
                <h4><i class="icon fa fa-info"></i> Внимание!</h4>
                По истечению срока аренды, магазин необходимо будет продлить.<br/>
				Магазин автоматически удаляется по истечению 14 суток неоплаты.
	</div>
	<?=$err[0]?><?=$err[1]?>
      <div class="box box-info">	  
            <div class="box-header with-border">
              <h3 class="box-title">Данные нового магазина</h3>
            </div>
            <form class="form-horizontal" method="post" action="">
			<?=$token?>
              <div class="box-body">
                <div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Имя домена:</label>
				  <div class="col-sm-7">
                    <input type="text" class="form-control" placeholder="Введите желаемое имя домена" name="alias" id="alias">
                  </div>
				  <div class="col-sm-2">
                    <input type="text" class="form-control" name="subalias" id="subalias" value=".<?=DOMAIN?>" style="margin-left: -22px;">
                  </div>
				  <button href="#" onclick="infodomain()" class="btn btn-info" style="margin-left: -26px;width: 7%;" data-loading-text="?">?</button>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Выберите срок аренды:</label>
				  <div class="col-sm-7">
					<select class="form-control" name="period" id="period">
						<option value="1">1 месяц (31 день)</option>
						<option value="3">3 месяца (93 дня)</option>
						<option value="6">6 месяцев (186 дней)</option>
					</select>
                  </div>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Способ оплаты:</label>
				  <div class="col-sm-7">
					<select class="form-control" name="paymethod" id="paymethod">
						<?php if (WM_PAY == 1): ?>
						<option value="wmr">WMR</option>
						<option value="wmz">WMZ</option>
						<?php endif;?>
						<?php if (QIWI_PAY == 1): ?>
						<option value="qiwi">QIWI Wallet</option>
						<?php endif; ?>
						<option value="freekassa">Free-Kassa</option>
					</select>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-info pull-left" data-loading-text="Передаем данные...">Создать магазин</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
	</section>
  </div>
	<? include './template/template_panel_footer.tpl'; ?>
</div>
</body>
</html>
