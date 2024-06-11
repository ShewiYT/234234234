<?php

/**
*        Класс обработки домена и субдомена
*
*        $dmn = new domain();
*        
*        $domain = $dmn->check("vskut.ru",$_SERVER['HTTP_HOST']);
*
*        Возвращает 'domain' или имя субдомена
*
*/

	class domain
	{
		
		function check($my_domain,$domain) {
			
				$my_domain_original = $my_domain;
				$domain_original = $domain;
				
				$domain = str_replace($my_domain, "", $domain);

				$domain = (!empty($domain)) ? str_replace(".", "", $domain) : 'domain2';
				
				if($domain == 'domain2') {
					if ($my_domain_original == 'rentshops.ru') {
						$domain = 'domain';
					}
				}

				return $domain;
				
		}
		
	}