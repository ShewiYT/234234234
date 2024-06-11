            <? $db = $this->info_db; $get_user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id'])); ?>
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/">RENTSHOPS.RU</a>
                </div>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
				<li><a href="/"><i class="fa fa-home fa-fw"></i> Главная</a></li>
				
                </ul>
				<ul class="nav navbar-right navbar-top-links">
                    <li class="dropdown navbar-inverse">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> Оповещения <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <?=$get_user['login']?> <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="/profile/"><i class="fa fa-user fa-fw"></i> Личный кабинет</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/logout/"><i class="fa fa-sign-out fa-fw"></i> Выход</a>
                            </li>
                        </ul>
                    </li>
                </ul>
							<!-- /.navbar-top-links -->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="/"><i class="fa fa-home"></i> Главная</a>
                            </li>
                            <li>
                                <a href="/profile/"><i class="fa fa-user"></i> Личный кабинет</a>
                            </li>
                            <li>
                                <a href="/shops/"><i class="fa fa-desktop"></i> Ваши магазины</a>
                            </li>
                            <li>
                                <a href="/faq/"><i class="fa fa-info-circle"></i> FAQ</a>
                            </li>
							<li>
                                <a href="/about/"><i class="fa fa-question-circle"></i> О нашем сервисе</a>
                            </li>
							<li>
                                <a href="/tickets/list/"><i class="fa fa-envelope"></i> Техподдержка</a>
                            </li>
							<?php $user = $db->row("SELECT * FROM user WHERE id = ?", array($_SESSION['auth']['id']));
							if ($user['privalages'] != 'Юзер'): echo '<br><li><a href="/controlpanel/"><i class="fa fa-cubes"></i> <span>Панель управления</span></a></li>'; endif;?>
							<br>
							<script type="text/javascript" src="//vk.com/js/api/openapi.js?121"></script>

							<!-- VK Widget -->
							<div id="vk_groups"></div>
								<script type="text/javascript">
VK.Widgets.Group("vk_groups", {mode: 0, width: "250", height: "400", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 113747594);
</script>
						</ul>
                    </div>
                </div>
				</nav>