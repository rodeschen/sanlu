package tw.com.sanlu


import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat


class CalendarController {
    def index = {
        redirect(action: "list", params: params)
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
		
		def res = ["IsSuccess" : false]
		render res as JSON
	}
}
