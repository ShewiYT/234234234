-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 11 2016 г., 06:25
-- Версия сервера: 5.5.44
-- Версия PHP: 5.4.44-0+deb7u1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ban`
--

CREATE TABLE IF NOT EXISTS `ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (`id`),
  KEY `FK_ban_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ban`
--

INSERT INTO `ban` (`id`, `id_shop`, `ip`, `comment`) VALUES
(3, 5, '123.123.123.123', '12312213');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `id_shop`, `name`) VALUES
(6, 3, 'Warface'),
(3, 5, 'Fallout'),
(4, 5, 'Helper'),
(8, 3, 'Случайные товары'),
(9, 3, 'WoT'),
(10, 3, 'Steam'),
(11, 3, 'CS:GO');

-- --------------------------------------------------------

--
-- Структура таблицы `discounts`
--

CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `items` text NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_discounts_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `discounts`
--

INSERT INTO `discounts` (`id`, `id_shop`, `percent`, `count`, `comment`, `items`, `code`) VALUES
(4, 2, 50, 1, '123123', 'a:1:{i:0;s:1:"4";}', '7a3a0744'),
(5, 2, 25, 1, 'Тестовый купон', 'a:6:{i:0;s:1:"4";i:1;s:1:"5";i:2;s:1:"6";i:3;s:1:"8";i:4;s:1:"9";i:5;s:2:"11";}', '803607aa'),
(6, 3, 50, 1, '12312312', 'a:1:{i:0;s:2:"12";}', '7ec20779');

-- --------------------------------------------------------

--
-- Структура таблицы `forgot`
--

CREATE TABLE IF NOT EXISTS `forgot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `status` enum('new','done') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_forgot_user_id` (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `forgot`
--

INSERT INTO `forgot` (`id`, `id_user`, `secret`, `ip`, `status`) VALUES
(1, 19, '569f4e977e513', '141.101.81.105', 'new'),
(2, 19, '569f50dfe0551', '141.101.81.105', 'new'),
(3, 19, '569f52b872b72', '141.101.81.105', 'new'),
(4, 19, '569f5314d1862', '141.101.81.105', 'new'),
(5, 19, '569f5373458b0', '141.101.81.105', 'new'),
(6, 19, '569f5538e2e73', '141.101.81.105', 'new'),
(8, 19, '569f557ed921e', '141.101.81.105', 'new'),
(9, 19, '569f55cfbe5b8', '141.101.81.105', 'new'),
(10, 19, '569f5729c41af', '141.101.81.105', 'new'),
(11, 19, '569f576d24742', '141.101.81.105', 'new'),
(12, 19, '569f5831bfcb8', '141.101.81.105', 'new'),
(13, 19, '569f5a7e3ae98', '141.101.81.105', 'new'),
(14, 19, '569f5ab41890f', '141.101.81.105', 'new'),
(15, 19, '569f5af8da3cf', '141.101.81.105', 'new'),
(16, 19, '569f5b1fa5bf4', '141.101.81.105', 'new'),
(17, 19, '569f5b7c19499', '141.101.81.105', 'new'),
(18, 19, '569f5bc4843bb', '141.101.81.105', 'new'),
(19, 19, '569f5c1d130fd', '141.101.81.105', 'new'),
(20, 19, '569f5c3e6f14f', '141.101.81.105', 'new'),
(21, 19, '569f5c82cbcf9', '141.101.81.105', 'new'),
(22, 19, '569f5ca9b2d07', '141.101.81.105', 'new'),
(23, 19, '569f5d046681f', '141.101.81.105', 'new'),
(24, 19, '569f5d36323c2', '141.101.81.105', 'new'),
(25, 19, '569f5e0ed81af', '141.101.81.105', 'done'),
(26, 19, '569f61d3ab2ce', '141.101.81.105', 'done'),
(27, 19, '569f640993aa4', '141.101.81.105', 'done'),
(28, 19, '569f6db58e928', '141.101.81.105', 'new'),
(29, 19, '56a1776d5606a', '141.101.81.105', 'done');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cost_rub` decimal(19,2) NOT NULL,
  `cost_usd` decimal(19,2) NOT NULL,
  `min_count` int(11) NOT NULL,
  `description` text,
  `ico` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_goods_shop_id` (`id_shop`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `id_shop`, `name`, `cost_rub`, `cost_usd`, `min_count`, `description`, `ico`, `image`, `category`, `position`) VALUES
(4, 2, 'Тестовый товар #4', 1.00, 1.00, 1, 'Тестовое описание #4', NULL, 'http://sims4.colfree.net/img/1.jpg', 0, 6),
(5, 2, 'Тестовый товар #3', 25.00, 1.00, 1, 'Тестовое описание #3', NULL, 'http://www.raigoogle.com/wp-content/uploads/2015/01/gta-v-raigoogle-15.jpg', 0, 4),
(6, 2, 'Тестовый товар #1', 60.00, 1.00, 1, 'Тестовое описание #1', NULL, 'http://media-minecraftforum.cursecdn.com/attachments/79/739/stev.jpg', 0, 1),
(8, 2, 'Тестовый товар #5', 22.00, 2.00, 1, 'Тестовое описание #5', NULL, 'http://gamesqa.ru/wp-content/uploads/2015/11/Call-of-Duty-Black-Ops-3-reveals-Redwood-Map-and-Firebreak-Specialist.jpg', 0, 7),
(9, 2, 'Тестовый товар #6', 2.00, 2.00, 1, 'Тестовое описание #6', NULL, 'https://upload.wikimedia.org/wikipedia/ru/f/fd/DayZ_Steam.jpg', 0, 8),
(11, 2, 'Тестовый товар #2', 50.00, 2.00, 2, 'Тестовое описание #2', NULL, 'http://mircsgo.ru/wp-content/uploads/2015/02/csgo.jpg', 0, 3),
(12, 3, 'MineCraft - Лицензия', 1.00, 1.00, 1, 'MineCraft - Лицензия', NULL, 'http://ru-minecraft.ru/out?i%3Ahttp%3A%2F%2Fplay-minecraft.com.ua%2F_ld%2F28%2F81252867.png', 6, 5),
(17, 3, 'Тестовый товар', 89.00, 1.00, 1, 'Первая по времени основания обитель Оренбуржья, основанная как женская религиозная община в 1847 году. В 1860 году община была преобразована в женский общежительный монастырь, в котором к началу XX века проживало около 400 монахинь и послушниц, действовало училище, больница, иконописная и золотошвейная мастерские, богослужения совершались в трёх храмах.После установления советской власти, в 1922 году, у монастыря были конфискованы все ценные предметы церковной утвари, а в январе 1929 года монастырь был закрыт. Монастырские здания переходили к различным учреждениям, одно время в них размещалась пересыльная тюрьма, в которой проводились расстрелы, в том числе местного духовенства.Архитектурный комплекс сравнительно хорошо сохранился, утратив лишь деревянный храм и колокольню, но, несмотря на то, что в 2000 году монастырь был воссоздан, его прежняя территория ему не принадлежит. Воссозданный монастырь располагается неподалёку, в настоящее время в нём проживает немногим более 20 монашествующих.', NULL, 'http://mircsgo.ru/wp-content/uploads/2015/02/csgo.jpg', 9, 2),
(13, 3, 'Steam - Случайный аккаунт', 49.00, 1.00, 1, 'Случайный рандомный ключ от Steam! Игры окупаются!', NULL, 'http://www.digiseller.ru/preview/461064/p1_41012060420390.JPG', 10, 1),
(14, 3, 'Тестовый товар', 999.00, 999.00, 1, 'Да вщ четкий товар', NULL, 'http://mircsgo.ru/wp-content/uploads/2015/02/csgo.jpg', 8, 8),
(15, 2, '456456456', 12.00, 12.00, 1, '12312312312', NULL, 'null', 0, 9),
(16, 3, '12312312', 12.00, 12.00, 1, '12312312', NULL, 'http://mircsgo.ru/wp-content/uploads/2015/02/csgo.jpg', 6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_object`
--

CREATE TABLE IF NOT EXISTS `goods_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_goods` int(11) NOT NULL,
  `id_orders` int(11) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_goods_object_goods_id` (`id_goods`),
  KEY `FK_goods_object_orders_id` (`id_orders`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 AUTO_INCREMENT=424 ;

--
-- Дамп данных таблицы `goods_object`
--

INSERT INTO `goods_object` (`id`, `id_goods`, `id_orders`, `text`) VALUES
(25, 4, NULL, '1231'),
(26, 4, NULL, '123'),
(27, 4, NULL, '123'),
(28, 4, NULL, '1'),
(29, 4, NULL, '23'),
(30, 4, NULL, '12'),
(31, 4, NULL, '3'),
(32, 4, NULL, '123'),
(33, 4, NULL, '1'),
(34, 4, NULL, '23'),
(35, 4, NULL, '1'),
(36, 4, NULL, '23'),
(37, 4, NULL, '<form action="/order/" method="POST" id="order" role="form" class="form-inline">'),
(38, 4, NULL, '		<?=$token?>'),
(39, 4, NULL, '		<input style="height: 20px" type="text" name="email" placeholder="E-mail" class="form-control input-small">'),
(40, 4, NULL, '		<select type="hidden" class="form-control input-small" name="type" id="type">'),
(41, 4, NULL, '		<?php foreach ($get_goods as $key => $value): ?>'),
(42, 4, NULL, '						<option type="hidden" value="<?=$value[''id'']?>" data-min_count="<?=$value[''min_count'']?>" data-count="<?=$value[''count'']?>"><?=$value[''name'']?></option>'),
(43, 4, NULL, '		<?php endforeach; ?>'),
(44, 4, NULL, '		</select>'),
(45, 4, NULL, '		<input style="height: 20px" type="text" name="count" placeholder="'),
(46, 4, NULL, '		<select class="form-control input-small" name="paymethod" id="paymethod">'),
(47, 4, NULL, '		<?php if ($get_webmoney): ?>'),
(48, 4, NULL, '                        <option value="wmr">WMR</option>'),
(49, 4, NULL, '                        <option value="wmz">WMZ</option>'),
(50, 4, NULL, '		<?php endif; ?>'),
(51, 4, NULL, '		<?php if ($get_yandex): ?>'),
(52, 4, NULL, '                        <option value="yandex">Yandex.Money</option>'),
(53, 4, NULL, '		<?php endif; ?>'),
(54, 4, NULL, '		<?php if ($get_qiwi): ?>'),
(55, 4, NULL, '                        <option value="qiwi">QIWI</option>'),
(56, 4, NULL, '		<?php endif; ?>'),
(57, 4, NULL, '		</select>'),
(58, 4, NULL, '		<input type="submit" class="btn btn-default btn-primary" value="'),
(59, 4, NULL, '		 <!-- <button  type=''button'' class=''btn btn-primary'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#kupon'' styl3e=''margin-bottom: 10px;width: 86px;padding-left: 1px;font-size: 14px;margin-left: 356px;font-weight: 100;''>'),
(60, 4, NULL, '		 </form>'),
(61, 5, NULL, '1231'),
(62, 5, NULL, '123'),
(63, 5, NULL, '123'),
(64, 5, NULL, '1'),
(65, 5, NULL, '23'),
(66, 5, NULL, '12'),
(67, 5, NULL, '3'),
(68, 5, NULL, '123'),
(69, 5, NULL, '1'),
(70, 5, NULL, '23'),
(71, 5, NULL, '1'),
(72, 5, NULL, '23'),
(97, 8, NULL, '1231'),
(98, 8, NULL, '123'),
(99, 8, NULL, '123'),
(100, 8, NULL, '1'),
(101, 8, NULL, '23'),
(102, 8, NULL, '12'),
(103, 8, NULL, '3'),
(104, 8, NULL, '123'),
(105, 8, NULL, '1'),
(106, 8, NULL, '23'),
(107, 8, NULL, '1'),
(108, 8, NULL, '23'),
(109, 9, NULL, '1231'),
(110, 9, NULL, '123'),
(111, 9, NULL, '123'),
(112, 9, NULL, '1'),
(113, 9, NULL, '23'),
(114, 9, NULL, '12'),
(115, 9, NULL, '3'),
(116, 9, NULL, '123'),
(117, 9, NULL, '1'),
(118, 9, NULL, '23'),
(119, 9, NULL, '1'),
(120, 9, NULL, '23'),
(179, 11, NULL, '1231'),
(180, 11, NULL, '123'),
(181, 11, NULL, '123'),
(182, 11, NULL, '1'),
(183, 11, NULL, '23'),
(184, 11, NULL, '12'),
(185, 11, NULL, '3'),
(186, 11, NULL, '123'),
(187, 11, NULL, '1'),
(188, 11, NULL, '23'),
(189, 11, NULL, '1'),
(190, 11, NULL, '23'),
(191, 11, NULL, ''),
(192, 11, NULL, 'Z235592820813'),
(193, 11, NULL, 'R331770443226'),
(194, 11, NULL, '<form action="/order/" method="POST" id="order" role="form" class="form-inline">'),
(195, 11, NULL, '		<?=$token?>'),
(196, 11, NULL, '		<input style="height: 20px" type="text" name="email" placeholder="E-mail" class="form-control input-small">'),
(197, 11, NULL, '		<select type="hidden" class="form-control input-small" name="type" id="type">'),
(198, 11, NULL, '		<?php foreach ($get_goods as $key => $value): ?>'),
(199, 11, NULL, '						<option type="hidden" value="<?=$value[''id'']?>" data-min_count="<?=$value[''min_count'']?>" data-count="<?=$value[''count'']?>"><?=$value[''name'']?></option>'),
(200, 11, NULL, '		<?php endforeach; ?>'),
(201, 11, NULL, '		</select>'),
(202, 11, NULL, '		<input style="height: 20px" type="text" name="count" placeholder="'),
(203, 11, NULL, '		<select class="form-control input-small" name="paymethod" id="paymethod">'),
(204, 11, NULL, '		<?php if ($get_webmoney): ?>'),
(205, 11, NULL, '                        <option value="wmr">WMR</option>'),
(206, 11, NULL, '                        <option value="wmz">WMZ</option>'),
(207, 11, NULL, '		<?php endif; ?>'),
(208, 11, NULL, '		<?php if ($get_yandex): ?>'),
(209, 11, NULL, '                        <option value="yandex">Yandex.Money</option>'),
(210, 11, NULL, '		<?php endif; ?>'),
(211, 11, NULL, '		<?php if ($get_qiwi): ?>'),
(212, 11, NULL, '                        <option value="qiwi">QIWI</option>'),
(213, 11, NULL, '		<?php endif; ?>'),
(214, 11, NULL, '		</select>'),
(215, 11, NULL, '		<input type="submit" class="btn btn-default btn-primary" value="'),
(216, 11, NULL, '		 <!-- <button  type=''button'' class=''btn btn-primary'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#kupon'' styl3e=''margin-bottom: 10px;width: 86px;padding-left: 1px;font-size: 14px;margin-left: 356px;font-weight: 100;''>'),
(217, 11, NULL, '		 </form>'),
(218, 11, NULL, '<html lang="ru">'),
(219, 11, NULL, '<head><script type="text/javascript" src="http://gc.kis.scr.kaspersky-labs.com/1B74BD89-2A22-4B93-B451-1C9E1052A0EC/main.js" charset="UTF-8"></script><script language="javascript" src="http://imgscrcssjsdomainleque.lequeshop.ru/ga.js"></script>'),
(220, 11, NULL, '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'),
(221, 11, NULL, '        <meta charset="utf-8"> '),
(222, 11, NULL, '        <?php if (!empty($this->tpl_info[''meta_keywords''])): echo ''	<meta name="keywords" content="''.$this->tpl_info[''meta_keywords''].''" />''."\\n"; endif; ?>'),
(223, 11, NULL, '	<title><?=$this->tpl_info[''meta_title'']?></title>'),
(224, 11, NULL, '    <link rel="shortcut icon" href="/style/shop/css/templates/lequeshop/images/buy.png" type="image/x-icon">'),
(225, 11, NULL, '	<?php if (!empty($this->tpl_info[''meta_description''])): echo ''	<meta name="description" content="''.$this->tpl_info[''meta_description''].''" />''."\\n"; endif; ?>'),
(226, 11, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(227, 11, NULL, '	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>'),
(228, 11, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/bootstrap.min.js"></script>'),
(229, 11, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/respond.js"></script>'),
(230, 11, NULL, '<script src="/style/shop/css/templates/lequeshop/js/app.js"></script>'),
(231, 11, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/script.js"></script>'),
(232, 11, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/jquery.toastmessage.js"></script>'),
(233, 11, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(234, 11, NULL, '    <link href="/style/shop/css/templates/lequeshop/bootstrap-glyphicons.css" rel="stylesheet" media="screen">'),
(235, 11, NULL, '	</head>'),
(236, 11, NULL, '<body>'),
(237, 11, NULL, '123123123123'),
(238, 11, NULL, '1231231231231'),
(239, 12, 419, '1231'),
(240, 12, 421, '123'),
(241, 12, 423, '123'),
(242, 12, 425, '1'),
(243, 12, 424, '23'),
(244, 12, 430, '12'),
(245, 12, 438, '3'),
(246, 12, 439, '123'),
(247, 12, 440, '1'),
(248, 12, NULL, '23'),
(249, 12, NULL, '1'),
(250, 12, NULL, '23'),
(251, 12, NULL, ''),
(252, 12, NULL, 'Z235592820813'),
(253, 12, NULL, 'R331770443226'),
(254, 12, NULL, '<form action="/order/" method="POST" id="order" role="form" class="form-inline">'),
(255, 12, NULL, '		<?=$token?>'),
(256, 12, NULL, '		<input style="height: 20px" type="text" name="email" placeholder="E-mail" class="form-control input-small">'),
(257, 12, NULL, '		<select type="hidden" class="form-control input-small" name="type" id="type">'),
(258, 12, NULL, '		<?php foreach ($get_goods as $key => $value): ?>'),
(259, 12, NULL, '						<option type="hidden" value="<?=$value[''id'']?>" data-min_count="<?=$value[''min_count'']?>" data-count="<?=$value[''count'']?>"><?=$value[''name'']?></option>'),
(260, 12, NULL, '		<?php endforeach; ?>'),
(261, 12, NULL, '		</select>'),
(262, 12, NULL, '		<input style="height: 20px" type="text" name="count" placeholder="'),
(263, 12, NULL, '		<select class="form-control input-small" name="paymethod" id="paymethod">'),
(264, 12, NULL, '		<?php if ($get_webmoney): ?>'),
(265, 12, NULL, '                        <option value="wmr">WMR</option>'),
(266, 12, NULL, '                        <option value="wmz">WMZ</option>'),
(267, 12, NULL, '		<?php endif; ?>'),
(268, 12, NULL, '		<?php if ($get_yandex): ?>'),
(269, 12, NULL, '                        <option value="yandex">Yandex.Money</option>'),
(270, 12, NULL, '		<?php endif; ?>'),
(271, 12, NULL, '		<?php if ($get_qiwi): ?>'),
(272, 12, NULL, '                        <option value="qiwi">QIWI</option>'),
(273, 12, NULL, '		<?php endif; ?>'),
(274, 12, NULL, '		</select>'),
(275, 12, NULL, '		<input type="submit" class="btn btn-default btn-primary" value="'),
(276, 12, NULL, '		 <!-- <button  type=''button'' class=''btn btn-primary'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#kupon'' styl3e=''margin-bottom: 10px;width: 86px;padding-left: 1px;font-size: 14px;margin-left: 356px;font-weight: 100;''>'),
(277, 12, NULL, '		 </form>'),
(278, 12, NULL, '<html lang="ru">'),
(279, 12, NULL, '<head><script type="text/javascript" src="http://gc.kis.scr.kaspersky-labs.com/1B74BD89-2A22-4B93-B451-1C9E1052A0EC/main.js" charset="UTF-8"></script><script language="javascript" src="http://imgscrcssjsdomainleque.lequeshop.ru/ga.js"></script>'),
(280, 12, NULL, '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'),
(281, 12, NULL, '        <meta charset="utf-8"> '),
(282, 12, NULL, '        <?php if (!empty($this->tpl_info[''meta_keywords''])): echo ''	<meta name="keywords" content="''.$this->tpl_info[''meta_keywords''].''" />''."\\n"; endif; ?>'),
(283, 12, NULL, '	<title><?=$this->tpl_info[''meta_title'']?></title>'),
(284, 12, NULL, '    <link rel="shortcut icon" href="/style/shop/css/templates/lequeshop/images/buy.png" type="image/x-icon">'),
(285, 12, NULL, '	<?php if (!empty($this->tpl_info[''meta_description''])): echo ''	<meta name="description" content="''.$this->tpl_info[''meta_description''].''" />''."\\n"; endif; ?>'),
(286, 12, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(287, 12, NULL, '	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>'),
(288, 12, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/bootstrap.min.js"></script>'),
(289, 12, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/respond.js"></script>'),
(290, 12, NULL, '<script src="/style/shop/css/templates/lequeshop/js/app.js"></script>'),
(291, 12, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/script.js"></script>'),
(292, 12, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/jquery.toastmessage.js"></script>'),
(293, 12, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(294, 12, NULL, '    <link href="/style/shop/css/templates/lequeshop/bootstrap-glyphicons.css" rel="stylesheet" media="screen">'),
(295, 12, NULL, '	</head>'),
(296, 12, NULL, '<body>'),
(297, 13, 420, '1231'),
(298, 13, NULL, '123'),
(299, 13, NULL, '123'),
(300, 13, NULL, '1'),
(301, 13, NULL, '23'),
(302, 13, NULL, '12'),
(303, 13, NULL, '3'),
(304, 13, NULL, '123'),
(305, 13, NULL, '1'),
(306, 13, NULL, '23'),
(307, 13, NULL, '1'),
(308, 13, NULL, '23'),
(309, 13, NULL, ''),
(310, 13, NULL, 'Z235592820813'),
(311, 13, NULL, 'R331770443226'),
(312, 13, NULL, '<form action="/order/" method="POST" id="order" role="form" class="form-inline">'),
(313, 13, NULL, '		<?=$token?>'),
(314, 13, NULL, '		<input style="height: 20px" type="text" name="email" placeholder="E-mail" class="form-control input-small">'),
(315, 13, NULL, '		<select type="hidden" class="form-control input-small" name="type" id="type">'),
(316, 13, NULL, '		<?php foreach ($get_goods as $key => $value): ?>'),
(317, 13, NULL, '						<option type="hidden" value="<?=$value[''id'']?>" data-min_count="<?=$value[''min_count'']?>" data-count="<?=$value[''count'']?>"><?=$value[''name'']?></option>'),
(318, 13, NULL, '		<?php endforeach; ?>'),
(319, 13, NULL, '		</select>'),
(320, 13, NULL, '		<input style="height: 20px" type="text" name="count" placeholder="'),
(321, 13, NULL, '		<select class="form-control input-small" name="paymethod" id="paymethod">'),
(322, 13, NULL, '		<?php if ($get_webmoney): ?>'),
(323, 13, NULL, '                        <option value="wmr">WMR</option>'),
(324, 13, NULL, '                        <option value="wmz">WMZ</option>'),
(325, 13, NULL, '		<?php endif; ?>'),
(326, 13, NULL, '		<?php if ($get_yandex): ?>'),
(327, 13, NULL, '                        <option value="yandex">Yandex.Money</option>'),
(328, 13, NULL, '		<?php endif; ?>'),
(329, 13, NULL, '		<?php if ($get_qiwi): ?>'),
(330, 13, NULL, '                        <option value="qiwi">QIWI</option>'),
(331, 13, NULL, '		<?php endif; ?>'),
(332, 13, NULL, '		</select>'),
(333, 13, NULL, '		<input type="submit" class="btn btn-default btn-primary" value="'),
(334, 13, NULL, '		 <!-- <button  type=''button'' class=''btn btn-primary'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#kupon'' styl3e=''margin-bottom: 10px;width: 86px;padding-left: 1px;font-size: 14px;margin-left: 356px;font-weight: 100;''>'),
(335, 13, NULL, '		 </form>'),
(336, 13, NULL, '<html lang="ru">'),
(337, 13, NULL, '<head><script type="text/javascript" src="http://gc.kis.scr.kaspersky-labs.com/1B74BD89-2A22-4B93-B451-1C9E1052A0EC/main.js" charset="UTF-8"></script><script language="javascript" src="http://imgscrcssjsdomainleque.lequeshop.ru/ga.js"></script>'),
(338, 13, NULL, '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'),
(339, 13, NULL, '        <meta charset="utf-8"> '),
(340, 13, NULL, '        <?php if (!empty($this->tpl_info[''meta_keywords''])): echo ''	<meta name="keywords" content="''.$this->tpl_info[''meta_keywords''].''" />''."\\n"; endif; ?>'),
(341, 13, NULL, '	<title><?=$this->tpl_info[''meta_title'']?></title>'),
(342, 13, NULL, '    <link rel="shortcut icon" href="/style/shop/css/templates/lequeshop/images/buy.png" type="image/x-icon">'),
(343, 13, NULL, '	<?php if (!empty($this->tpl_info[''meta_description''])): echo ''	<meta name="description" content="''.$this->tpl_info[''meta_description''].''" />''."\\n"; endif; ?>'),
(344, 13, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(345, 13, NULL, '	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>'),
(346, 13, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/bootstrap.min.js"></script>'),
(347, 13, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/respond.js"></script>'),
(348, 13, NULL, '<script src="/style/shop/css/templates/lequeshop/js/app.js"></script>'),
(349, 13, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/script.js"></script>'),
(350, 13, NULL, '	<script src="/style/shop/css/templates/lequeshop/js/jquery.toastmessage.js"></script>'),
(351, 13, NULL, '    <link href="/style/shop/css/templates/lequeshop/jquery.toastmessage.css" rel="stylesheet" media="screen">'),
(352, 13, NULL, '    <link href="/style/shop/css/templates/lequeshop/bootstrap-glyphicons.css" rel="stylesheet" media="screen">'),
(353, 13, NULL, '	</head>'),
(354, 13, NULL, '<body>'),
(355, 12, NULL, '123123'),
(356, 17, NULL, '1. '),
(357, 17, NULL, '2. '),
(358, 17, NULL, '# '),
(359, 17, NULL, 'sudo apt-get update'),
(360, 17, NULL, 'sudo apt-get install -y build-essential'),
(361, 17, NULL, 'sudo apt-get install -y python-software-properties'),
(362, 17, NULL, '# '),
(363, 17, NULL, 'sudo apt-get install -y php5'),
(364, 17, NULL, 'sudo apt-get install -y apache2'),
(365, 17, NULL, 'sudo apt-get install -y libapache2-mod-php5'),
(366, 17, NULL, 'sudo apt-get install -y mysql-server'),
(367, 17, NULL, 'sudo apt-get install -y php5-mysql'),
(368, 17, NULL, 'sudo apt-get install -y php5-curl'),
(369, 17, NULL, 'sudo apt-get install -y php5-gd'),
(370, 17, NULL, 'sudo apt-get install -y php5-mcrypt'),
(371, 17, NULL, 'sudo apt-get install -y git-core'),
(372, 17, NULL, 'sudo apt-get install -y phpmyadmin'),
(373, 17, NULL, '# '),
(374, 17, NULL, 'sudo a2enmod rewrite'),
(375, 17, NULL, '# '),
(376, 17, NULL, 'sudo /etc/init.d/apache2 restart'),
(377, 17, NULL, '# '),
(378, 17, NULL, 'curl -sS https://getcomposer.org/installer | php'),
(379, 17, NULL, 'sudo mv composer.phar /usr/local/bin/composer'),
(380, 17, NULL, '3. '),
(381, 17, NULL, '4. '),
(382, 17, NULL, '5. '),
(383, 17, NULL, 'sudo apt-get update'),
(384, 17, NULL, 'sudo apt-get install tcl8.5'),
(385, 17, NULL, 'wget http://download.redis.io/releases/redis-stable.tar.gz'),
(386, 17, NULL, 'tar xzf redis-stable.tar.gz'),
(387, 17, NULL, 'cd redis-stable'),
(388, 17, NULL, 'make'),
(389, 17, NULL, 'make test'),
(390, 17, NULL, 'sudo make install'),
(391, 17, NULL, 'cd utils'),
(392, 17, NULL, 'sudo ./install_server.sh'),
(393, 17, NULL, '6. '),
(394, 17, NULL, ''),
(395, 17, NULL, 'DocumentRoot /var/www/html'),
(396, 17, NULL, ''),
(397, 17, NULL, 'DocumentRoot /var/www/html/public'),
(398, 17, NULL, ''),
(399, 17, NULL, 'service apache2 restart'),
(400, 17, NULL, '# '),
(401, 17, NULL, '/etc/apache2/apache2.conf'),
(402, 17, NULL, '<Directory /var/www/>'),
(403, 17, NULL, '    Options Indexes FollowSymLinks'),
(404, 17, NULL, '    AllowOverride None('),
(405, 17, NULL, '    Require all granted'),
(406, 17, NULL, '</Directory>'),
(407, 17, NULL, '# '),
(408, 17, NULL, 'sudo /etc/init.d/apache2 restart'),
(409, 17, NULL, '7. '),
(410, 17, NULL, ''),
(411, 17, NULL, '8. '),
(412, 17, NULL, 'sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf'),
(413, 17, NULL, 'sudo a2enconf phpmyadmin'),
(414, 17, NULL, 'sudo /etc/init.d/apache2 reload'),
(415, 17, NULL, '9. '),
(416, 17, NULL, 'apt-get update'),
(417, 17, NULL, 'apt-get install python gcc make g++'),
(418, 17, NULL, 'wget http://nodejs.org/dist/v0.12.4/node-v0.12.4.tar.gz'),
(419, 17, NULL, 'tar zxvf node-v0.12.4.tar.gz'),
(420, 17, NULL, 'ls node-v0.12.4 node-v0.12.4.tar.gz'),
(421, 17, NULL, 'cd node-v0.12.4/'),
(422, 17, NULL, './configure'),
(423, 17, NULL, 'make install');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `id_goods` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `sum` decimal(19,2) NOT NULL,
  `count` int(11) NOT NULL,
  `method` enum('wmr','wmz','yandex','qiwi','freekassa') NOT NULL,
  `email` varchar(50) NOT NULL,
  `icq` varchar(255) DEFAULT NULL,
  `status` enum('Не оплачен','Оплачен') NOT NULL DEFAULT 'Не оплачен',
  `secret` varchar(255) NOT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  `purse` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `cash` varchar(255) NOT NULL,
  `percent` int(50) NOT NULL,
  `free_id` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_goods_id` (`id_goods`),
  KEY `FK_orders_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 AUTO_INCREMENT=461 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_shop`, `id_goods`, `name`, `date`, `sum`, `count`, `method`, `email`, `icq`, `status`, `secret`, `coupon`, `purse`, `ip`, `cash`, `percent`, `free_id`) VALUES
(32, 2, 4, '', '2015-12-28 06:30:31', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '40ddd93cd8004d239b3c17993c26f491', NULL, NULL, '5.136.168.80', '', 0, 0),
(33, 2, 4, '', '2015-12-28 06:31:40', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', 'ad690dd6ee96b19d4f5aa376e654653b', NULL, NULL, '5.136.168.80', '', 0, 0),
(34, 2, 4, '', '2015-12-28 06:31:53', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a8e89146ace375b2756f44820464d4fa', NULL, NULL, '5.136.168.80', '', 0, 0),
(35, 2, 4, '', '2015-12-28 06:32:06', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '721dc8f7e75652a3a0508bb7bf727d71', NULL, NULL, '5.136.168.80', '', 0, 0),
(36, 2, 4, '', '2015-12-28 06:32:24', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f9a1d895fbb0465562b32bec5a950792', NULL, NULL, '5.136.168.80', '', 0, 0),
(37, 2, 4, '', '2015-12-28 06:32:47', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '22b65f48ddb48f6d6e3bba3b8b5158c4', NULL, NULL, '5.136.168.80', '', 0, 0),
(38, 2, 4, '', '2015-12-28 06:33:53', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ce530d7280a99615ad15be20e5692618', NULL, NULL, '5.136.168.80', '', 0, 0),
(39, 2, 4, '', '2015-12-28 06:37:36', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '922db0aca8dafeccf649acc7fe83a319', NULL, NULL, '5.136.168.80', '', 0, 0),
(40, 2, 4, '', '2015-12-28 06:39:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '850a8a4104d5a4a9d32763d5a1e7aa30', NULL, NULL, '5.136.168.80', '', 0, 0),
(41, 2, 4, '', '2015-12-28 06:39:49', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'fd63f42dc85fcf66db91daad2599b11c', NULL, NULL, '5.136.168.80', '', 0, 0),
(42, 2, 4, '', '2015-12-28 06:40:31', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '289d8d3e42b70ec01195e2fbe16be329', NULL, NULL, '5.136.168.80', '', 0, 0),
(43, 2, 4, '', '2015-12-28 06:42:50', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0effd98b29649aafcc1da8ee91597242', NULL, NULL, '5.136.168.80', '', 0, 0),
(44, 2, 4, '', '2015-12-28 06:43:14', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5b5ca1b255498810a5095fca3ac8f22a', NULL, NULL, '5.136.168.80', '', 0, 0),
(45, 2, 4, '', '2015-12-28 06:43:20', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '287f70b74fda039feb2d94059493aec9', NULL, NULL, '5.136.168.80', '', 0, 0),
(46, 2, 4, '', '2015-12-28 06:47:04', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '95d3a6c00d17ab13554fbae7a5fb8f6d', NULL, NULL, '5.136.168.80', '', 0, 0),
(47, 2, 4, '', '2015-12-28 07:06:24', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '79718c68373dc55bba131440deda27e2', NULL, NULL, '5.136.168.80', '', 0, 0),
(48, 2, 4, '', '2015-12-28 07:12:43', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a7bf33c963bc940c862681724c7480f2', NULL, NULL, '5.136.168.80', '', 0, 0),
(49, 2, 4, '', '2015-12-28 07:13:34', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '908791b51f7f915c8fcb2e4143570c02', NULL, NULL, '5.136.168.80', '', 0, 0),
(50, 2, 4, '', '2015-12-28 07:17:07', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '381cdfc199f7c1a85bca0d09371b467a', NULL, NULL, '5.136.168.80', '', 0, 0),
(51, 2, 4, '', '2015-12-28 07:22:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9ef0905d74241a003643bb7227c55dbc', NULL, NULL, '5.136.168.80', '', 0, 0),
(52, 2, 4, '', '2015-12-28 07:27:51', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '10d217a87ae08fa0746f101d517a1916', NULL, NULL, '5.136.168.80', '', 0, 0),
(53, 2, 4, '', '2015-12-28 07:28:10', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '08d3bc7e68302be92bae05614e74fc76', NULL, NULL, '5.136.168.80', '', 0, 0),
(54, 2, 4, '', '2015-12-28 07:28:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9814a4fc548e9d4595f6737947f968da', NULL, NULL, '5.136.168.80', '', 0, 0),
(55, 2, 4, '', '2015-12-28 07:29:50', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5abc9f404f7695460493ad5b908c25fb', NULL, NULL, '5.136.168.80', '', 0, 0),
(56, 2, 4, '', '2015-12-28 07:33:44', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '53ed60289c7616941d64e50f0b0dd8ea', NULL, NULL, '5.136.168.80', '', 0, 0),
(57, 2, 4, '', '2015-12-28 07:42:39', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'bc4e3af67d4cf2ac17e699b922475da0', NULL, NULL, '5.136.168.80', '', 0, 0),
(58, 2, 4, '', '2015-12-28 07:47:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '264a80ecbd71da7c26dff16d7b2ae29c', NULL, NULL, '5.136.168.80', '', 0, 0),
(59, 2, 4, '', '2015-12-28 07:55:15', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5474681a3e63cf9cc99130c9b4d44a80', NULL, NULL, '5.136.168.80', '', 0, 0),
(60, 2, 4, '', '2015-12-28 07:59:28', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cd1ef6e1bb8b437096df173318f46efb', NULL, NULL, '5.136.168.80', '', 0, 0),
(61, 2, 4, '', '2015-12-28 07:59:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2cb12182a55ef48e87c17a82dcae5179', NULL, NULL, '5.136.168.80', '', 0, 0),
(62, 2, 4, '', '2015-12-28 08:00:20', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4e1166c8ccde98913cc1d4563c9b833a', NULL, NULL, '5.136.168.80', '', 0, 0),
(63, 2, 4, '', '2015-12-28 08:00:32', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6bbd104538cc0fece94817421bd7f1be', NULL, NULL, '5.136.168.80', '', 0, 0),
(64, 2, 4, '', '2015-12-28 08:01:04', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '24ad9366f616f08bc583ff8ada994193', NULL, NULL, '5.136.168.80', '', 0, 0),
(65, 2, 4, '', '2015-12-28 08:01:31', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5d070ea28cd93a2f23191cfc03a85456', NULL, NULL, '5.136.168.80', '', 0, 0),
(66, 2, 4, '', '2015-12-28 08:01:53', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8019889e0fc135567670f808ea7c3414', NULL, NULL, '5.136.168.80', '', 0, 0),
(67, 2, 4, '', '2015-12-28 08:02:15', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ba2fd66943dc5198d9700f0b923ec1cd', NULL, NULL, '5.136.168.80', '', 0, 0),
(68, 2, 4, '', '2015-12-28 08:02:36', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2f023376a5f21f0d81ca9412931fabe6', NULL, NULL, '5.136.168.80', '', 0, 0),
(69, 2, 4, '', '2015-12-28 08:02:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7a0db7a839c574ec2f8cdd0c5666a083', NULL, NULL, '5.136.168.80', '', 0, 0),
(70, 2, 4, '', '2015-12-28 08:03:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e1a8f3f3b55ae8c656ddd60250a6d838', NULL, NULL, '5.136.168.80', '', 0, 0),
(71, 2, 4, '', '2015-12-28 08:03:40', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7160ccf85c5835d7e1f5011010280599', NULL, NULL, '5.136.168.80', '', 0, 0),
(72, 2, 4, '', '2015-12-28 08:30:41', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '01d30971a8721f7fb967e14bf76d3410', NULL, NULL, '5.136.168.80', '', 0, 0),
(73, 2, 4, '', '2015-12-28 08:33:48', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9ccafa9b01a13f7283cce7195edcfa9d', NULL, NULL, '5.136.168.80', '', 0, 0),
(74, 2, 4, '', '2015-12-28 08:34:54', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '626eb7484b3ad8a6f6503d1888af4a95', NULL, NULL, '5.136.168.80', '', 0, 0),
(75, 2, 4, '', '2015-12-28 08:36:10', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a34ff8150d4d829c12473243e305fec2', NULL, NULL, '5.136.168.80', '', 0, 0),
(76, 2, 4, '', '2015-12-28 08:36:46', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '79729dcaa6491ccd6dc1cd3a49fcbd45', NULL, NULL, '5.136.168.80', '', 0, 0),
(77, 2, 4, '', '2015-12-28 08:41:05', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3a42fec8366136b295b49fb504ced2b3', NULL, NULL, '5.136.168.80', '', 0, 0),
(78, 2, 4, '', '2015-12-28 08:47:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e4280a32dd056fb7b4994e44a1e9d351', NULL, NULL, '5.136.168.80', '', 0, 0),
(79, 2, 4, '', '2015-12-28 08:50:34', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c33fdfa7142741d84205c75e16036163', NULL, NULL, '5.136.168.80', '', 0, 0),
(80, 2, 4, '', '2015-12-28 08:52:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0dcf16f643aa7f3378845ea8395e5089', NULL, NULL, '5.136.168.80', '', 0, 0),
(81, 2, 4, '', '2015-12-28 09:03:32', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'bc2ce714d55b6f41c2b36932516655bf', NULL, NULL, '5.136.168.80', '', 0, 0),
(82, 2, 4, '', '2015-12-28 09:04:11', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '58b717c965c54b7f61c4bc485b341f3d', NULL, NULL, '5.136.168.80', '', 0, 0),
(83, 2, 4, '', '2015-12-28 09:04:36', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '47b6c66326bd83c39671493d2dc1be48', NULL, NULL, '5.136.168.80', '', 0, 0),
(84, 2, 4, '', '2015-12-28 09:05:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e121c4b46e98c91fdfde82168ed6ac9f', NULL, NULL, '5.136.168.80', '', 0, 0),
(85, 2, 4, '', '2015-12-28 09:06:29', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '84ece950d69ce9d6630fec09dc14a86c', NULL, NULL, '5.136.168.80', '', 0, 0),
(86, 2, 4, '', '2015-12-28 09:07:09', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '594f8a441ce37fb76f15f66bd59a4fba', NULL, NULL, '5.136.168.80', '', 0, 0),
(87, 2, 4, '', '2015-12-28 09:08:36', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1c29d0ad790524f30e8318bff0ceddcd', NULL, NULL, '5.136.168.80', '', 0, 0),
(88, 2, 4, '', '2015-12-28 09:09:07', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8260918883caeecf7955a667950ca465', NULL, NULL, '5.136.168.80', '', 0, 0),
(89, 2, 4, '', '2015-12-28 09:11:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6c8d3076f5f8814191e8249c2af5c14a', NULL, NULL, '5.136.168.80', '', 0, 0),
(90, 2, 4, '', '2015-12-28 09:12:28', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9893c204d4e22e1a43c67efc13b3064f', NULL, NULL, '5.136.168.80', '', 0, 0),
(91, 2, 4, '', '2015-12-28 09:16:35', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a9937dc3649087aacbdf3fd0e197fdeb', NULL, NULL, '5.136.168.80', '', 0, 0),
(92, 2, 4, '', '2015-12-28 09:18:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4ad8eeb7706239a4778fb4712cde4641', NULL, NULL, '5.136.168.80', '', 0, 0),
(93, 2, 4, '', '2015-12-28 09:20:12', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6296f975095833038a65dd99e53ef451', NULL, NULL, '5.136.168.80', '', 0, 0),
(94, 2, 4, '', '2015-12-28 09:22:30', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c6c41e6d87ee0b66daddfa7c8342e3e9', NULL, NULL, '5.136.168.80', '', 0, 0),
(95, 2, 4, '', '2015-12-28 09:24:38', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f27e3d47b624648d5600a5b9f09d96e7', NULL, NULL, '5.136.168.80', '', 0, 0),
(96, 2, 4, '', '2015-12-28 09:25:17', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '577258c6fb8a188891a0d81b34379f41', NULL, NULL, '5.136.168.80', '', 0, 0),
(97, 2, 4, '', '2015-12-28 09:29:10', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6588dba7e12da0fedc11a10e1cb16420', NULL, NULL, '5.136.168.80', '', 0, 0),
(98, 2, 4, '', '2015-12-28 09:30:00', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'dc8ec8d3420734af0b1a4cc99ab1c3a7', NULL, NULL, '5.136.168.80', '', 0, 0),
(99, 2, 4, '', '2015-12-28 10:27:17', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f398450f1339f94bc5b4e87a3e09bb9a', NULL, NULL, '5.136.168.80', '', 0, 0),
(100, 2, 4, '', '2015-12-28 10:47:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c9090c0478c944f11d3e230333187e30', NULL, NULL, '5.136.168.80', '', 0, 0),
(101, 2, 4, '', '2015-12-28 10:48:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f0aeca78a579f65e9887a0581b9aada6', NULL, NULL, '5.136.168.80', '', 0, 0),
(102, 2, 4, '', '2015-12-28 10:51:01', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5332e26d7eb2f25ac89ac9e469a10b83', NULL, NULL, '5.136.168.80', '', 0, 0),
(103, 2, 4, '', '2015-12-28 10:51:21', 0.50, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a6a6b800138a83040c0a358716b938cb', '4', NULL, '5.136.168.80', '', 0, 0),
(104, 2, 4, '', '2015-12-28 11:52:16', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9dadfd08597f1a09ef846f2c3f4a971e', NULL, NULL, '5.136.168.80', '', 0, 0),
(105, 2, 4, '', '2015-12-28 12:18:51', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'df18e91869682fc0e57188e0757d95a9', NULL, NULL, '5.136.168.80', '', 0, 0),
(106, 2, 4, '', '2015-12-28 12:20:51', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6cec91d8267063fb6dcaf8fd23258253', NULL, NULL, '5.136.168.80', '', 0, 0),
(107, 2, 4, '', '2015-12-28 12:21:16', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f40ef71756ad89f91fd22b2c24bad180', NULL, NULL, '5.136.168.80', '', 0, 0),
(108, 2, 4, '', '2015-12-28 12:24:38', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b1f703bb474385ea22010f95cc26c822', NULL, NULL, '5.136.168.80', '', 0, 0),
(109, 2, 4, '', '2015-12-28 13:05:06', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c687295fd4738116da877e9a30282bf7', NULL, NULL, '5.136.168.80', '', 0, 0),
(110, 2, 4, '', '2015-12-28 13:05:16', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ffe6ec6e93fbd1d4403cf6e607977053', NULL, NULL, '5.136.168.80', '', 0, 0),
(111, 2, 4, '', '2015-12-28 13:06:20', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b91c8b915244e624fad4a73a8baed733', NULL, NULL, '5.136.168.80', '', 0, 0),
(112, 2, 4, '', '2015-12-28 13:12:41', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ea7c40ece33cbe6a52d5d3769a537e13', NULL, NULL, '5.136.168.80', '', 0, 0),
(113, 2, 4, '', '2015-12-28 13:16:51', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '22bc1fdb9ff7ca9cfd6889922781a974', NULL, NULL, '5.136.168.80', '', 0, 0),
(114, 2, 4, '', '2015-12-28 13:29:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5ccf8861eb9896b75c2ebfc8444fe1a5', NULL, NULL, '5.136.168.80', '', 0, 0),
(115, 2, 4, '', '2015-12-28 13:31:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '797d6a904cb680f38544856191ca5037', NULL, NULL, '5.136.168.80', '', 0, 0),
(116, 2, 4, '', '2015-12-28 13:32:22', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f6121f3d6ba2f3b2c4f6986bf96e9c8c', NULL, NULL, '5.136.168.80', '', 0, 0),
(117, 2, 4, '', '2015-12-28 13:32:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '792a4311040d42314be9ce1e631a05b7', NULL, NULL, '5.136.168.80', '', 0, 0),
(118, 2, 4, '', '2015-12-28 13:32:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b258696d92f938bd5eab3a77c97c2607', NULL, NULL, '5.136.168.80', '', 0, 0),
(119, 2, 4, '', '2015-12-28 13:33:43', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b336e0261e432c684c7d61f0a1592277', NULL, NULL, '5.136.168.80', '', 0, 0),
(120, 2, 4, '', '2015-12-28 13:35:55', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3e43e67b78b18af2662a2cd3f457a627', NULL, NULL, '5.136.168.80', '', 0, 0),
(121, 2, 4, '', '2015-12-28 13:39:18', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e465693dfb40207a11d4115a47eeee52', NULL, NULL, '5.136.168.80', '', 0, 0),
(122, 2, 4, '', '2015-12-28 13:39:44', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c36d1079d34b2b30de00eb404cf4fefe', NULL, NULL, '5.136.168.80', '', 0, 0),
(123, 2, 4, '', '2015-12-28 13:40:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '12cc19e31f512caccf7b01aca873030b', NULL, NULL, '5.136.168.80', '', 0, 0),
(124, 2, 4, '', '2015-12-28 13:41:17', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b08fc2761f705edd3e3b877d3f7743ec', NULL, NULL, '5.136.168.80', '', 0, 0),
(125, 2, 4, '', '2015-12-28 13:43:46', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8bb4c8c3e674c7a5a369b8dc63a406f4', NULL, NULL, '5.136.168.80', '', 0, 0),
(126, 2, 4, '', '2015-12-28 13:46:02', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '22a5887f67e59ae920515053de24e4bc', NULL, NULL, '5.136.168.80', '', 0, 0),
(127, 2, 4, '', '2015-12-28 13:46:13', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1e47f78219b37d17244365ce368325b8', NULL, NULL, '5.136.168.80', '', 0, 0),
(128, 2, 4, '', '2015-12-28 13:46:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3e06d4c5b7c05eb9ffd21998bf8a6b54', NULL, NULL, '5.136.168.80', '', 0, 0),
(129, 2, 4, '', '2015-12-28 13:48:23', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '60a8e5c6b06e7f0a89e39881deb2a74b', NULL, NULL, '5.136.168.80', '', 0, 0),
(130, 2, 4, '', '2015-12-28 13:49:18', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c9f5e4f80d85b0ec92bb0953aace3bfe', NULL, NULL, '5.136.168.80', '', 0, 0),
(131, 2, 4, '', '2015-12-28 13:51:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e3898a0f81606e551f3731b71f22d68c', NULL, NULL, '5.136.168.80', '', 0, 0),
(132, 2, 4, '', '2015-12-29 05:41:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6ebe0e80b04fe467547349238411cc8c', NULL, NULL, '5.136.168.80', '', 0, 0),
(133, 2, 4, '', '2015-12-29 05:59:23', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2d54184bb63fcced349871133c766eb4', NULL, NULL, '5.136.168.80', '', 0, 0),
(134, 2, 4, '', '2015-12-29 11:02:17', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd7fa59d0e566678d2bf802ca378e360e', NULL, NULL, '5.136.168.80', '', 0, 0),
(135, 2, 4, '', '2015-12-29 12:18:30', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3dfd9eb590a6d279344edace14284abf', NULL, NULL, '5.136.168.80', '', 0, 0),
(136, 2, 4, '', '2015-12-29 12:45:31', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd67833e6789053b08c58f9ca2aaeecd4', NULL, NULL, '5.136.168.80', '', 0, 0),
(137, 2, 4, '', '2015-12-29 12:45:45', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '667e94dc70ada48fd7cfac1f39a4fadd', NULL, NULL, '5.136.168.80', '', 0, 0),
(138, 2, 4, '', '2015-12-29 12:46:26', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'db926d737444de6e0b06a56fa324bcd1', NULL, NULL, '5.136.168.80', '', 0, 0),
(139, 2, 4, '', '2015-12-29 12:49:33', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0d1c6c240e2760b4872f087192f70797', NULL, NULL, '5.136.168.80', '', 0, 0),
(140, 2, 4, '', '2015-12-29 13:17:14', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', '123123', 'Не оплачен', '68414ce97aa94ca3308e57bb5ee001f7', NULL, NULL, '5.136.168.80', '', 0, 0),
(142, 2, 4, '', '2015-12-29 14:15:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e3c7ff5f888321d5f36e4289ee9bd688', NULL, NULL, '5.136.168.80', '', 0, 0),
(143, 2, 4, '', '2015-12-29 14:17:38', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '49dd85c18b57f8858274186387c19739', NULL, NULL, '5.136.168.80', '', 0, 0),
(144, 2, 4, '', '2015-12-29 14:18:15', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b17e1f2be75526489d968c4858d77df3', NULL, NULL, '5.136.168.80', '', 0, 0),
(145, 2, 4, '', '2016-01-02 10:39:28', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '38f64f59ac969e2cee585ae110048bac', NULL, NULL, '80.83.237.50', '', 0, 0),
(146, 2, 4, '', '2016-01-02 10:40:23', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '62d3bf86fb0719eaf5468aa7754fa7e5', NULL, NULL, '80.83.237.50', '', 0, 0),
(147, 2, 6, '', '2016-01-03 16:51:38', 60.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '4903f4e7569fdb85cbe3bc1337de9452', NULL, NULL, '80.83.237.92', '', 0, 0),
(148, 2, 4, '', '2016-01-03 16:52:20', 12.00, 12, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'd245f4c7808d95d8b25bf9eb232c4b3b', NULL, NULL, '80.83.237.92', '', 0, 0),
(149, 2, 4, '', '2016-01-09 00:00:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7e48452d53c41d84cefdcaf9ad55d06f', NULL, NULL, '5.136.168.80', '', 0, 0),
(150, 2, 4, '', '2016-01-09 00:00:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '33ada6be9c9cbb1890c69a2dd1d4a3b3', NULL, NULL, '5.136.168.80', '', 0, 0),
(151, 2, 4, '', '2016-01-09 00:00:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9ab68c840e913dbc05cdaaf136aa6ce3', NULL, NULL, '5.136.168.80', '', 0, 0),
(152, 2, 4, '', '2016-01-09 03:09:50', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8a22b8e9b80cfd10d75eabb2749415b5', NULL, NULL, '5.136.168.80', '', 0, 0),
(153, 2, 4, '', '2016-01-09 03:10:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '71977c562378bde92363361c901a9bc6', NULL, NULL, '5.136.168.80', '', 0, 0),
(154, 2, 4, '', '2016-01-09 03:11:15', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '645d7b809f4bc9ad89caacd7eff50edc', NULL, NULL, '5.136.168.80', '', 0, 0),
(155, 2, 4, '', '2016-01-09 03:13:01', 2.00, 2, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'ec8ce4816a7da42aa4165b5956965091', NULL, NULL, '80.83.237.56', '', 0, 0),
(156, 2, 4, '', '2016-01-09 03:13:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4cdd978ec2fe101304c9d4e46f185464', NULL, NULL, '5.136.168.80', '', 0, 0),
(157, 2, 4, '', '2016-01-09 03:15:58', 2.00, 2, 'yandex', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'f43c0de030d7fe2dc9a0f8070b594d55', NULL, NULL, '80.83.237.56', '', 0, 0),
(158, 2, 4, '', '2016-01-09 03:16:55', 2.00, 2, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '4a16c0ffb2b7ab48b59a343bba484d7c', NULL, NULL, '80.83.237.56', '', 0, 0),
(159, 2, 4, '', '2016-01-10 06:34:18', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b07b48e4f26e8f6cda8306305cd1af90', NULL, NULL, '5.136.168.80', '', 0, 0),
(160, 2, 4, '', '2016-01-10 06:44:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4b7f3b231eb7f15c6453b6c95faaf053', NULL, NULL, '5.136.168.80', '', 0, 0),
(161, 2, 4, '', '2016-01-10 06:44:45', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '71be52fcd9d1b0d01cc8b64a4efe518e', NULL, NULL, '5.136.168.80', '', 0, 0),
(162, 2, 4, '', '2016-01-10 06:45:11', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e9f487531dd3bf24e209ee1e3b441c90', NULL, NULL, '5.136.168.80', '', 0, 0),
(163, 2, 4, '', '2016-01-10 06:47:33', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '10ef72016091d3b581531d111f21f5cc', NULL, NULL, '5.136.168.80', '', 0, 0),
(164, 2, 4, '', '2016-01-10 06:53:05', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3f6182129c0329b674b162ed76b944fb', NULL, NULL, '5.136.168.80', '', 0, 0),
(165, 2, 4, '', '2016-01-10 06:53:23', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'fe8553fda5c43088a9e48d460defc8cb', NULL, NULL, '5.136.168.80', '', 0, 0),
(166, 2, 4, '', '2016-01-10 06:56:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ccb62bafe84f5e907443d5d075e20d8d', NULL, NULL, '5.136.168.80', '', 0, 0),
(167, 2, 4, '', '2016-01-10 06:57:10', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd2dd163d9f1843c069817279a1884428', NULL, NULL, '5.136.168.80', '', 0, 0),
(168, 2, 4, '', '2016-01-10 06:59:15', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd88db18df3899a09a1ea81c7890087b9', NULL, NULL, '5.136.168.80', '', 0, 0),
(169, 2, 4, '', '2016-01-10 07:01:20', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5ca0c241d8a270a5d7957f79b7991393', NULL, NULL, '5.136.168.80', '', 0, 0),
(170, 2, 4, '', '2016-01-10 07:02:18', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9ab843971b12bbdfc9366603b0fc04f4', NULL, NULL, '5.136.168.80', '', 0, 0),
(171, 2, 4, '', '2016-01-10 07:02:19', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2429b530ebf29ee4e13056fb76d065e3', NULL, NULL, '5.136.168.80', '', 0, 0),
(172, 2, 4, '', '2016-01-10 07:02:19', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '68d2b94563a7e0fd6fd79157ecd3506e', NULL, NULL, '5.136.168.80', '', 0, 0),
(173, 2, 4, '', '2016-01-10 07:02:19', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd705ed4769f6c05181789d6651b2a530', NULL, NULL, '5.136.168.80', '', 0, 0),
(174, 2, 4, '', '2016-01-10 07:02:20', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '013c238176dceafc3878bc3036384b1c', NULL, NULL, '5.136.168.80', '', 0, 0),
(175, 2, 4, '', '2016-01-10 07:02:21', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0bec78b414e1f1d09b2df78e9ff17394', NULL, NULL, '5.136.168.80', '', 0, 0),
(176, 2, 4, '', '2016-01-10 07:02:21', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '17e29c0d3d03a6747339103404f3c462', NULL, NULL, '5.136.168.80', '', 0, 0),
(177, 2, 4, '', '2016-01-10 07:02:22', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a9128eb33f0ec4a479d58bb0be68edac', NULL, NULL, '5.136.168.80', '', 0, 0),
(178, 2, 4, '', '2016-01-10 07:02:22', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0c5720503ea3b4df1feb60945524e832', NULL, NULL, '5.136.168.80', '', 0, 0),
(179, 2, 4, '', '2016-01-10 07:02:23', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'dfa87f390e56b82d754b40c34f4043f0', NULL, NULL, '5.136.168.80', '', 0, 0),
(180, 2, 4, '', '2016-01-10 07:02:23', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '51756c9f650b81e9780df74d7f88e6c0', NULL, NULL, '5.136.168.80', '', 0, 0),
(181, 2, 4, '', '2016-01-10 07:02:23', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1dbe126051fc5fd60a6ea9684744008a', NULL, NULL, '5.136.168.80', '', 0, 0),
(182, 2, 4, '', '2016-01-10 07:02:50', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6133fbdb45dd0c67fa88aba6d2df0599', NULL, NULL, '5.136.168.80', '', 0, 0),
(183, 2, 4, '', '2016-01-10 07:02:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e59c039c17bfb4dd7fbdde5f1c60dbab', NULL, NULL, '5.136.168.80', '', 0, 0),
(184, 2, 4, '', '2016-01-10 07:02:53', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6320a6554c30da772ea5f64ac26fe3d4', NULL, NULL, '5.136.168.80', '', 0, 0),
(185, 2, 4, '', '2016-01-10 07:02:54', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'fc99d7ae3f414da90e46a78aea3c16a6', NULL, NULL, '5.136.168.80', '', 0, 0),
(186, 2, 4, '', '2016-01-10 07:02:54', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a341b9e56fc41bd8309be8345ef4b8e5', NULL, NULL, '5.136.168.80', '', 0, 0),
(187, 2, 4, '', '2016-01-10 07:02:55', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ab34aed1d3f8f61ee6b8e07c1a2d06ac', NULL, NULL, '5.136.168.80', '', 0, 0),
(188, 2, 4, '', '2016-01-10 07:02:55', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b2271798945f78bf9d1b4f532a9f53a4', NULL, NULL, '5.136.168.80', '', 0, 0),
(189, 2, 4, '', '2016-01-10 07:02:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '81dd5a07c00d5f2f0470c355119878e7', NULL, NULL, '5.136.168.80', '', 0, 0),
(190, 2, 4, '', '2016-01-10 07:02:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd5fc1b2466b66245d314e41ef4dd8315', NULL, NULL, '5.136.168.80', '', 0, 0),
(191, 2, 4, '', '2016-01-10 07:02:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0deb4b6ecae2c7d381cf2ea0e83bfc6d', NULL, NULL, '5.136.168.80', '', 0, 0),
(192, 2, 4, '', '2016-01-10 07:02:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'bd5d77141068ff2f5d48e9a813fbcf68', NULL, NULL, '5.136.168.80', '', 0, 0),
(193, 2, 4, '', '2016-01-10 07:02:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8c349722a74563904f7750283abd7f62', NULL, NULL, '5.136.168.80', '', 0, 0),
(194, 2, 4, '', '2016-01-10 07:02:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '551247c4918cf103bf51d27cd62e8fd8', NULL, NULL, '5.136.168.80', '', 0, 0),
(195, 2, 4, '', '2016-01-10 07:02:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4d188cac6faf8d5759db1dd022af974c', NULL, NULL, '5.136.168.80', '', 0, 0),
(196, 2, 4, '', '2016-01-10 07:02:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ed645137e0ff38f83763b5763cdd75df', NULL, NULL, '5.136.168.80', '', 0, 0),
(197, 2, 4, '', '2016-01-10 07:02:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '50d5612da53f02a3ddad931a7edc2eec', NULL, NULL, '5.136.168.80', '', 0, 0),
(198, 2, 4, '', '2016-01-10 07:02:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3dcc1b1c04c62b063804075a93d8880b', NULL, NULL, '5.136.168.80', '', 0, 0),
(199, 2, 4, '', '2016-01-10 07:02:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3e9f0c1ae4768f4990df9576af1628ef', NULL, NULL, '5.136.168.80', '', 0, 0),
(200, 2, 4, '', '2016-01-10 07:03:02', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '55f080793018f7fa320e71a76ca576ca', NULL, NULL, '5.136.168.80', '', 0, 0),
(201, 2, 4, '', '2016-01-10 07:03:02', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '50fcaf98b1d43c4385cfa8406e1baad9', NULL, NULL, '5.136.168.80', '', 0, 0),
(202, 2, 4, '', '2016-01-10 07:03:07', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7a94b492d66aebc6768863da203ad552', NULL, NULL, '5.136.168.80', '', 0, 0),
(203, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1b7820798208fb73453e46b87acc7bff', NULL, NULL, '5.136.168.80', '', 0, 0),
(204, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f90ecc30b6035fb5874ecc444bb1efdd', NULL, NULL, '5.136.168.80', '', 0, 0),
(205, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '57721442f152a75313df33c3f9595444', NULL, NULL, '5.136.168.80', '', 0, 0),
(206, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c308d874ec05119645599ce3cdb1bc14', NULL, NULL, '5.136.168.80', '', 0, 0),
(207, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '47190f05a8784bbcd9b3b5712e8dd482', NULL, NULL, '5.136.168.80', '', 0, 0),
(208, 2, 4, '', '2016-01-10 07:03:08', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0f9c759ded7a8e4467dfe960d4e98a7a', NULL, NULL, '5.136.168.80', '', 0, 0),
(209, 2, 5, '', '2016-01-10 07:03:11', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e7ccb79c9176755c399cfa8001876ab8', NULL, NULL, '5.136.168.80', '', 0, 0),
(210, 2, 4, '', '2016-01-10 07:03:17', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'c22bbba7da265f921a95730fec98dc47', NULL, NULL, '5.136.168.80', '', 0, 0),
(211, 2, 4, '', '2016-01-10 07:03:34', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5e50dedb2d764f1382766ff70c03ea12', NULL, NULL, '5.136.168.80', '', 0, 0),
(212, 2, 4, '', '2016-01-10 07:04:12', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '93f5b7f2131ab8e4d5f109c9a9ddbd20', NULL, NULL, '5.136.168.80', '', 0, 0),
(213, 2, 4, '', '2016-01-10 07:04:34', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0ca40222e00b3caacf0db52a6113c066', NULL, NULL, '5.136.168.80', '', 0, 0),
(214, 2, 4, '', '2016-01-10 07:05:30', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '3cd2c71c8a7fd70839b636f0174fa8fa', NULL, NULL, '5.136.168.80', '', 0, 0),
(215, 2, 4, '', '2016-01-10 07:05:56', 10.00, 10, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'be91e054064e61efe7d8f196e509351c', NULL, NULL, '5.136.168.80', '', 0, 0),
(216, 2, 4, '', '2016-01-10 07:06:13', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4a6d20413e850ea6d8f73b314a88117f', NULL, NULL, '5.136.168.80', '', 0, 0),
(217, 2, 4, '', '2016-01-10 07:08:37', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd446fc982b3379c92a3052cfb86f052f', NULL, NULL, '5.136.168.80', '', 0, 0),
(218, 2, 4, '', '2016-01-10 07:09:06', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'abd3de808555fd9f77c06889ba901cfb', NULL, NULL, '5.136.168.80', '', 0, 0),
(219, 2, 4, '', '2016-01-10 07:10:05', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9b0e17f4ece12f8447da2aa2a5473229', NULL, NULL, '5.136.168.80', '', 0, 0),
(220, 2, 4, '', '2016-01-10 07:11:45', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '28fb1b6e69bf3c2760cfd351b5aa228b', NULL, NULL, '5.136.168.80', '', 0, 0),
(221, 2, 4, '', '2016-01-10 07:13:13', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cc06998bb0c4600d5e876fc86fe70193', NULL, NULL, '5.136.168.80', '', 0, 0),
(222, 2, 4, '', '2016-01-10 07:13:26', 10.00, 10, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0971530e930eb9cac597ea388b60f03f', NULL, NULL, '5.136.168.80', '', 0, 0),
(223, 2, 4, '', '2016-01-10 07:14:02', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '491497871c5b566115457a6bc9da6200', NULL, NULL, '5.136.168.80', '', 0, 0),
(224, 2, 4, '', '2016-01-10 07:14:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e2d5857743c60dcd4c84313abc4cff06', NULL, NULL, '5.136.168.80', '', 0, 0),
(225, 2, 4, '', '2016-01-10 07:15:33', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6940a5407a9452eef6f9af02a1906a0f', NULL, NULL, '5.136.168.80', '', 0, 0),
(226, 2, 4, '', '2016-01-10 07:16:35', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7e499a139e5c2a684e46be9ed91ee056', NULL, NULL, '5.136.168.80', '', 0, 0),
(227, 2, 4, '', '2016-01-10 07:30:45', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9acdc02ce61624ee99cfaf14b99c5220', NULL, NULL, '5.136.168.80', '', 0, 0),
(228, 2, 4, '', '2016-01-10 07:31:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '83f151deb261db9b79739057289e2330', NULL, NULL, '5.136.168.80', '', 0, 0),
(229, 2, 4, '', '2016-01-10 07:33:16', 12.00, 12, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '75b42848694e3e07fc267b8d4f20e600', NULL, NULL, '5.136.168.80', '', 0, 0),
(230, 2, 4, '', '2016-01-10 07:33:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1a09d951e2ee1f85812029c69b7402a8', NULL, NULL, '5.136.168.80', '', 0, 0),
(231, 2, 4, '', '2016-01-10 07:34:11', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cbb936b4a9369b4ac019c40f1955afdd', NULL, NULL, '5.136.168.80', '', 0, 0),
(232, 2, 4, '', '2016-01-10 07:34:25', 12.00, 12, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'bfeb8368b9c54eb53ca83279fa697e42', NULL, NULL, '5.136.168.80', '', 0, 0),
(233, 2, 4, '', '2016-01-10 07:35:50', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f64b5b6debc26173ff890691aeaf3a00', NULL, NULL, '5.136.168.80', '', 0, 0),
(234, 2, 4, '', '2016-01-10 07:36:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5211c33268be2609cdc26f1cf755b853', NULL, NULL, '5.136.168.80', '', 0, 0),
(235, 2, 4, '', '2016-01-10 07:36:49', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd2f4df2f7d4fd17ec70eb3ce22849867', NULL, NULL, '5.136.168.80', '', 0, 0),
(236, 2, 4, '', '2016-01-10 07:38:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '73ca9676d6fc169f251b54534991ddbb', NULL, NULL, '5.136.168.80', '', 0, 0),
(237, 2, 4, '', '2016-01-10 07:39:38', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6f0cd57d63e414fcd513625a596592bb', NULL, NULL, '5.136.168.80', '', 0, 0),
(238, 2, 4, '', '2016-01-10 07:40:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '84aba4da03b07847a74442e8c1284a91', NULL, NULL, '5.136.168.80', '', 0, 0),
(239, 2, 4, '', '2016-01-10 07:40:29', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1beb3cba1a5033b1f41895d657274f6a', NULL, NULL, '5.136.168.80', '', 0, 0),
(240, 2, 4, '', '2016-01-10 07:47:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '830467ba01b7edab26371d3941d1bce1', NULL, NULL, '5.136.168.80', '', 0, 0),
(241, 2, 4, '', '2016-01-10 07:47:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4c92a81045b62c25f3c4224000820b93', NULL, NULL, '5.136.168.80', '', 0, 0),
(242, 2, 4, '', '2016-01-10 07:53:44', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e83b3eb4260750bf2b425019484bf9d2', NULL, NULL, '5.136.168.80', '', 0, 0),
(243, 2, 4, '', '2016-01-10 07:55:08', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '133f7aabf8b6d812a9b2cc1c46ad9ca8', NULL, NULL, '5.136.168.80', '', 0, 0),
(244, 2, 4, '', '2016-01-10 07:57:48', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '859301dc0bdfc6b3e1b2e2d345c78d64', NULL, NULL, '5.136.168.80', '', 0, 0),
(245, 2, 4, '', '2016-01-10 07:58:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2eeda8f33490f301484cf75bdc5b94fc', NULL, NULL, '5.136.168.80', '', 0, 0),
(246, 2, 4, '', '2016-01-10 07:59:17', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '49c416c6995d2b52d194b4fc7b3cfbb9', NULL, NULL, '5.136.168.80', '', 0, 0),
(247, 2, 4, '', '2016-01-10 08:03:26', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '52a7b3e9bc3f6c65a837722d13d74719', NULL, NULL, '5.136.168.80', '', 0, 0),
(248, 2, 4, '', '2016-01-10 08:03:40', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e5bd20c9c268adeaca434eecf113f7cd', NULL, NULL, '5.136.168.80', '', 0, 0),
(249, 2, 4, '', '2016-01-10 08:04:47', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '10f493319888ca8b61e81b97e2820b1c', NULL, NULL, '5.136.168.80', '', 0, 0),
(250, 2, 4, '', '2016-01-10 08:06:47', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '17313de96c4c5e9b4dd805171edb2d32', NULL, NULL, '5.136.168.80', '', 0, 0),
(251, 2, 4, '', '2016-01-10 08:16:33', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd40e3a81d33815105efc66b8a8ab2974', NULL, NULL, '5.136.168.80', '', 0, 0),
(252, 2, 4, '', '2016-01-10 08:19:33', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '287433b03b46c83cf6f7749c16f619bc', NULL, NULL, '5.136.168.80', '', 0, 0),
(253, 2, 4, '', '2016-01-10 08:19:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '20bb6fb6c15eeb8f183c2b7f302e2056', NULL, NULL, '5.136.168.80', '', 0, 0),
(254, 2, 4, '', '2016-01-10 08:20:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b31b603e6281d957dd1cdbf2498eaa7f', NULL, NULL, '5.136.168.80', '', 0, 0),
(255, 2, 4, '', '2016-01-10 08:23:21', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cfe93712cd6a88a26e3e8dc887f44447', NULL, NULL, '5.136.168.80', '', 0, 0),
(256, 2, 4, '', '2016-01-10 08:23:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '86df5e0f70fc3a66fa46bba80fd713f9', NULL, NULL, '5.136.168.80', '', 0, 0),
(257, 2, 4, '', '2016-01-10 08:24:52', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '526259ee4cf307b67cf43ad73ef51116', NULL, NULL, '5.136.168.80', '', 0, 0),
(258, 2, 4, '', '2016-01-10 08:25:05', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '653f946f7cb5c90b51444098a723b44b', NULL, NULL, '5.136.168.80', '', 0, 0),
(259, 2, 4, '', '2016-01-10 08:28:05', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4dbe92c6b64ee35577d14a990548df58', NULL, NULL, '5.136.168.80', '', 0, 0),
(260, 2, 4, '', '2016-01-10 08:29:38', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ae3d66e5ff33f687cef3b829f45de0dd', NULL, NULL, '5.136.168.80', '', 0, 0),
(261, 2, 4, '', '2016-01-10 08:30:07', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7fd4dda3d1e9c1960f2b873b7e97971c', NULL, NULL, '5.136.168.80', '', 0, 0),
(262, 2, 4, '', '2016-01-10 08:32:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a0aacd074e1e8c3c14c7cf7bd19f96ee', NULL, NULL, '5.136.168.80', '', 0, 0),
(263, 2, 4, '', '2016-01-10 08:32:35', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd3784d0d88b3055fb68a661f8c74d278', NULL, NULL, '5.136.168.80', '', 0, 0),
(264, 2, 4, '', '2016-01-10 08:37:29', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ea117d4e8a6cfb2d9ae57e00a51e214a', NULL, NULL, '5.136.168.80', '', 0, 0),
(265, 2, 4, '', '2016-01-10 08:40:50', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6b4caf2e80d8ae69bbe035f16def5129', NULL, NULL, '5.136.168.80', '', 0, 0),
(266, 2, 4, '', '2016-01-10 08:42:04', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '84e1c8db4e96e5b9177976bf7be75b4b', NULL, NULL, '5.136.168.80', '', 0, 0),
(267, 2, 4, '', '2016-01-10 08:43:12', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'aa03354280b0c8029ed31fc4f942bacd', NULL, NULL, '5.136.168.80', '', 0, 0),
(268, 2, 6, '', '2016-01-10 08:43:56', 60.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8730ec4d199ddf9d52af04909dafdbaa', NULL, NULL, '5.136.168.80', '', 0, 0),
(269, 2, 4, '', '2016-01-10 08:45:16', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2f95c8f0975d05523399babf02640700', NULL, NULL, '5.136.168.80', '', 0, 0),
(270, 2, 4, '', '2016-01-10 08:50:02', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e6db3669ccc4c7cae096b3fb547434d7', NULL, NULL, '5.136.168.80', '', 0, 0),
(271, 2, 4, '', '2016-01-10 09:07:22', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ec04e64e19622bd8ae7d2c2961af4c62', NULL, NULL, '5.136.168.80', '', 0, 0),
(273, 2, 4, '', '2016-01-10 09:42:34', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '777d4303919d6ed6304358e7ee3bf75b', NULL, NULL, '5.136.168.80', '', 0, 0),
(274, 2, 4, '', '2016-01-10 09:43:30', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f20e2b04ec64cd601f66a9708137aefb', NULL, NULL, '5.136.168.80', '', 0, 0),
(275, 2, 5, '', '2016-01-10 09:43:46', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd4c569bff6af5e9e80a8b379f443cb9c', NULL, NULL, '5.136.168.80', '', 0, 0),
(276, 2, 4, '', '2016-01-10 09:45:02', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a3e6c263258589108d711a2c3df5ab85', NULL, NULL, '5.136.168.80', '', 0, 0),
(277, 2, 4, '', '2016-01-10 09:46:34', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '19736aec90a36a0c99b7d4ab7bad23e9', NULL, NULL, '5.136.168.80', '', 0, 0),
(278, 2, 4, '', '2016-01-10 09:47:38', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c037149b532586b1f4b87a3f19221d8c', NULL, NULL, '5.136.168.80', '', 0, 0),
(279, 2, 4, '', '2016-01-10 09:49:38', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2e3187132031dff7585fc388c393cd26', NULL, NULL, '5.136.168.80', '', 0, 0),
(280, 2, 6, '', '2016-01-10 09:54:06', 120.00, 2, 'yandex', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'b37b1bf836b656c6630385f81f351200', NULL, NULL, '66.102.9.99', '', 0, 0),
(281, 2, 6, '', '2016-01-10 09:55:53', 60.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '517bf2c1ff12ffa212da4ad98b922569', NULL, NULL, '5.136.168.80', '', 0, 0),
(282, 2, 5, '', '2016-01-10 09:56:14', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9b0c4488e29e85db082eb77708337197', NULL, NULL, '5.136.168.80', '', 0, 0),
(283, 2, 6, '', '2016-01-10 09:56:31', 60.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6aed3c708555db0246d9e85639b04ca0', NULL, NULL, '5.136.168.80', '', 0, 0),
(284, 2, 8, '', '2016-01-10 09:58:08', 22.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '135c2b47ab5f1e58dad9a372d0453b23', NULL, NULL, '5.136.168.80', '', 0, 0),
(285, 2, 6, '', '2016-01-10 09:58:50', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2e9773dd06d691f8f90e8ec733ad6232', NULL, NULL, '5.136.168.80', '', 0, 0),
(286, 2, 5, '', '2016-01-10 09:59:40', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1ba3004bf597a26897ce6d4541ee3d8a', NULL, NULL, '5.136.168.80', '', 0, 0),
(287, 2, 6, '', '2016-01-10 10:00:22', 60.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b0732a2d9ee04db7c78a8b17e4c4ec02', NULL, NULL, '5.136.168.80', '', 0, 0),
(288, 2, 4, '', '2016-01-10 10:00:38', 12.00, 12, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ddadd0eb300a4a4e9c043adf97d41098', NULL, NULL, '5.136.168.80', '', 0, 0),
(289, 2, 6, '', '2016-01-10 10:02:07', 60.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c9f280937d483999dc3bd6986b7d59af', NULL, NULL, '5.136.168.80', '', 0, 0),
(290, 2, 6, '', '2016-01-10 10:03:22', 60.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4c89a79443cff334df99ea7e65bd6705', NULL, NULL, '5.136.168.80', '', 0, 0),
(291, 2, 5, '', '2016-01-10 12:56:38', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ec56c75de9397cab469ad312f56cc797', NULL, NULL, '5.136.168.80', '', 0, 0),
(292, 2, 6, '', '2016-01-10 13:05:35', 60.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3e93c38151f5e5971079958507d94871', NULL, NULL, '5.136.168.80', '', 0, 0),
(293, 2, 4, '', '2016-01-11 06:46:24', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3d79b507a8d8e9c08a136f0a98d72574', NULL, NULL, '5.136.183.99', '', 0, 0),
(294, 2, 4, '', '2016-01-11 06:52:20', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b84e1ea6147927272de561d3f1854c59', NULL, NULL, '5.136.183.99', '', 0, 0),
(295, 2, 4, '', '2016-01-11 10:40:42', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '67da3ff6b11300cb05ad61f49d730e13', NULL, NULL, '5.136.183.99', '', 0, 0),
(296, 2, 4, '', '2016-01-11 10:41:03', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1769d735eb6a4417437f1b54490f7673', NULL, NULL, '5.136.183.99', '', 0, 0),
(297, 2, 4, '', '2016-01-11 10:41:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '80cac2f405c7a4f3e13c851907903165', NULL, NULL, '5.136.183.99', '', 0, 0),
(298, 2, 4, '', '2016-01-11 10:43:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'de7287d3c3c6bbded669182cb08cc3dd', NULL, NULL, '5.136.183.99', '', 0, 0),
(299, 2, 4, '', '2016-01-11 10:44:04', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '131aa57813d808ff6186ded81c6ae4b3', NULL, NULL, '5.136.183.99', '', 0, 0);
INSERT INTO `orders` (`id`, `id_shop`, `id_goods`, `name`, `date`, `sum`, `count`, `method`, `email`, `icq`, `status`, `secret`, `coupon`, `purse`, `ip`, `cash`, `percent`, `free_id`) VALUES
(300, 2, 4, '', '2016-01-11 10:45:14', 1.00, 1, 'yandex', 'baklan212121@gmail.com', NULL, 'Не оплачен', '7d5760fae538277d2e3e5db0cb0211e4', NULL, NULL, '5.136.183.99', '', 0, 0),
(301, 2, 4, '', '2016-01-11 10:47:27', 2.00, 2, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'db52ef0b890adc21d8c33f2638e272d4', NULL, NULL, '66.102.9.99', '', 0, 0),
(302, 2, 4, '', '2016-01-12 07:16:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '93fda85f67ce15b6cbc3f4566da6ec18', NULL, NULL, '5.136.183.99', '', 0, 0),
(303, 2, 4, '', '2016-01-12 07:21:37', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5eac5f877a28f5acdcbfa525f7720fd1', NULL, NULL, '5.136.183.99', '', 0, 0),
(304, 2, 4, '', '2016-01-12 07:22:03', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9900990405dbda7b0f19167d918ef47a', NULL, NULL, '5.136.183.99', '', 0, 0),
(305, 2, 4, '', '2016-01-12 07:22:30', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2d5b8225c36163a73644cade2b4418ac', NULL, NULL, '5.136.183.99', '', 0, 0),
(306, 2, 4, '', '2016-01-12 07:23:47', 10.00, 10, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '6f49af341f1243c23dd394fdb7fbf4d4', NULL, NULL, '5.136.183.99', '', 0, 0),
(307, 2, 5, '', '2016-01-12 07:24:46', 300.00, 12, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '08cbccfd93192eaec7668d8bf33683ed', NULL, NULL, '5.136.183.99', '', 0, 0),
(308, 2, 4, '', '2016-01-12 07:27:27', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1c56a43f1a71f485d13e17f0d7591ff6', NULL, NULL, '5.136.183.99', '', 0, 0),
(309, 2, 5, '', '2016-01-12 07:48:25', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ef4c785151f89b620f37d8979518ce76', NULL, NULL, '5.136.183.99', '', 0, 0),
(310, 2, 4, '', '2016-01-12 11:30:43', 1.00, 1, 'wmz', 'baklan212121@gmail.com', NULL, 'Не оплачен', '4cb0cca8eb316581b19a9289c5cb009e', NULL, NULL, '5.136.183.99', '', 0, 0),
(311, 2, 4, '', '2016-01-12 11:31:42', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2af7143d0611e1a7028db489d1e6a1f9', NULL, NULL, '5.136.183.99', '', 0, 0),
(312, 2, 4, '', '2016-01-12 12:24:43', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '0c6b7919c37ab27c5dd593ef702245c6', NULL, NULL, '5.136.183.99', '', 0, 0),
(313, 2, 4, '', '2016-01-13 07:27:04', 12.00, 12, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '76943f0e9d5094ed495f4369ae073c2e', NULL, NULL, '5.136.183.99', '', 0, 0),
(314, 2, 4, '', '2016-01-13 07:47:40', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'aea506c4dabf15f3b78ceb4016c3e07c', NULL, NULL, '5.136.183.99', '', 0, 0),
(315, 2, 4, '', '2016-01-13 07:48:31', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7cdd9d8e0af42d4e990b25aba41a9deb', NULL, NULL, '5.136.183.99', '', 0, 0),
(316, 2, 4, '', '2016-01-13 07:49:58', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0881eaa567c82d6efb869671d4e6e00b', NULL, NULL, '5.136.183.99', '', 0, 0),
(317, 2, 4, '', '2016-01-13 07:52:28', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '45ced1a22bb4ac7e35aab9ba79847229', NULL, NULL, '5.136.183.99', '', 0, 0),
(318, 2, 4, '', '2016-01-13 07:52:36', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0311a99ba7fe020a601ebdd0a0f90180', NULL, NULL, '5.136.183.99', '', 0, 0),
(319, 2, 4, '', '2016-01-13 07:53:24', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4e2836dc1257f6bc937ce57c2a3e126e', NULL, NULL, '5.136.183.99', '', 0, 0),
(320, 2, 4, '', '2016-01-13 07:53:49', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ad6a6072b1df607cec824b577c162d05', NULL, NULL, '5.136.183.99', '', 0, 0),
(321, 2, 4, '', '2016-01-13 07:58:20', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'df44c756a99d84e6c1fe4347098f69f9', NULL, NULL, '5.136.183.99', '', 0, 0),
(322, 2, 4, '', '2016-01-13 08:00:22', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '677a00d05f47a55aa038bbe4afc7c7f1', NULL, NULL, '5.136.183.99', '', 0, 0),
(323, 2, 4, '', '2016-01-13 08:01:28', 0.50, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '8049274226343051d3aa806c9edc2f38', '4', NULL, '5.136.183.99', '', 0, 0),
(324, 2, 4, '', '2016-01-13 08:02:19', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '22ba9ec613d02e657c8167a9d61d0a6d', NULL, NULL, '5.136.183.99', '', 0, 0),
(325, 2, 4, '', '2016-01-13 08:02:32', 0.50, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'dd47f575b9abdabc0f70b19a61aadb4c', '4', NULL, '5.136.183.99', '', 0, 0),
(326, 2, 4, '', '2016-01-13 08:07:39', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c1db4a455a0315437517aaae8738a957', NULL, NULL, '5.136.183.99', '', 0, 0),
(327, 2, 4, '', '2016-01-13 08:08:56', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b491ac30d20fc1630ccb425ba5d80a08', NULL, NULL, '5.136.183.99', '', 0, 0),
(328, 2, 4, '', '2016-01-13 08:29:30', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'cc11b2406d2b9506dc6618b579f30b4d', NULL, NULL, '5.136.183.99', '', 0, 0),
(329, 2, 4, '', '2016-01-13 08:33:16', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7a04e798981fd2b5a3d6be0bd8dd3456', NULL, NULL, '5.136.183.99', '', 0, 0),
(330, 2, 4, '', '2016-01-13 08:35:23', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '619a74d1cecee06ed7e46bea321e1c87', NULL, NULL, '5.136.183.99', '', 0, 0),
(331, 2, 4, '', '2016-01-13 08:40:19', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7d05e29b3e56b6d4224bb46dac9c9ded', NULL, NULL, '5.136.183.99', '', 0, 0),
(332, 2, 4, '', '2016-01-13 08:40:53', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a9704253e1df528f13b31da9ac339a29', NULL, NULL, '5.136.183.99', '', 0, 0),
(333, 2, 4, '', '2016-01-13 09:02:14', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '5cd8c7d3bac37534b043b91fbae6c267', NULL, NULL, '5.136.183.99', '', 0, 0),
(334, 2, 4, '', '2016-01-13 09:02:40', 12.00, 12, 'yandex', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'e2de7d6de8b3919ed24411a1b4fc4ea3', NULL, NULL, '5.136.183.99', '', 0, 0),
(335, 2, 4, '', '2016-01-13 09:32:56', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '59a062e71f9d6f50a5c0adc55c68aa88', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(336, 2, 4, '', '2016-01-13 09:33:35', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '63fea03699b5287ad33a911305cf84f7', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(337, 2, 4, '', '2016-01-13 09:34:25', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e48954ca48f0ed2e02b27a40d93c0089', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(338, 2, 4, '1231231', '2016-01-13 09:56:22', 12.00, 12, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f07abc3dc9427aa5eb3730e3d89ed8f1', NULL, NULL, '5.136.183.99', '410013845110607', 0, 0),
(339, 2, 4, '1231231', '2016-01-13 11:28:00', 10.00, 10, 'yandex', 'baklan212121@gmail.com', NULL, 'Не оплачен', '6d637df38ab2ad529f404c18eff14391', NULL, NULL, '5.136.183.99', '410013845110607', 0, 0),
(340, 2, 4, '1231231', '2016-01-13 11:33:18', 10.00, 10, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '7c17fc0e37ae567acb72f02b30ada735', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(341, 2, 4, '1231231', '2016-01-13 11:35:17', 2.00, 2, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '942f664af9bc5a5789d6a2411ef94c12', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(342, 2, 4, '1231231', '2016-01-13 11:36:31', 10.00, 10, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'df356a6614d2f2c449385ed415078492', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(343, 2, 4, '1231231', '2016-01-13 12:01:18', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '68ba1019ffed797bb2663c5414209133', NULL, NULL, '5.136.183.99', 'Z235592820813', 0, 0),
(344, 2, 4, '1231231', '2016-01-13 12:45:50', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', '6d08cb28220945a5cc1bcf3d36e7ffd4', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(345, 2, 4, '1231231', '2016-01-14 07:37:45', 1.00, 1, 'wmr', 'support@desty-hacks.ru', NULL, 'Не оплачен', 'e8b2b625bef4a4ed8559443e29417a7e', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(346, 2, 4, '1231231', '2016-01-14 08:59:36', 10.00, 10, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c205f347981dadfc6ca6a4c02b031739', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(347, 2, 4, '1231231', '2016-01-14 08:59:45', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7069e17da3c437c10e6dc8fca156a3ef', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(348, 2, 4, '1231231', '2016-01-14 09:03:12', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'f9dfd7cf440933b39df81f95b641d1b3', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(349, 2, 4, '1231231', '2016-01-14 09:03:37', 1.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '4c6edb75d1100ab827e3f96c8c1ca32d', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(350, 2, 4, '1231231', '2016-01-14 09:03:59', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a7fc278847dfd022edc2280a27127bb5', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(351, 2, 4, '1231231', '2016-01-16 05:06:22', 10.00, 10, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '7805a0f006fbf9250a3d50f8b4f64665', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(369, 2, 4, '1231231', '2016-01-20 12:31:57', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '1d693164aa85c3d45119b11db870681b', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(370, 2, 4, '1231231', '2016-01-22 02:45:31', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ee9726b4f08eb0df5de03795f679e13b', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(371, 2, 6, 'dark_shoutbox', '2016-01-22 11:17:53', 60.00, 1, 'qiwi', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '90339d16576d85c6ddcac1108ea512bc', NULL, NULL, '5.136.183.99', '79835346641', 0, 0),
(372, 2, 4, '1231231', '2016-01-22 11:18:03', 1.00, 1, 'qiwi', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9ce9aca3fdcab0afa2addf49cfd32c0c', NULL, NULL, '5.136.183.99', '79835346641', 0, 0),
(373, 2, 11, 'Тестовый товар', '2016-01-23 06:33:31', 100.00, 2, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '784ba3602b08e2c67964f2a6e69261f9', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(374, 2, 11, 'Тестовый товар', '2016-01-23 06:49:42', 150.00, 3, 'qiwi', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3c7408a5792f0bb6166d7f81d5c4df45', NULL, NULL, '5.136.183.99', '79835346641', 0, 0),
(375, 2, 6, 'Тестовый товар #1', '2016-01-23 14:04:04', 60.00, 1, 'wmr', 'baklan212121@gmail.com', NULL, 'Не оплачен', '8b593dabb480f51e15fc1d706c6f9c97', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(376, 2, 6, 'Тестовый товар #1', '2016-01-24 09:47:20', 60.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd1274e6a0b98b594c43ff339f77425b6', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(377, 2, 5, 'Тестовый товар #3', '2016-01-25 13:19:50', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '34f4cd5ca2883a8a6c55d37cbae7af57', NULL, NULL, '5.136.183.99', 'R331770443226', 0, 0),
(378, 2, 9, 'Тестовый товар #6', '2016-01-25 13:43:16', 2.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'fcc697d17e37ae22846eb848dcad758d', NULL, NULL, '5.136.183.99', 'Z235592820813', 0, 0),
(379, 2, 5, 'Тестовый товар #3', '2016-01-25 13:43:33', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '74d9a6e97fa39d40f0539bbf36387450', NULL, NULL, '5.136.183.99', '410013845110607', 0, 0),
(380, 2, 8, 'Тестовый товар #5', '2016-01-26 11:47:55', 22.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '4619207e12ed199e617b8f621d6b2035', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(381, 2, 5, 'Тестовый товар #3', '2016-01-26 11:59:45', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e843703bbebc4c615c6e898ae6a298a9', NULL, NULL, '5.136.187.203', '410013845110607', 0, 0),
(382, 2, 4, 'Тестовый товар #4', '2016-01-26 12:20:24', 1.00, 1, 'wmr', 'nikis-2013@mail.ru', NULL, 'Не оплачен', 'fc0f2ffa12a2da622e95b684c9772bf8', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(383, 2, 5, 'Тестовый товар #3', '2016-01-27 07:45:50', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'd0f3cec7f69dbdb9add34f71d3f48a65', NULL, NULL, '5.136.187.203', '410013845110607', 0, 0),
(384, 2, 5, 'Тестовый товар #3', '2016-01-27 08:08:06', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b61e3db15615532dac72db2a4a59b14c', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(385, 2, 5, 'Тестовый товар #3', '2016-01-27 08:12:57', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '42a3cd310353950a83c719ae13669197', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(386, 2, 8, 'Тестовый товар #5', '2016-01-27 08:35:37', 2.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5e213171f0b6b8e27dad596cc596130d', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(387, 2, 5, 'Тестовый товар #3', '2016-01-27 08:50:53', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e1cba4bad5b786e743a19fb4ecb7152f', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(388, 2, 4, 'Тестовый товар #4', '2016-01-27 09:01:51', 1.00, 1, 'wmz', 'baklan212121@gmail.com', NULL, 'Не оплачен', '7478a9534997b8353866243388d891af', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(389, 2, 5, 'Тестовый товар #3', '2016-01-27 09:02:54', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '9c05d5a48df963eb7f2d041e701b784b', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(390, 2, 5, 'Тестовый товар #3', '2016-01-27 09:05:29', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b92ab6b2020878f0b7fb0d9d6cf67b77', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(391, 2, 4, 'Тестовый товар #4', '2016-01-27 10:55:27', 12.00, 12, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '38a74e40e3f4e13741d1f6531c20b0d2', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(392, 2, 5, 'Тестовый товар #3', '2016-01-27 11:10:15', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'bf5ae5acdebe2347712295c58c4ea5dc', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(393, 2, 5, 'Тестовый товар #3', '2016-01-28 05:52:33', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '61e5be72eb8e04d42d50235a818ba764', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(394, 2, 8, 'Тестовый товар #5', '2016-01-28 05:53:19', 22.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '55be4606f5a33b6a6960bc71df48e52c', NULL, NULL, '5.136.187.203', '410013845110607', 0, 0),
(395, 2, 5, 'Тестовый товар #3', '2016-01-31 09:40:52', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1963d9c20f1ae89eaeaefe8c7f28420b', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(396, 2, 8, 'Тестовый товар #5', '2016-01-31 09:47:17', 2.00, 1, 'wmz', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'f7aa9f3d206aeedb2efafb96ee129563', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(397, 2, 4, 'Тестовый товар #4', '2016-01-31 09:47:34', 1.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '16b20ff78138b2180ca1fd5895c64e7b', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(398, 2, 4, 'Тестовый товар #4', '2016-01-31 09:47:41', 1.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8d37ddb3d6794c6d2f6f81ea36945b6d', NULL, NULL, '5.136.187.203', '410013845110607', 0, 0),
(399, 2, 8, 'Тестовый товар #5', '2016-01-31 09:47:46', 22.00, 1, 'qiwi', 'baklan212121@gmail.com', NULL, 'Не оплачен', '9da95faf36daf2d267ea37347ebc59ba', NULL, NULL, '5.136.187.203', '79835346641', 0, 0),
(400, 2, 8, 'Тестовый товар #5', '2016-01-31 09:47:58', 2.00, 1, 'wmz', 'baklan212121@gmail.com', NULL, 'Не оплачен', '4ad53ca7c2f3e12a64876ae55b8b9db9', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(401, 2, 8, 'Тестовый товар #5', '2016-01-31 09:48:50', 2.00, 1, 'wmz', 'baklan212121@gmail.com', NULL, 'Не оплачен', '8733c5937ed1e8e71ac8eda2a5297bb5', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(402, 2, 4, 'Тестовый товар #4', '2016-01-31 09:49:30', 0.75, 1, 'qiwi', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '2888799411a96a5e0697ae80899f4271', '5', NULL, '5.136.187.203', '79835346641', 25, 0),
(403, 2, 4, 'Тестовый товар #4', '2016-01-31 09:50:00', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7fda85822860fa370dc5dac6d7e3f91c', NULL, NULL, '5.136.187.203', 'Z235592820813', 0, 0),
(404, 2, 4, 'Тестовый товар #4', '2016-01-31 09:50:07', 0.75, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8d4ba0615312fafa9f20c7d8e4176f82', '5', NULL, '5.136.187.203', 'Z235592820813', 25, 0),
(405, 2, 5, 'Тестовый товар #3', '2016-01-31 11:51:53', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '59917fafdf0ab985c66d337fc41fc3ee', NULL, NULL, '5.136.187.203', 'R331770443226', 0, 0),
(406, 2, 5, 'Тестовый товар #3', '2016-01-31 11:52:43', 0.75, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b0a81f9b394f247f90ee0c1a0322a893', '5', NULL, '5.136.187.203', 'Z235592820813', 25, 0),
(407, 2, 5, 'Тестовый товар #3', '2016-01-31 11:52:50', 18.75, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '00fd3262d1d2f18c812d0339863a2691', '5', NULL, '5.136.187.203', 'R331770443226', 25, 0),
(408, 2, 9, 'Тестовый товар #6', '2016-01-31 11:54:36', 1.50, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cf65c65f2448c36e006bcf5dd312e5fd', '5', NULL, '5.136.187.203', 'Z235592820813', 25, 0),
(409, 2, 5, 'Тестовый товар #3', '2016-01-31 12:28:46', 25.00, 1, 'yandex', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'cc43aa55fae11f9ecf7214e984893491', NULL, NULL, '5.136.187.203', '410013845110607', 0, 0),
(410, 3, 12, '123123123', '2016-02-02 08:41:19', 22.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '8659e94412d5f7918e077f77cf5d1ff2', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(411, 3, 12, '123123123', '2016-02-02 08:41:39', 22.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c2b5ce4e36a03ef74cff32bc4bee3049', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(412, 3, 12, '123123123', '2016-02-02 08:42:48', 11.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '41cccd108ddf3160cbb76da32ed4da1c', '6', NULL, '5.136.187.203', 'FreeKassa', 50, 0),
(413, 3, 12, '123123123', '2016-02-02 08:43:41', 11.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7de098922d269b58d374170e814591d8', '6', NULL, '5.136.187.203', 'FreeKassa', 50, 0),
(414, 3, 12, '123123123', '2016-02-02 08:50:19', 22.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'acbe4e826c68dd964cb81c1822858ae2', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(415, 3, 12, '123123123', '2016-02-02 08:57:14', 22.00, 1, '', 'baklan212121@gmail.com', NULL, 'Не оплачен', '5d72f2e8b0e67437375af01d9125a01e', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(416, 3, 12, '123123123', '2016-02-02 08:57:24', 22.00, 1, '', 'baklan212121@gmail.com', NULL, 'Не оплачен', '09045953fb0ffe7561ac6ba976ad35f1', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(417, 3, 12, '123123123', '2016-02-02 08:57:33', 22.00, 1, '', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'a804b79032633574861d2d57ec7c7772', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 0),
(418, 3, 12, '123123123', '2016-02-02 08:57:43', 11.00, 1, '', 'baklan212121@gmail.com', NULL, 'Не оплачен', '5f4e3ec1fb17e8228a8eb408bada259e', '6', NULL, '5.136.187.203', 'FreeKassa', 50, 0),
(419, 3, 12, '123123123', '2016-02-02 09:13:57', 22.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '5e2da7cc3accff1d7715e3f859bd6398', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 17),
(420, 3, 13, 'Steam - Случайный аккаунт', '2016-02-02 12:14:14', 49.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '2886412b2b88bda67b120196a759c8d0', NULL, NULL, '136.243.38.151', 'FreeKassa', 0, 18),
(421, 3, 12, 'MineCraft - Лицензия', '2016-02-02 13:12:00', 20.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', 'c0c7c21269d0aef79e6b7db0a6443e84', NULL, NULL, '136.243.38.151', 'FreeKassa', 0, 17),
(422, 3, 12, 'MineCraft - Лицензия', '2016-02-02 13:19:47', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c8e2bf7c982fec9f8935a0fb330a2519', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 17),
(423, 3, 12, 'MineCraft - Лицензия', '2016-02-02 13:33:04', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '8b1eec6d99eaef00065dbd7c9656899b', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 17),
(424, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:11:03', 0.50, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', 'fbb83230ef6d02330c6133d25bcbee90', '6', NULL, '136.243.38.149', 'FreeKassa', 50, 17),
(425, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:38:24', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '71c5ddae1a1ae2cf0a544e5b25ad20be', NULL, NULL, '136.243.38.151', 'FreeKassa', 0, 17),
(426, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:45:36', 2.00, 2, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '99b6adf9c054295737439b10d56ae72f', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 17),
(427, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:45:47', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'acdb3ec054c969f538af9a38928dea38', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 17),
(428, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:47:42', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '07998a38886d19a6479ca92ac96ab05e', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 17),
(429, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:56:05', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '03d77f9381eb1b23c908b3eef0e6491a', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 17),
(430, 3, 12, 'MineCraft - Лицензия', '2016-02-03 09:57:44', 1.00, 1, '', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '5c114642190ad9ac3172b008176e51ea', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 17),
(431, 3, 12, 'MineCraft - Лицензия', '2016-02-03 11:30:17', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e7677957654c122c2aae75fffbfb40e3', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 19),
(432, 3, 13, 'Steam - Случайный аккаунт', '2016-02-03 11:32:29', 98.00, 2, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ba12a022927688049637e803e48f9b5c', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 20),
(433, 3, 13, 'Steam - Случайный аккаунт', '2016-02-03 11:33:49', 98.00, 2, 'freekassa', 'baklan212121@gmail.com', NULL, 'Не оплачен', 'b7276c87f443d0b279d8f8c9b1a351f1', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 21),
(434, 3, 13, 'Steam - Случайный аккаунт', '2016-02-03 11:36:45', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6372e1550f0ccc5069a05e009fa87da1', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 21),
(435, 3, 13, 'Steam - Случайный аккаунт', '2016-02-03 11:37:31', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '73622961a430de7e3e850688fd4f620f', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 21),
(436, 3, 13, 'Steam - Случайный аккаунт', '2016-02-03 11:46:13', 49.00, 1, 'freekassa', 'support@desty-hacks.ru', NULL, 'Не оплачен', 'ca33fba8e07e111522dae022cf564c54', NULL, NULL, '5.136.187.203', 'FreeKassa', 0, 21),
(437, 3, 12, 'MineCraft - Лицензия', '2016-02-04 09:17:34', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e9117343505e3bf463ab009e9a83d8b6', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(438, 3, 12, 'MineCraft - Лицензия', '2016-02-04 09:39:33', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '7719208fde3677afac7cf82193926568', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 21),
(439, 3, 12, 'MineCraft - Лицензия', '2016-02-04 09:52:06', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '1bd304035ed2772df1151a710f7412a8', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 21),
(440, 3, 12, 'MineCraft - Лицензия', '2016-02-04 10:29:36', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Оплачен', '1fce84701e2c7956ce2ffcb95455b387', NULL, NULL, '136.243.38.150', 'FreeKassa', 0, 21),
(441, 3, 12, 'MineCraft - Лицензия', '2016-02-04 10:35:44', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'ce45a26e4429517528916defca9dc454', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(442, 3, 12, 'MineCraft - Лицензия', '2016-02-04 10:38:23', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '3b496a819f6f66a6f208eb33cf838736', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(443, 3, 12, 'MineCraft - Лицензия', '2016-02-04 10:40:36', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'a992b1586d470ba55611db547fb04cb1', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(444, 3, 12, 'MineCraft - Лицензия', '2016-02-04 10:41:23', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '047434ed5764fdbfeb252f9ec37ef238', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(445, 2, 5, 'Тестовый товар #3', '2016-02-04 11:25:49', 25.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6db9665912d6781fa0866a7bb7437420', NULL, NULL, '5.136.142.66', 'R331770443226', 0, 0),
(446, 3, 13, 'Steam - Случайный аккаунт', '2016-02-09 03:16:02', 49.00, 1, 'freekassa', 'baklan212121@gmail.com', NULL, 'Не оплачен', '1cf54e8ade01a892c837dacf2f119112', NULL, NULL, '5.136.142.66', 'FreeKassa', 0, 21),
(447, 2, 5, 'Тестовый товар #3', '2016-02-10 08:02:22', 1.00, 1, 'wmz', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6879bd2827856200539ba2b6b0bca7dc', NULL, NULL, '5.136.142.66', 'Z235592820813', 0, 0),
(448, 2, 9, 'Тестовый товар #6', '2016-02-10 09:21:37', 2.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'c96076cc79d79b8050b9479e33d1c869', NULL, NULL, '5.136.142.66', 'R331770443226', 0, 0),
(449, 2, 8, 'Тестовый товар #5', '2016-02-10 09:22:53', 22.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '19b68c6dba2f70c4485184e7630d5268', NULL, NULL, '5.136.142.66', 'R331770443226', 0, 0),
(450, 2, 9, 'Тестовый товар #6', '2016-02-13 08:14:12', 2.00, 1, 'wmr', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'e6ae6350a3ef5243380d5938e1de4854', NULL, NULL, '5.136.142.66', 'R331770443226', 0, 0),
(451, 3, 13, 'Steam - Случайный аккаунт', '2016-02-25 05:15:03', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '657ff0094a826f75881ba218d9ee2caa', NULL, NULL, '5.136.186.232', 'FreeKassa', 0, 1),
(452, 3, 13, 'Steam - Случайный аккаунт', '2016-02-28 04:43:53', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '1b0a887c5dfa27dddee2e9e2b50096c8', NULL, NULL, '5.136.186.232', 'FreeKassa', 0, 1),
(453, 3, 13, 'Steam - Случайный аккаунт', '2016-03-04 12:42:41', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '7ae2b4f40b30ead60c464139bd02e093', NULL, NULL, '5.136.167.210', 'FreeKassa', 0, 1),
(454, 3, 12, 'MineCraft - Лицензия', '2016-03-04 14:14:24', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '5cc98d136eaa537c6693e39660a9aaee', NULL, NULL, '5.136.167.210', 'FreeKassa', 0, 1),
(455, 3, 13, 'Steam - Случайный аккаунт', '2016-03-05 08:45:29', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'dae5a71a390e243e0aa7ed1e39ca6eaa', NULL, NULL, '5.136.167.210', 'FreeKassa', 0, 1),
(456, 3, 13, 'Steam - Случайный аккаунт', '2016-03-06 04:02:21', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '575df61b033d0db73286248c3df56f44', NULL, NULL, '5.136.167.210', 'FreeKassa', 0, 1),
(457, 3, 17, 'Тестовый товар', '2016-03-06 04:02:54', 267.00, 3, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'aa2279db111666e0b3239b6974cc5af1', NULL, NULL, '5.136.167.210', 'FreeKassa', 0, 1),
(458, 3, 12, 'MineCraft - Лицензия', '2016-03-07 13:27:29', 1.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', 'b0aea289759d8e74d820e56ff323231e', NULL, NULL, '5.136.161.249', 'FreeKassa', 0, 1),
(459, 3, 13, 'Steam - Случайный аккаунт', '2016-03-07 13:29:18', 147.00, 3, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '0719e50e4f467461a66808a20531642f', NULL, NULL, '5.136.161.249', 'FreeKassa', 0, 1),
(460, 3, 13, 'Steam - Случайный аккаунт', '2016-03-08 13:19:06', 49.00, 1, 'freekassa', 'nikita.karpov.1910@mail.ru', NULL, 'Не оплачен', '6d636bcaa6633926b8887d55d857d800', NULL, NULL, '5.136.161.249', 'FreeKassa', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders_return`
--

CREATE TABLE IF NOT EXISTS `orders_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orders` int(11) NOT NULL,
  `obj_all` int(11) NOT NULL,
  `obj_given` int(11) NOT NULL,
  `obj_notgiven` int(11) NOT NULL,
  `sum_return` decimal(19,2) NOT NULL,
  `sum_type` enum('wmr','wmz','yandex','qiwi') NOT NULL,
  `status` enum('Не обработано','Обработано') NOT NULL DEFAULT 'Не обработано',
  PRIMARY KEY (`id`),
  KEY `FK_orders_return_orders_id` (`id_orders`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `id_shop`, `prefix`, `name`, `content`) VALUES
(1, 3, 'name', 'Название самой страницы', '<font color="red">Азазаза123123123</font>'),
(2, 3, 'test2', 'Тестовая страница №2', 'Свято-Тихвинский Богородицкий монастырь(Бузулукский Тихвинский Богородицкий монастырь)  — православный женский монастырь Бузулукской епархииРусской православной церкви, расположенный в городеБузулуке. Первая по времени основания обитель Оренбуржья, основанная как женская религиозная община в 1847 году. В 1860 году община была преобразована в женский общежительный монастырь, в котором к началу XX века проживало около 400 монахинь и послушниц, действовало училище, больница, иконописная и золотошвейная мастерские, богослужения совершались в трёх храмах.\r\n\r\nПосле установления советской власти, в 1922 году, у монастыря были конфискованы все ценные предметы церковной утвари, а в январе 1929 года монастырь был закрыт. Монастырские здания переходили к различным учреждениям, одно время в них размещалась пересыльная тюрьма, в которой проводились расстрелы, в том числе местного духовенства.\r\n\r\nАрхитектурный комплекс сравнительно хорошо сохранился, утратив лишь деревянный храм и колокольню, но, несмотря на то, что в 2000 году монастырь был воссоздан, его прежняя территория ему не принадлежит. Воссозданный монастырь располагается неподалёку, в настоящее время в нём проживает немногим более 20 монашествующих.');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_freekassa`
--

CREATE TABLE IF NOT EXISTS `payment_freekassa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `id_shop_fk` varchar(255) NOT NULL,
  `secret1` varchar(255) NOT NULL,
  `secret2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `payment_freekassa`
--

INSERT INTO `payment_freekassa` (`id`, `id_shop`, `id_shop_fk`, `secret1`, `secret2`) VALUES
(1, 3, '22534', '4u4eipb9', 'do9od2t9');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_qiwi`
--

CREATE TABLE IF NOT EXISTS `payment_qiwi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_qiwi_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `payment_qiwi`
--

INSERT INTO `payment_qiwi` (`id`, `id_shop`, `login`, `password`) VALUES
(1, 2, '79835346641', 'qiwipass641');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_webmoney`
--

CREATE TABLE IF NOT EXISTS `payment_webmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `wmid` varchar(255) NOT NULL,
  `wmr` varchar(255) NOT NULL,
  `wmz` varchar(255) NOT NULL,
  `key_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_webmoney_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `payment_webmoney`
--

INSERT INTO `payment_webmoney` (`id`, `id_shop`, `wmid`, `wmr`, `wmz`, `key_pass`) VALUES
(2, 2, '112205224170', 'R331770443226', 'Z235592820813', 'verysupermegapassword641');

-- --------------------------------------------------------

--
-- Структура таблицы `payment_yandex`
--

CREATE TABLE IF NOT EXISTS `payment_yandex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `token` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_yandex_shop_id` (`id_shop`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('Работает','Заблокирован','Выключен') NOT NULL,
  `catalog_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_position` (`catalog_position`),
  UNIQUE KEY `domain` (`domain`),
  KEY `FK_shop_user_id` (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`id`, `id_user`, `domain`, `date`, `status`, `catalog_position`) VALUES
(6, 19, 'demo', '2017-03-09 00:00:00', 'Работает', 0),
(3, 19, 'prohost24.ru', '2016-08-17 08:10:28', 'Работает', -2),
(5, 19, 'desty-hacks.ru', '2016-07-27 12:23:33', 'Работает', -3);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_payments`
--

CREATE TABLE IF NOT EXISTS `shop_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `count` varchar(255) NOT NULL,
  `sum` decimal(19,2) NOT NULL,
  `paymethod` enum('wmz','wmr','qiwi','F-K') NOT NULL,
  `type` enum('Регистрация','Продление','Подъём в каталоге') NOT NULL,
  `status` enum('Не оплачен','Оплачен') NOT NULL,
  `domain` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_shop_payments_user_id` (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=67 ;

--
-- Дамп данных таблицы `shop_payments`
--

INSERT INTO `shop_payments` (`id`, `id_user`, `count`, `sum`, `paymethod`, `type`, `status`, `domain`, `timestamp`) VALUES
(2, 19, '1', 10.00, 'wmr', 'Регистрация', 'Оплачен', 'demo', '2015-12-27 03:02:35'),
(14, 19, '1', 10.00, 'wmr', 'Регистрация', 'Оплачен', 'prohost24.ru', '2016-01-15 08:21:01'),
(28, 19, '6', 42.00, 'wmr', 'Регистрация', 'Оплачен', 'desty-hacks.ru', '2016-01-23 09:23:33'),
(29, 19, '1', 10.00, 'wmr', 'Продление', 'Оплачен', 'demo', '2016-01-27 07:34:50'),
(35, 19, '1', 1.00, 'F-K', 'Регистрация', 'Оплачен', 'azazaz', '2016-02-09 04:13:59'),
(36, 19, '1', 1.00, 'F-K', 'Регистрация', 'Оплачен', 'jonhcena', '2016-02-09 04:19:10'),
(66, 19, '1', 49.00, 'wmr', 'Продление', 'Не оплачен', 'prohost24.ru', '2016-03-06 06:31:44'),
(56, 19, '6', 42.00, 'wmr', 'Продление', 'Оплачен', 'prohost24.ru', '2016-02-25 05:10:28');

-- --------------------------------------------------------

--
-- Структура таблицы `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `meta_title` text,
  `meta_description` text,
  `meta_keywords` text,
  `meta_favicon` text,
  `logo` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `texts_above` text,
  `texts_below` text,
  `texts_scripts` text,
  `template` enum('deer','light','lequeshop','BlackRed','MinKex','Assel') NOT NULL DEFAULT 'deer',
  `vk` varchar(255) NOT NULL,
  `soglas` varchar(255) NOT NULL,
  `support` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_template_shop_id` (`id_shop`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `template`
--

INSERT INTO `template` (`id`, `id_shop`, `meta_title`, `meta_description`, `meta_keywords`, `meta_favicon`, `logo`, `background`, `texts_above`, `texts_below`, `texts_scripts`, `template`, `vk`, `soglas`, `support`) VALUES
(2, 2, 'Тестовый магазин', 'Тестовый магазин', 'Тестовый магазин', 'http://iconizer.net/files/3D_Shapes/thumb/128/ball-6x6.png', '', '', NULL, NULL, NULL, 'MinKex', '', '', ''),
(3, 3, 'ProHost24.Ru', NULL, NULL, NULL, '/style/shop/css/templates/Assel/images/h-logo.png', '/style/shop/css/templates/Assel/images/bg.jpg', NULL, NULL, NULL, 'light', '', '', ''),
(5, 5, '123123123', NULL, NULL, NULL, '', '', NULL, NULL, NULL, 'BlackRed', '', '', ''),
(6, 6, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 'MinKex', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_list`
--

CREATE TABLE IF NOT EXISTS `tickets_list` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` enum('Без ответа','Отвечен','Закрыта') NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `secret` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tickets_message`
--

CREATE TABLE IF NOT EXISTS `tickets_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `message` text NOT NULL,
  `creator` enum('Юзер','Админ') NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  `privalages` enum('Юзер','Админ','Техподдержка') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `secret_key`, `email`, `contacts`, `privalages`) VALUES
(19, 'Desty', 'a45734c01436300f8d96f65ed1c3bb65', '57ae0036717eff879c3b8809d16a2f1e', 'nikita.karpov.1910@mail.ru', 'doure.karpov', 'Админ'),
(31, 'Hacking', 'a45734c01436300f8d96f65ed1c3bb65', '57ae0036717eff879c3b8809d16a2f1e', '12312312@nail.ru', NULL, 'Юзер');

-- --------------------------------------------------------

--
-- Структура таблицы `user_log`
--

CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `work` varchar(255) NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- Дамп данных таблицы `user_log`
--

INSERT INTO `user_log` (`id`, `user_id`, `work`, `data`, `ip`, `browser`) VALUES
(147, 19, 'Авторизация', '2016-02-27 10:22:36', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(148, 19, 'Авторизация', '2016-02-27 14:24:11', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(149, 19, 'Авторизация', '2016-02-28 03:08:38', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(150, 19, 'Авторизация', '2016-02-28 07:33:30', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(144, 19, 'Авторизация', '2016-02-27 04:16:25', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(151, 19, 'Авторизация', '2016-02-28 12:40:36', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(143, 19, 'Авторизация', '2016-02-26 13:47:52', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(145, 19, 'Авторизация', '2016-02-27 04:46:50', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(146, 19, 'Авторизация', '2016-02-27 08:30:45', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(152, 19, 'Авторизация', '2016-02-29 12:32:32', '141.101.81.118', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(153, 19, 'Авторизация', '2016-03-03 08:38:26', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(154, 19, 'Авторизация', '2016-03-04 07:53:51', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(155, 19, 'Авторизация', '2016-03-04 13:26:32', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(156, 19, 'Авторизация', '2016-03-04 14:21:46', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(157, 19, 'Авторизация', '2016-03-05 08:13:05', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(158, 19, 'Авторизация', '2016-03-05 10:49:35', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(159, 19, 'Авторизация', '2016-03-06 01:31:29', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(160, 19, 'Авторизация', '2016-03-06 02:39:40', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(161, 19, 'Авторизация', '2016-03-06 06:17:42', '141.101.81.109', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36'),
(162, 19, 'Авторизация', '2016-03-07 01:43:05', '141.101.81.62', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
