import org.grails.plugins.jquery.calendar.domain.CalendarEventType
import org.grails.plugins.jquery.calendar.domain.CalendarEvent

class BootStrap {

    def calendarService

    def init = {servletContext ->
        def eventTypes = ['conference', 'contest', 'exam', 'meeting'] 
        addEventTypes(eventTypes)
        addEvents(eventTypes)

        calendarService.securityDelegate = [
           getCurrentUser: {-> [id: 1]},
           isUserAllowedToCreateEvents: {-> true},
           isUserAllowedToEditEvent: {e -> true},
           isUserAllowedToDragEvent: {e -> true},
           isUserAllowedToCreateReminder: {e -> true}
       ]

        calendarService.mailDelegate = [
            sendReminder: {reminder ->  println 'reminder sent' },
        ]

    }

    def destroy = {
    }

    def addEventTypes(eventTypes) {
        if (!CalendarEventType.count()) {
            eventTypes.each {
                new CalendarEventType(name: it).save(failOnError: true)
            }
        }
    }

    def addEvents(eventTypes) {
        def DAYS = 20
        Calendar day = GregorianCalendar.instance
        day.set Calendar.MILLISECOND, 0
        day.set Calendar.SECOND, 0
        day.set Calendar.MINUTE, 0
        day.roll Calendar.DAY_OF_YEAR, -DAYS/2 as int
        
        DAYS.times {
            day.set Calendar.HOUR_OF_DAY, 14
            def startDate = day.time
            day.set Calendar.HOUR_OF_DAY, 16
            def endDate = day.time
            new CalendarEvent(
                    userID: 1,
                    name: "name #$it",
                    description: "description #$it",
                    location: "location #$it",
                    eventType: CalendarEventType.findByName(eventTypes[it % 4]),
                    startDate: startDate,
                    endDate: endDate
            ).save(failOnError: true)

            day.roll Calendar.DAY_OF_YEAR, 1
        }
    }

} 
