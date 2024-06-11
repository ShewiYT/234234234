<div class="container-fluid main-content">
	<div class="page-title">
		<h1>
            Наиболее частые задаваемые вопросы
		</h1>
	</div>
	<div class="row">
		<!-- FAQ Nav -->
		<div class="col-sm-3">
            <div class="list-group">
				<div class="nav">
					<a class="list-group-item" data-toggle="tab" href="#other">
						<p>
							<span class="badge">5</span>Общие вопросы
						</p>
						</a><a class="list-group-item" data-toggle="tab" href="#connectpay">
						<p>
							<span class="badge">3</span>Подключение платёжных систем
						</p>
						</a><a class="list-group-item" data-toggle="tab" href="#design">
						<p>
							<span class="badge">3</span>Все, что касается оформления
						</p>
						</a><a class="list-group-item" data-toggle="tab" href="#others">
						<p>
							<span class="badge">5</span>Прочее
						</p>
						</a><a class="list-group-item" href="/tickets/list/">
						<p>
							Связаться с Техподдержкой
						</p>
					</a>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="other" class="tab-pane fade in active">
				<div class="col-sm-9">
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#summa">
												<div class="caret pull-right"></div>
											Какова стоимость аренды магазина в Вашем сервисе?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="summa">
										<div class="panel-body">
											В нашем сервисе действуют следующие цены на аренду магазина:<br>
											1 месяц аренды - <strong>49</strong> рублей или <strong><?=round($cost[1]/$cost['dollar'], 2)?></strong> $<br>
											3 месяца аренды - <strong>132</strong> рубля или <strong><?=round($cost[3] * 3/$cost['dollar'], 2)?></strong> $<br>
											6 месяцев аренды - <strong>234</strong> рубля или <strong><?=round($cost[6] * 6/$cost['dollar'], 2)?></strong> $
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#create">
												<div class="caret pull-right"></div>
											Как мне создать магазин в Вашем сервисе?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="create">
										<div class="panel-body">
											Для начала Вам нужно пройти регистрацию. Пройти ее можно здесь: <strong><a target="_blank" href="/register/">КЛАЦ</a></strong>.<br>
											После того, как Вы зарегистрировались и авторизовались, Вам нужно создать Ваш первый магазин. Делается это так:<br><br>
											1. На странице, куда Вас перебросило после авторизации, Вы должны нажать на кнопку <strong>"Создать магазин"</strong>.<br>
											2. В появившемся окне придумываем будущий адрес для Вашего магазина.<br>
											3. Если у Вас есть свой домен и Вы хотите использовать его в качестве адреса для магазина, то в поле <strong>"Домен"</strong> впишите часть Вашего домена до точки, а в поле <strong>"Поддомен"</strong> остальную часть, включая точку!<br>
											4. Выберите наиболее подходящий для Вас метод оплаты магазина, а именно: <strong>WMR</strong>, <strong>WMZ</strong> или <strong>Free-Kassa</strong>.<br>
											5. После оплаты магазин будет создан автоматически!
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#domain">
												<div class="caret pull-right"></div>
											Как мне привязать свой домен к магазину?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="domain">
										<div class="panel-body">
											Если у Вас есть свой домен и Вы хотите использовать его в качестве адреса для магазина, то при создании магазина, в появившемся окне в поле <strong>"Домен"</strong> впишите часть Вашего домена до точки, а в поле <strong>"Поддомен"</strong> остальную часть, включая точку!<br>
											Также, в панели управления домена Вам необходимо сменить DNS на наши:<br/>
											<div class="code">
												NS: <strong>aria.ns.cloudflare.com</strong><br/>
												NS: <strong>guy.ns.cloudflare.com</strong>
											</div>
										</div>
									</div>
									<div class="panel">
										<div class="panel-heading">
											<div class="panel-title">
												<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#domainexit">
													<div class="caret pull-right"></div>
												Как мне привязать свой домен к уже существующему магазину?</a>
											</div>
										</div>
										<div class="panel-collapse collapse" id="domainexit">
											<div class="panel-body">
												На данный момент мы не предоставляем такой возможности, но в скором времени такая операция будет доступна всем пользователям!<br>
												Пока что единственный способ создать магазин с собственным доменом - указать свой домен при регистрации магазина.
											</div>
										</div>
									</div>
									<div class="panel">
										<div class="panel-heading">
											<div class="panel-title">
												<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#exit">
													<div class="caret pull-right"></div>
												Что Вы мне предоставите после оплаты?</a>
											</div>
										</div>
										<div class="panel-collapse collapse" id="exit">
											<div class="panel-body">
												После оплаты Вы получаете:<br><br>
												1. Полностью работоспособный готовый к работе магазин цифровых товаров.<br>
												2. Возможность подключить один из нескольких платёжных систем, таких как: <strong>Free-Kassa</strong>, <strong>InterKassa</strong> или же пользоваться <strong>уже встроенной в магазин системой оплаты</strong>.<br>
												3. Возможность выбрать любой дизайн для магазин из множества предоставленных нами или же заказать у нас индивидуальный шаблон.<br>
												И многое-многое другое.
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	  		<div id="connectpay" class="tab-pane fade in">
				<div class="col-sm-9">
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#connectwm">
												<div class="caret pull-right"></div>
											Как мне подключить приём ВебМани к моему магазину?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="connectwm">
										<div class="panel-body">
											Вам необходимо скачать программу <a href="http://www.webmoney.ru/rus/about/demo/download.shtml" target="_blank">Webmoney Keeper Classic</a>, авторизоваться(зарегистрироваться) в ней и создать ключ-файл: Инструменты - Параметры программы - Безопасность - Сохранить ключи в файл.
											Далее в настройках оплаты своего магазина указываете файл ключей и пароль от файла ключей (не от входа в webmoney).
											<br>
											<b>Если у вас не проходит авторизация со старым ключём, то его необходимо пересоздать.</b>
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#connectyad">
												<div class="caret pull-right"></div>
											Как мне подключить приём Яндекс.Деньги к моему магазину?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="connectyad">
										<div class="panel-body">
											В настройках оплаты своего магазина достаточно нажать кнопку "Подключить Яндекс.Деньги", вы будете перенаправлены в систему Яндекс.Деньги и должны будете разрешить нашему приложению смотреть историю переводов на ваш кошелек.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#connectfree">
												<div class="caret pull-right"></div>
											Как мне подключить платёжную систему ФриКасса к моему магазину?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="connectfree">
										<div class="panel-body">
											Для начала зарегистрируйтесь на сайте <a target="_blank" href="http://www.free-kassa.ru">FREE-KASSA.RU</a>.<br/>
											Далее, Вам необходимо зайти в настройки оплаты Вашего магазина и там перейти во вкладку "Free-Kassa".<br/>
											Там Вам нужно будет ввести ID магазина (В Системе Free-Kassa), Секретное слово 1 и Секретное слово 2.<br/>
											Для того, чтобы подробнее ознакомиться с настройкой магазина в системе Free-Kassa, нажмите кнопку "Как подключить Free-Kassa?" в настройках оплаты Вашего магазина.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="design" class="tab-pane fade in">
				<div class="col-sm-9">
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#designfooter">
												<div class="caret pull-right"></div>
											Как убрать надпись "Аренда онлайн магазина" в самом низу страницы?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="designfooter">
										<div class="panel-body">
											Данный копирайт не убирается/изменяется/перемещается ни при каких условиях. 
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#designunik">
												<div class="caret pull-right"></div>
											Могу ли я заказать у Вас уникальный дизайн для своего магазина?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="designunik">
										<div class="panel-body">
											Да, мы предоставляем такую возможность. Чтобы заказать такую услугу, свяжитесь с нами по нашим контактным данным.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#designexit">
												<div class="caret pull-right"></div>
											Могу ли я внести какие-либо правки в уже существующий дизайн, предоставляемый Вами, для своего магазина?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="designexit">
										<div class="panel-body">
											Да, можете, но Вам придется связаться с нами по нашим контактным данным и подробнее обсудить условия сделки.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="others" class="tab-pane fade in">
				<div class="col-sm-9">
					<div class="widget-container fluid-height">
						<div class="widget-content">
							<div class="panel-group" id="accordion">
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#others1">
												<div class="caret pull-right"></div>
											Возможна ли временная заморозка магазина, а после разморозить и продлить аренду на кол-во замороженных дней?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="others1">
										<div class="panel-body">
											Нет, такой возможности мы не предоставляем.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#others2">
												<div class="caret pull-right"></div>
											Возможно ли с вами сотрудничать? (Реклама Вашего сервиса)</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="others2">
										<div class="panel-body">
											Данный вопрос Вы можете обсудить по контактам, которые указаны на нашем сайте.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#others3">
												<div class="caret pull-right"></div>
											Что будет, если я не буду продлевать магазин?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="others3">
										<div class="panel-body">
											Если в течении 14 дней с момента блокировки магазина за неуплату аренды не поступает платежа, магазин и все его содержимое удаляется. Восстановить Ваши данные будет невозможно.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#others4">
												<div class="caret pull-right"></div>
											Возможен ли возврат денежных средств за оставшиеся дни аренды?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="others4">
										<div class="panel-body">
											Нет, мы не предоставляем возврат денежных средств за уже оплаченные услуги.
										</div>
									</div>
								</div>
								<div class="panel">
									<div class="panel-heading">
										<div class="panel-title">
											<a class="accordion-toggle collapsed" data-parent="#accordion" data-toggle="collapse" href="#others5">
												<div class="caret pull-right"></div>
											Как часто выходят обновления сервиса?</a>
										</div>
									</div>
									<div class="panel-collapse collapse" id="others5">
										<div class="panel-body">
											Обновления нашего сервиса выходят примерно раз в 1 месяц.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		