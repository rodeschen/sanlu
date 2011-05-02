<html>
	<head>
		<title>
			<g:layoutTitle default="三蘆關懷會館" />
		</title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/jqgrid/css',file:'ui.jqgrid.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
		<script src="${resource(dir:'js/jquery',file:'jquery-1.5.2.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.min.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/jqgrid/js/i18n',file:'grid.locale-en.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/jqgrid/js',file:'jquery.jqGrid.src.js')}"></script>
		<script src="${resource(dir:'js/base',file:'base.js')}"></script>
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
			<nav>
				<ul id="nav">
					<li class="current">
						<a href="${request.contextPath}/main">首頁</a>
					</li>
					<li>
						<a href="#">報表</a>
					</li>
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
								<a href="#">員工管理</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<aside> <span>&gt;&gt;</span> 首頁 </aside>
			<section>
				<g:layoutBody />
			</section>
		</div>
	</body>
</html>