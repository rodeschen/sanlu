package tw.com.sanlu


import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import tw.com.sanlu.annotation.GridQuery;


class CalendarController extends GridController {

	def callist = {
	}

	def index = {
		[rjson : params.responseJSON.toString()]
	}

	def list = {
		params.put("data" , params.get("data") || "")
	}

	def add ={
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def project1 = Project.findByProjectName("projectName")
		def emp2 = session.employee
		def hall = Product.findByProductName("大忠廳")
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

	def updatechdate={
		def date = ChineseDateStatus.findByDate(params.date)
		if(date){
			date.properties = params
			date.save()
		}else{
			date = new ChineseDateStatus(params).save()
		}
		render date as JSON
	}

	def querychdatestatus ={
		def dates = ChineseDateStatus.findAllByDateBetween(params.start,params.end)
		def res = [:]
		dates?.each(){
			res[it.date] = it.dateStatus
		}
		render res as JSON
	}

	def query={
		def startAndEnd = calCalendar();
		//def billDetails = BillDetail.findAllByStartTimeBetween(startAndEnd.start,startAndEnd.end)
		def bList = BillDetail.createCriteria()
		def billDetails = bList.list{
			and{
				between('startTime',startAndEnd.start,startAndEnd.end)
				if(params.type == 'p'){
					project{ eq('id',params.id?params.long("id"):"") }
				}else if (params.type == "l"){
					place{ eq('id',params.id?params.long("id"):"") }
				}
			}
		}
		//if(BillDetail.hasErrors()){
		//	println bList.errors;
		//}
		//def billDetails = BillDetail.findAllByStartTimeBetween(startAndEnd.start,startAndEnd.end)
		def events = []
		def event
		def cal1 = Calendar.getInstance();
		def cal2 = Calendar.getInstance();
		for (billDetail in billDetails){
			//[id,text,startDate,endDate,isallday,crossday,recurring,color,editable,local,?]
			event = []
			event.add billDetail.id               //oid
			event.add billDetail.product.productName      //description
			event.add billDetail.startTime        //startTime
			event.add billDetail.endTime          //endTime
			event.add 0                           //isAllDay 0 1
			//multiDay
			cal1.setTime billDetail.startTime
			cal1.set Calendar.HOUR_OF_DAY, 0
			cal1.set Calendar.MINUTE, 0
			cal1.set Calendar.SECOND, 0
			cal2.setTime billDetail.endTime
			cal2.set Calendar.HOUR_OF_DAY, 0
			cal2.set Calendar.MINUTE, 0
			cal2.set Calendar.SECOND, 0
			event.add cal2.compareTo(cal1) > 0 ?1:0//crossday (multiDay) 0 1
			event.add 0                           // recurring 0 1
			event.add billDetail.color            // color 0..21
			event.add 0                           // editable 0 1
			event.add billDetail.place?.placeName        //location
			event.add billDetail.project.projectName                         //people(String)
			events.add event
		}
		def res = ["events":events,
					"issort":true,
					"start":Utility.dateToString(startAndEnd.start,"yyyy-MM-dd HH:mm:ss")
					,"end":Utility.dateToString(startAndEnd.end,"yyyy-MM-dd HH:mm:ss")
					,"error":null]
		//response.status HttpServletResponse.SC_INTERNAL_SERVER_ERROR
		//render(status: 400, contentType:"text/json", text: res)
		render res as JSON
	}

	private def calCalendar = {
		def showDay = Utility.stringToDate(params.showdate, "yyyy-MM-dd")
		def cal = Calendar.getInstance()
		cal.setTime showDay
		cal.setFirstDayOfWeek Calendar.MONDAY;
		def res = [:]

		switch(params.viewtype){
			case "month":
				cal.set(Calendar.DAY_OF_MONTH, 1); // first day of month
				cal.set(Calendar.DATE, -7);
				res["start"] = cal.getTime()
				cal.add(Calendar.MONTH, 1); // next first day of month
				cal.add(Calendar.DATE, 14);
				res["end"] = cal.getTime()
				break
			case "week":
				cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); // monday
				res["start"] = cal.getTime()
				cal.add(Calendar.DATE, 7);  // last monday
				res["end"] = cal.getTime()
				break
			default:
				res["start"] = cal.getTime()
				cal.add(Calendar.DATE, 1);//next day
				res["end"] = cal.getTime()
				break
		}
		System.out.println res;
		return res
	}

	def commmCal = {
		[rjson : params.responseJSON.toString()]
	}

	def queryCal={
		def startAndEnd = calCalendar();
		//def billDetails = BillDetail.findAllByStartTimeBetween(startAndEnd.start,startAndEnd.end)
		def cData = CalendarData.createCriteria()
		def calDetails = cData.list{
			and{
				eq("type",params.type)
				between('startTime',startAndEnd.start,startAndEnd.end)
			}
		}
		//if(BillDetail.hasErrors()){
		//	println bList.errors;
		//}
		//def billDetails = BillDetail.findAllByStartTimeBetween(startAndEnd.start,startAndEnd.end)
		def events = []
		def event
		def cal1 = Calendar.getInstance();
		def cal2 = Calendar.getInstance();
		for (calDetail in calDetails){
			//[id,text,startDate,endDate,isallday,crossday,recurring,color,editable,local,?]
			event = []
			event.add calDetail.id               //oid
			event.add calDetail.description      //description
			event.add calDetail.startTime        //startTime
			event.add calDetail.endTime          //endTime
			event.add 0                           //isAllDay 0 1
			//multiDay
			cal1.setTime calDetail.startTime
			cal1.set Calendar.HOUR_OF_DAY, 0
			cal1.set Calendar.MINUTE, 0
			cal1.set Calendar.SECOND, 0
			cal2.setTime calDetail.endTime
			cal2.set Calendar.HOUR_OF_DAY, 0
			cal2.set Calendar.MINUTE, 0
			cal2.set Calendar.SECOND, 0
			event.add cal2.compareTo(cal1) > 0 ?1:0//crossday (multiDay) 0 1
			event.add 0                           // recurring 0 1
			event.add 1            // color 0..21
			event.add 0                           // editable 0 1
			event.add ""        //location
			event.add ""                         //people(String)
			events.add event
		}
		def res = ["events":events,
					"issort":true,
					"start":Utility.dateToString(startAndEnd.start,"yyyy-MM-dd HH:mm:ss")
					,"end":Utility.dateToString(startAndEnd.end,"yyyy-MM-dd HH:mm:ss")
					,"error":null]
		//response.status HttpServletResponse.SC_INTERNAL_SERVER_ERROR
		//render(status: 400, contentType:"text/json", text: res)
		render res as JSON
	}


	@GridQuery
	def queryGridCal = {
		def data = CalendarData.findAllByType(params.type,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
		def cont = CalendarData.countByType(params.type)
		["rowData":data,"rowCount":cont,"format":["date":{str,bean-> return Utility.ADFormat.format(bean.startTime).substring(0,10)}]]
	}


	def addCal = {
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm")
		def calData = new CalendarData(
				type:"1",
				description : params.description,
				startTime : df.parse(params.startDate + " " + params.startHour + ":" + params.startMin),
				endTime : df.parse(params.endDate + " " + params.endHour + ":" + params.startMin),
				lastModifyBy: session.employee
				).save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
	
	def delCal = {
		CalendarData.findById(params.long("id")).delete()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
