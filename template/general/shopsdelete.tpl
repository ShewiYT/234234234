<? include './template/template_panel.tpl'; ?>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Удаление Вашего онлайн-магазина
      </h1>
    </section>
    <section class="content">
	<div class="alert alert-danger alert-dismissible">
                <h4><i class="icon fa fa-info"></i> Внимание!</h4>
                При удалении магазина Вы НИЧЕГО не получаете обратно. Помните об этом!
	</div>
	<?=$err[0]?><?=$err[1]?><?=$err[2]?><?=$err[3]?>
      <div class="box box-info">	  
            <div class="box-header with-border">
              <h3 class="box-title">Выберите магазин, который нужно удалить</h3>
            </div>
            <form class="form-horizontal" method="post" action="">
			<?=$token?>
              <div class="box-body">
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Выберите магазин:</label>
				  <div class="col-sm-7">
					<select class="form-control" name="deletesite" id="deletesite">
					<?php foreach ($get_shops as $key => $value): ?>
						<option><?=$value['domain']?></option>
					<?php endforeach; ?>
					</select>
                  </div>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label" style="width: 170px;">Кодовое слово:</label>
				  <div class="col-sm-7">
					<input type="text" class="form-control" name="secretkey" id="secretkey" placeholder="Введите Ваше кодовое слово">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-danger pull-left" data-loading-text="Удаляем...">Удалить выбранный магазин</button>
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
