<html>
	<head>
		<title>
			<g:layoutTitle default="三蘆關懷會館" />
		</title>
		<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/jqgrid/css',file:'ui.jqgrid.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />
		<script src="${resource(dir:'js/jquery',file:'jquery-1.6.1.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.min.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/jqgrid/js/i18n',file:'grid.locale-en.js')}"></script>
		<script src="${resource(dir:'js/jquery/plugins/jqgrid/js',file:'jquery.jqGrid.src.js')}"></script>
		<script src="${resource(dir:'js/function',file:'chineseCalendar.js')}"></script>
		<script src="${resource(dir:'js/base',file:'base.js')}"></script>
		<script type="text/javascript">
		    var contextRoot = "${request.contextPath}";
			var responseJSON = ${rjson};
       </script>
		<g:layoutHead />
			<!--<g:javascript library="application" />-->
			<style>
			</style>
	</head>
	<body>
		<div id="body">
			<header>
			</header>
			<section>
				<g:layoutBody />
			</section>
		</div>
	</body>
</html>