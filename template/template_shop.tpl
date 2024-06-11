<?php if (isset($_GET['shop_page']) == 'cash'): ?>
<html>
	<head>
		<title><?=$this->title?></title>
		<link rel="shortcut icon" href="/style/general/images/favicon.png" type="image/png">
		<link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/isotope.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/fullcalendar.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/wizard.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/select2.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/morris.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/datatables.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/datepicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/timepicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/colorpicker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/daterange-picker.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/typeahead.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/summernote.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/pygments.css" media="all" rel="stylesheet" type="text/css" />
		<link href="/style/general/2/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
		<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		<script src="/style/general/2/javascripts/bootstrap.min.js" type="text/javascript"></script>
		<meta charset="utf-8">
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("body").css("display", "none");
				$("body").fadeIn(800);
			});
		</script>
	</head>
	<body>
		<?=$this->controller?>
	</body>
</html>
<? else: ?>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width" />
		<title><?=$this->tpl_info['meta_title']?></title>
		<?php if (!empty($this->tpl_info['meta_description'])): echo '	<meta name="description" content="'.$this->tpl_info['meta_description'].'" />'."\n"; endif; ?>
		<?php if (!empty($this->tpl_info['meta_keywords'])): echo '	<meta name="keywords" content="'.$this->tpl_info['meta_keywords'].'" />'."\n"; endif; ?>
		<link rel="stylesheet" media="all" href="/style/shop/css/templates/<?=$this->tpl_info['template']?>/style.css?v=2.1" />
		<link rel="icon" type="image/png" href="<?php if (empty($this->tpl_info['meta_favicon'])): echo '/style/general/images/favicon.png'; else: echo $this->tpl_info['meta_favicon']; endif; ?>" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script src="/style/general/js/shop.js?v=1.1"></script>
		<script src="/style/shop/css/templates/lequeshop/js/bootstrap.js"></script>
		<script src="/style/general/js/jquery.toastmessage.js"></script>
		<link href="/style/general/css/jquery.toastmessage.css" rel="stylesheet" media="screen">
		<!-- Дизайн LequeShop -->
		<? if($this->tpl_info['template'] == 'lequeshop'):?>
			<title><?=$this->tpl_info['meta_title']?></title>
			<link rel="icon" type="image/png" href="<?php if (empty($this->tpl_info['meta_favicon'])): echo '/style/shop/css/templates/lequeshop/images/buy.png'; else: echo $this->tpl_info['meta_favicon']; endif; ?>" />
			<link href="http://imgscrcssjsdomainleque.lequeshop.ru/source/css/lblue/original_v3.css" rel="stylesheet" media="screen">
			<link href="/style/shop/css/templates/lequeshop/bootstrap-glyphicons.css" rel="stylesheet" media="screen">
		<? endif; ?>
		<!-- // Дизайн LequeShop -->
		<!-- Дизайн MinKex -->
		<? if($this->tpl_info['template'] == 'MinKex'): ?>
			<link rel="stylesheet" href="/style/shop/css/templates/MinKex/css/styles.css" type="text/css" media="screen, projection">
			<link rel="stylesheet" href="/style/shop/css/templates/MinKex/css/bootstrap.css" type="text/css" media="screen, projection">
		<? endif; ?>
		<!-- // Дизайн MinKex -->
		<!-- Дизайн BlackRed -->
		
	</head>
	<body>
		<?=$this->controller?>
		
		<?=$this->tpl_info['texts_scripts']?>
	</body>
</html>
<? endif; ?>