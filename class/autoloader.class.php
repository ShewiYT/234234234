<?php

/**
*        Автозагрузчик классов
*
*        require '/class/autoloader.class.php';
*
*        spl_autoload_register(array('autoloader', 'loadPackages'));
*
*/

class autoloader
{  
     public static function loadPackages($className) {
		$serv = $_SERVER["DOCUMENT_ROOT"];
         require_once(htmlspecialchars($serv)."/class/" . $className . '.class.php');
     }

}