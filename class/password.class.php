<?php

/**
*        Класс генерации хэша и проверки пароля
*
*        $get_pass - Переменная пароля (данные от пользователя)
*        $hash - Сгенерированный хэш
*
*        $pw = new password();
*
*        $hash = $pw->gen($get_pass); // Генерация хэша (hash/false)
*
*        $check = $pw->check("123543",$hash); // Сверка хэша (true/false)
*
*/

class password
{

    function gen($password)
    {
        //$hash = password_hash($password, PASSWORD_BCRYPT);
        $hash = md5($password);
        return $hash;
    }

    function check($password,$hash)
    {
        //$result = password_verify($password, $hash);
        
        $result = false;

        $pw = md5($password);

        if ($pw == $hash) {
            $result = true;
        }

        return $result;
    }
}