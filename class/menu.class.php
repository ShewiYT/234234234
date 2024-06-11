<?php

/**
*        Класс обработки меню
*
*        $mnu = new menu();
*        
*        $menu = $mnu->gen($arr,'page');
*
*        Присылаем массив с данными, где должна быть 'position' и 'url', вторым значением присылаем название GET переменной
*
*/

	class menu
	{
		
		function gen($array,$name) {

				$active_page = $_GET[$name];

				foreach ($array as $key => $value) {

					$return[$value['position']] = $value;

					if ($value['url'] == $active_page) {
						$return[$value['position']]['status'] = 'selected';
					} else {
						$return[$value['position']]['status'] = 'unselected';
					}

				}

				ksort($return);

				return $return;
				
		}
		
	}