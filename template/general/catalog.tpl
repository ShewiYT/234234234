
<div class="panel panel-default" style="margin-left: 2%;width: 1230px;">
	<div class="panel-heading">Каталог магазинов - Топ 10</div>
		<div class="panel-body">
		<table class="table table-hover">
		<thead>
        <tr>
			<th>№</th>
			<th>Магазин</th>
			<th>Описание</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($getrows as $key => $value): ?>
		<tr>
			<td><?=$key+1?></td>
			<td><a href="http://<?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?>" target="_blank">Перейти на <?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></a></td>
			<td><?=$value['meta_title']?></td>
		</tr>
		<?php endforeach; ?>
      </tbody>
    </table>
	<?php if (!empty($_SESSION['auth']) and !empty($myshops_arr)): ?>
	<h5>Следующие ваши магазины в списке не видны</h5>
	<table class="table table-hover">
		<thead>
        <tr>
			<th>№</th>
			<th>Магазин</th>
			<th>Действие</th>
        </tr>
      </thead>
	  <tbody>
        <?php foreach ($myshops_arr as $key => $value): ?>
        <tr>
			<td><?=$key+1?></td>
            <td><a href="http://<?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?>" target="_blank"><?=$value['domain']?><? if (!preg_match("/\./", $value['domain'])) { ?>.<?=DOMAIN?><? } ?></a></td>
            <td><a href="/shops/settings/<?=$value['domain']?>/catalog/">Поднять наверх</a></td>
        </tr>
		<?php endforeach; ?>
      </tbody>
    </table>
	<?php endif; ?>
	</div>
</div>
