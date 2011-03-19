<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
       <!--   <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />-->
        <link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'calendar.css')}" />
        <link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'dp.css')}" />
        <link rel="stylesheet" href="${resource(dir:'js/jquery/plugins/wdcalendar/css',file:'main.css')}" />
        
        <script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery-1.5.1.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'datepicker_lang_HK.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'jquery.datepicker.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'wdCalendar_lang_HK.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jquery/plugins/wdcalendar',file:'jquery.calendar-r.js')}"></script>
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        <g:layoutBody />
    </body>
</html>