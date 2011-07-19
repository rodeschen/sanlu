<html>
	<head>
		<title>
			<g:layoutTitle default="三蘆關懷會館" />
		</title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/jqgrid/css',file:'ui.jqgrid.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.css')}"/>
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/formValidator/css',file:'validationEngine.jquery.css')}"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
		<script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery-1.6.1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/jqgrid/js/i18n',file:'grid.locale-en.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/jqgrid/js',file:'jquery.jqGrid.src.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/function',file:'chineseCalendar.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/formValidator/languages',file:'jquery.validationEngine-tw.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/formValidator',file:'jquery.validationEngine.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/base',file:'base.js')}"></script>
		<g:layoutHead />
			<!--<g:javascript library="application" />-->
			<style>
			</style>
	</head>
	<body>
		<div id="body">
			<header>
			</header>
			<hr/>
			<g:if test="${session.empLevel}">
				<nav>
					<ul id="nav">
						<li class="current">
							<a href="${request.contextPath}/main">首頁</a>
						</li>
						<li>
							<a href="#">商品</a>
							<ul>
								<li>
									<a href="${request.contextPath}/manager/purchase">商品進貨</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">報表</a>
							<ul>
								<li>
									<a id="agency" href="#agencyDialog1">品項代叫報表</a>
								</li>
								<li>
									<a href="${request.contextPath}/excel/goods" target="_blank">商品提出明細</a>
								</li>
							</ul>
						</li>
						<g:if test="${session.empLevel.equals(1)}">
							<li>
								<a href="#">系統管理</a>
								<ul>
									<li>
										<a href="${request.contextPath}/manager/product">商品管理</a>
									</li>
									<li>
										<a href="${request.contextPath}/manager/funeralcompany">禮儀公司管理</a>
									</li>
									<li>
										<hr />
									</li>
									<li>
										<a href="${request.contextPath}/manager/employee">員工管理</a>
									</li>
								</ul>
							</li>
						</g:if>
						<li style="float:right;">
							<a id="logout" href="${request.contextPath}/login/logout">登出</a>
						</li>
						<li style="float:right;">
							姓名:${session.empName}
						</li>
					</ul>
				</nav>
				<aside>
					<span>&gt;&gt;</span> 首頁
				</aside>
			</g:if>
			<section>
				<g:layoutBody />
			</section>
			<div class="hide">
				<div id="agencyDialog1">
					<fieldset>
						<legend>
							品項代叫報表
						</legend>
						<g:form name="agencyForm" id="agencyForm" onsubmit="return false;" autocomplete="off" novalidate="novalidate">
							<div class="field-row">
								<span class="th1">報表日期：</span>
								<span>
									<input type="text"
									class="validate[required] date" id="exportDate" name="exportDate" size="10" />
								</span>
							</div>
							<div style="text-align: center;">
								<button id="agencyExport" type="button">
									確定
								</button>
								<button class="dialogClose" type="button">
									取消
								</button>
							</div>
						</g:form>
					</fieldset>
				</div>
			</div>
		</div>
	</body>
</html>