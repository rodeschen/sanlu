<%@ page import="org.grails.plugins.jquery.calendar.domain.CalendarEventType" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<jqueryCalendar:monthResources />
</head>

<body>
<div id="message" class="ui-corner-all"></div>
<g:select
        name="eventType"
        from="${CalendarEventType.list()}"
        optionKey="id"
        noSelection="['': message(code: 'view.calendarEvent.eventType.choose')]"
        valueMessagePrefix="calendarEventType" />

<jqueryCalendar:month
        year="${year}"
        data="javascript:function(start, end, callback) {filterMonthSource(start, end, callback);}"
        month="${month}"
        weekStart="${1}"
        draggable="${true}"
        readonly="${readOnly}"
        fixedWeeks="${true}"
        abbrevDayHeadings="${false}"
        title="${true}"
        showTime="guess" />
<script type="text/javascript">
    function filterMonthSource(start, end, callback) {
         var data = {
            'start': start.getTime(),
            'end': end.getTime(),
            'eventType': $('#eventType').val()
        }
        var tmpCallback = function(result) {
            if (result.length > 0) {
                hideMessage();
            } else {
                monthNoEvents();
            }
            callback(result);
        }
        $.post($MONTH_URL['events'], data, tmpCallback, "json");
    }

    $("#eventType").change(function() {
        $monthCalendar.fullCalendar("refresh");
    });
</script>

</body>
</html>