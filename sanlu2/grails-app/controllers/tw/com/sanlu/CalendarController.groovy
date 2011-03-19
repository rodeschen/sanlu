package tw.com.sanlu


class CalendarController {

    def index = {
        redirect(action: "list", params: params)
    }


	
    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
 //       [calendarInstanceList: Calendar.list(params), calendarInstanceTotal: Calendar.count()]
    }
}
