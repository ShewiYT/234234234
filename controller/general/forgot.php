<?php
$this->title = 'Восстановление пароля';


if (!empty($_SESSION['auth'])):
	header('Location: /shops/');
	exit;
endif;
$pw = new password(); // Инициализируем чекер пароля
$tk = new token();
$check_values = new filter();


$err[0] = '';
$err[1] = '';
$err[2] = '';
$err[3] = '';
$err[4] = '';

if (empty($_GET['code'])):

	if (
		!empty($_POST['token']) and 
		$tk->check($_POST['token']) and
		$check_values->check('email','post','email') and
		$check_values->check('secretkey','post','regexp','~^[A-Za-z0-9]{1,20}$~')
		//$check_values->check('email','post','regexp','~^[A-Za-z0-9@.]{1,20}$~')
		):

			$select_user = $db->row("SELECT * FROM user WHERE email = ?", array($_POST['email']));

			if (!$select_user):
				$err[0] = '<div class="alert alert-danger">
							Пользователь с таким E-mail не был найден в нашей базе.
						</div>';
			else:
				$secret_user = $db->row("SELECT secret_key FROM user WHERE login = ? or email = ?", array($_POST['email'], $_POST['email']));
				
				$check_kluch = $pw->check($_POST['secretkey'],$secret_user['secret_key']);
				if($check_kluch):
					$secret = uniqid();
					// Генерируем случайную URL
					$insertrow = $db->insert("INSERT INTO forgot (id_user, secret, ip, status) VALUES (?, ?, ?, ?)", array($select_user['id'], $secret, $_SERVER['REMOTE_ADDR'], 'new'));
					// Генерируем случайную URL

					// Формируем письмо
					$text = 'Приветствуем Вас, '.$select_user['login'].'<br/>'.
						'<br/>'.
						'Чтобы сбросить пароль, перейдите по следующей ссылке:<br/>'.
						'<a href="http://'.DOMAIN.'/forgot/code/'.$secret.'/" target="_blank" >http://'.DOMAIN.'/forgot/code/'.$secret.'/</a><br/>'.
						'<br/>'.
						'----------------------------<br/>'.
						'<br/>'.
						'Если вы не сбрасывали свой пароль - проигнорируйте это письмо!';
					// Формируем письмо

					// Отправляем на почту сгенерированную URL
					$for_who = EMAIL_TO_SEND;
					require_once "./class/SendMailSmtpClass.php"; // подключаем класс
  
					$mailSMTP = new SendMailSmtpClass(EMAIL_TO_SEND, 'verysupermegapassword641', 'ssl://smtp.yandex.ru', 'Nikita', 465);
  
					// заголовок письма
					$headers= "MIME-Version: 1.0\r\n";
					$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
					$headers .= "From: RentShops.Ru <rentshops.ru>\r\n"; // от кого письмо
					$result =  $mailSMTP->send($select_user['email'], 'Восстановление доступа, шаг 1', $text, $headers); // отправляем письмо
					if($result === true){
						$err[2] = '<div class="alert alert-success">
							<strong>Успешно!</strong> На указанный Вами E-mail адрес отправлено письмо с дальнейшими инструкциями по восстановлению пароля.
						</div>';
					}else{
						$err[2] = '<div class="alert alert-danger">
							<strong>Ошибка!</strong> Ошибка отправки E-mail - попробуйте позднее.
						</div>';
					}
					else:
						$err[4] = '<div class="alert alert-danger"><strong>Ошибка!</strong>Вы ввели неверное кодовое слово. Попробуйте еще раз.
						</div>';
					endif;
			endif;
		
	endif;

else:
	if ($check_values->check('code','get','regexp','~^[A-Za-z0-9]{1,20}$~')):

		$select_forgot = $db->row("SELECT * FROM forgot INNER JOIN user ON forgot.id_user = user.id WHERE forgot.secret = ? AND forgot.status = 'new'", array($_GET['code']));

		if (!$select_forgot):
			$err[1] = '<div class="alert alert-danger">
						<strong>Ошибка!</strong> Такой код не найден или устарел.
					</div>';
		else:
			$opdateforgot = $db->update("UPDATE forgot SET status = 'done' WHERE secret = ? ", array($_GET['code'])); // Обновляем статус кода

			$pw = new password();
			$passw = rand(1000000,9999999);
			$hash = $pw->gen($passw);

			$updatepassword = $db->update("UPDATE user SET password = ? WHERE login = ?", array($hash, $select_forgot['login']));

			// Формируем письмо
			$text = 'Приветствуем Вас, '.$select_forgot['login'].'<br/>'.
					'<br/>'.
					'Ваш новый пароль: '.$passw.'<br/>'.
					'<br/>'.
					'------------------------------------------------------------<br/>'.
					'<br/>'.
					'Спасибо, что Вы выбрали именно нас!'.
					'С Уважением, Ваш RENTSHOPS.RU';
			// Формируем письмо

			// Отправляем на почту новый пароль
			$for_who = EMAIL_TO_SEND;
			require_once "./class/SendMailSmtpClass.php"; // подключаем класс
  
			$mailSMTP = new SendMailSmtpClass(EMAIL_TO_SEND, 'verysupermegapassword641', 'ssl://smtp.yandex.ru', 'Nikita', 465);
  
			// заголовок письма
			$headers= "MIME-Version: 1.0\r\n";
			$headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
			$headers .= "From: RentShops.Ru <rentshops.ru>\r\n"; // от кого письмо
			$result =  $mailSMTP->send($select_forgot['email'], 'Восстановление доступа, шаг 2', $text, $headers); // отправляем письмо
			if($result === true){
				$err[3] = '<div class="alert alert-success">
						<strong>Успешно!</strong> На указанный Вами E-mail адрес отправлено письмо с новыми данными доступа.
					</div>';
			}else{
				$err[3] = '<div class="alert alert-danger">
						<strong>Ошибка!</strong> Ошибка отправки E-mail - попробуйте позднее.
					</div>';
			}
			//$m = new mail("utf-8"); // начинаем 
			//$m->From( $for_who ); // от кого отправляется почта 
			//$m->To( $select_forgot['email'] ); // кому адресованно
			//$m->Subject( "Восстановление доступа, этап 2" );
			//$m->Body( $text, 'html' );
			//$m->Priority(3) ;    // приоритет письма
			//$send = $m->Send();
			//unset($m);
			// Отправляем на почту новый пароль

			//if ($send):
				//$err[1] = '<div class="success">На ваш email адрес отправлен новый пароль.</div>';
			//else:
				//$err[1] = '<div class="error">Ошибка отправки email - попробуйте позднее.</div>';
			//endif;

		endif;
	endif;

endif;

$token = $tk->input();
require $_SERVER["DOCUMENT_ROOT"].'/template/general/forgot.tpl';