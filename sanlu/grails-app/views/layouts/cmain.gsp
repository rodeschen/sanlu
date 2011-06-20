<!DOCTYPE html>
<html>
	<head>
		<title>
			<g:layoutTitle default="行事曆" />
		</title>
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'calendar.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'dp.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.css')}"/>
		<script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery-1.6.1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/ui',file:'jquery-ui-1.8.12.custom.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'datepicker_lang_HK.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'jquery.datepicker.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'wdCalendar_lang_HK.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'jquery.calendar.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/jquery/plugins/fancybox',file:'jquery.fancybox-1.3.4.js')}"></script>
		<script src="${resource(dir:'js/function',file:'chineseCalendar.js')}"></script>
		<g:layoutHead/>
			<g:javascript library="application" />
				<script type="text/javascript">
					var contextRoot = "${request.contextPath}";
					var responseJSON = ${rjson};
				</script>
	</head>
	<body>
		<g:layoutBody/>
	</body>
</html>