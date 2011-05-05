package tw.com.sanlu


import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat


class CalendarController {
	def index = {
		// redirect(action: "list", params: params)
	}



	def list = {
		//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		//       [calendarInstanceList: Calendar.list(params), calendarInstanceTotal: Calendar.count()]
	}

	def add ={
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def project1 = Project.findByProjectName("projectName")
		def emp2 = Employee.findByEmpNo("00002")
		def hall = Product.findByProductName("大忠廳")
		System.out.println params.startTime
		def cal= new BillDetail(
		product:hall,
		startTime:df.parse(params.startTime),
		endTime:df.parse(params.endTime),
		quantity:10,
		subtotal:550,
		modifySubtotal:500,
		lastModifyBy:emp2,
		project:project1
		)
		cal.save()
		//def startTime = params.startTime
		//def endTime = params.endTime

		def res = ["IsSuccess" : true]
		render res as JSON
	}


	def query={
		def res = ["events":[[11419,"go to dinner","05/07/2011 10:58","5/7/2011 18:52",0,0,0,4,0,"cccc"," cvcvcvcvc"]],"issort":true,"start":"05\u0002U+00811 00:00","end":"05\u00008U+00811 23:59","error":null]
		render res as JSON
	}
}
