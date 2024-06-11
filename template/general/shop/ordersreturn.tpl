<h1>Возврат средств за: <?=$get_goods['name']?></h1>

<form action="" method="post" id="goods_edit">
<?=$token?>

    <table>
        <tr>
            <td>Выдано / Заказано:</td>
            <td><?=$get_return['obj_given']?> из <?=$get_return['obj_all']?></td>
        </tr>
        <tr>
            <td>Выдано на сумму:</td>
            <td><?=$get_order['sum']?> <?=$get_order['method']?></td>
        </tr>
        <tr>
            <td>Осталось выдать:</td>
            <td><?=$get_return['obj_notgiven']?><br /><small style="color:#666;"><?=$get_order['email']?></small></td>
        </tr>
        <tr>
            <td>Либо возместить:</td>
            <td><?=$get_return['sum_return']?> <?=$get_order['method']?><br /><small style="color:#666;"><?=$get_order['purse']?></small></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Выдано" /></td>
        </tr>
    </table>
</form>