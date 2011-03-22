package tw.com.sanlu

import grails.converters.JSON


class CalendarController {

    def index = {
        redirect(action: "list", params: params)
    }


	
    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
 //       [calendarInstanceList: Calendar.list(params), calendarInstanceTotal: Calendar.count()]
    }
	
	def add ={
		def startTime = params.startTime
		def endTime = params.endTime
		System.out.println "XXXX"
		def res = ["IsSuccess" : false]
		render res as JSON
	}
}
