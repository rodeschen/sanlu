package test.plugin.jquerycalendar.controller

import org.grails.plugins.jquery.calendar.controller.CalendarController
import org.grails.plugins.jquery.calendar.domain.CalendarEvent
import org.grails.plugins.jquery.calendar.util.CalendarJSON

class TestController extends CalendarController {

    def events = {
        println 'events called'
        def from = paramToDate('start') ?: new Date()
        def to = paramToDate('end') ?: new Date()
        def eventTypeId = (params.eventType ?: 0) as Long

        log.debug "events: ${from} - ${to}"
        def allEvents = CalendarEvent.withCriteria {
            between('startDate', from, to)
            if (eventTypeId) {
                eventType {
                    idEq(eventTypeId)
                }
            }
        }
        def json = allEvents as CalendarJSON
        render json
    }
    
}
