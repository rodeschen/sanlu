<%@ page import="org.grails.plugins.jquery.calendar.domain.CalendarEventType" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<jqueryCalendar:weekResources />
</head>

<body>
<div id="message" class="ui-corner-all"></div>
<g:select
        name="eventType"
        from="${CalendarEventType.list()}"
        optionKey="id"
        noSelection="['': message(code: 'view.calendarEvent.eventType.choose')]"
        valueMessagePrefix="calendarEventType" />

<jqueryCalendar:week
        controller="test"
        date="${date}"
        data="javascript:function(start, end, callback) {filterWeekSource(start, end, callback);}"
        readonly="${readOnly}"
        allowCalEventOverlap="${true}"
        timeslotsPerHour="${4}"
        firstDayOfWeek="${1}"
        startHour="${8}"
        endHour="${18}"
        limitDisplay="${true}"
        height="${600}"/>

<script type="text/javascript">
    function filterWeekSource(start, end, callback) {
         var data = {
            'start': start.getTime(),
            'end': end.getTime(),
            'eventType': $('#eventType').val()
        }
        var tmpCallback = function(result) {
            if (result.length > 0) {
                hideMessage();
            } else {
                weekNoEvents();
            }
            callback(result);
        }
        $.post($WEEK_URL['events'], data, tmpCallback, "json");
    }

    $("#eventType").change(function() {
        $weekCalendar.weekCalendar("refresh");
    });
</script>
        
</body>
</html>