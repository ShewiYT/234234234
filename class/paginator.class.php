<?php

/**
*        Пагинатор
*
*        $pgn = new paginator();
*
*        $pgn->paginate($page,$count_rows,$per_page);
*
*
*        $page - страница
*        $count_rows - количество строк
*        $per_page - строк на страницу (не обязательно, стандартно 10)
*
*/

class paginator
{
	
	function paginate($page = 1, $count_rows, $per_page = 10) 
	 { 
	        $total = floor($count_rows/$per_page); // Количество страниц
	        $ost = $count_rows % $per_page;
	        if ($ost>0) $total++;

	        if ($page > $total or $page < 1) return false; // Проверка пишедших данных на валидность

	        $return[] = 1; // Первая страница
	        for ($i=$page-2; $i < $page; $i++) {
	        	if ($i < 2) continue;
	        	$return[] = (int)$i; // 2 стр. предшедствующие первой, если существуют
	        }

	        if ($page != 1 and $page != $total) {
	        	$return[] = (int)$page; // Текущая страница
	        }

	        for ($i=$page+1; $i < $page+3; $i++) {
	        	if ($i > $total-1) continue;
	        	$return[] = (int)$i; // 2 стр. после первой, если существуют
	        }
	        $return[] = (int)$total; // Последняя страница

	        return $return; 
	 }
}