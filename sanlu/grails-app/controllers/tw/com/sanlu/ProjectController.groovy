package tw.com.sanlu
import grails.converters.JSON
import grails.web.JSONBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat

import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery

/**
 * 專案清單
 * @author rick
 *
 */
class ProjectController extends GridController {


	def index = {
		[rjson : params.responseJSON.toString()]
	}
	@GridQuery
	def queryNonClose = {
		def rows=[]
		def rowCount = Project.countByClosingDateOrClosingDateIsNull(new Date())
		def projects = Project.findAllByClosingDateOrClosingDateIsNull(new Date(),[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])

		//format
		//return ["rowData":projects,"rowCount":rowCount,"format":["projectName":{str -> return "$str xxxxccc"}]]
		["rowData":projects,"rowCount":rowCount]
	}

	@GridQuery
	def queryDetail = {
		def rows=[]

		def bList = BillDetail.createCriteria()
		def rowCount = bList.count{
			project{
				eq('id',params.id?params.long("id"):"")
			}
		}

		bList = BillDetail.createCriteria()
		def projects = bList.list{
			project{
				eq('id',params.id?params.long("id"):"")
			}
			firstResult (startRow)
			maxResults(pageRows)
			if(sortBy){
				switch(sortBy){
					case "product.productName" :
						product{
							order("productName",isAsc?"asc":"desc")
						}
						break;
					case "place.placeName" :
						place{
							order("placeName",isAsc?"asc":"desc")
						}
						break;
					default:
						order(sortBy,isAsc?"asc":"desc")
				}
			}
		}
		def itemCount = 0,amount = 0,itemCount2 = 0
		projects?.each(){
			itemCount++
			itemCount2 += it.quantity
			amount += (it.modifiedPrice * it.quantity)
		}

		//format
		//return ["rowData":projects,"rowCount":rowCount,"format":["projectName":{str -> return "$str xxxxccc"}]]
		["rowData":projects,"rowCount":rowCount,format:["amount":{str , data -> return data.modifiedPrice * data.quantity},
				"useTime":{str,data->
					switch(data.product.costUnit){
						case 0:
							return Utility.ADFormat.format(data.startTime)
							break;
						case 3:
						case 4:
							return Utility.dateToString(data.startTime,"yyyy-MM-dd") + " ~ "+ Utility.dateToString(data.endTime,"yyyy-MM-dd");
							break;
						default:
							return Utility.ADFormat.format(data.startTime) + " ~ "+ Utility.ADFormat.format(data.endTime)
					}
				}],"userdata":[amount:amount,price:itemCount,quantity:itemCount2]]
	}

	def queryid = {
		def project = Project.findById(params.long("id"))
		def res = [:] <<
				[id:project.id,
					projectName:project.projectName,
					inDate:project.inDate?.format("yyyy-MM-dd"),
					inHour:project.inDate?.format("HH"),
					inMin: project.inDate?.format("mm"),
					funeralCompany:project.funeralCompany.id,
					funeraler:project.funeraler.id,
					employee:project.emp.empNo,
					contact:project.contact,
					contactPhone:project.contactPhone,
					contactAddrCity:project.contactAddrCity,
					contactAddrArea:project.contactAddrArea,
					contactAddr:project.contactAddr,
					memo:project.memo]

		render res as JSON
	}

	def addAction = {

		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def project = new Project();
		project.projectName = params.projectName
		project.funeralCompany = FuneralCompany.findById(params.long("funeralCompany"))
		project.funeraler = Funeraler.findById(params.long("funeraler"))
		project.emp = Employee.findById(params.long("employee"))
		project.inDate = df.parse(params.inDate + " " + params.inHour + ":" + params.inMin)
		project.save()
		if(project.hasErrors()){
			println project.errors;
		}

		def res = ["id" : project.id]
		render res as JSON
	}

	def updateAction = {
		def project = Project.findById(params.id)
		if(project){
			DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
			project.projectName = params.projectName
			project.funeralCompany = FuneralCompany.findById(params.long("funeralCompany"))
			project.funeraler = Funeraler.findById(params.long("funeraler"))
			project.emp = Employee.findById(params.long("employee"))
			project.inDate = df.parse(params.inDate + " " + params.inHour + ":" + params.inMin)
			project.contact = params.contact
			project.contactPhone = params.contactPhone
			project.contactAddrCity = params.contactAddrCity
			project.contactAddrArea = params.contactAddrArea
			project.contactAddr = params.contactAddr
			project.memo = params.memo
			project.save()
		}

		render [:] as JSON
	}

	def deleteAction = {
		def project = Project.findById(id)
		return project?project.delete():println("無法刪除")
	}
	def modifyAction={
		def project = Project.findById(id)
		if(!project) {
			return println("無法修改")
		}
		new JSONObject(params.get("data")).each(){
			switch( it.key ){
				case 'projectName':
					project.putAt it.key,it.value
					break
				case 'inDate':
				case 'outDate':
					project.putAt it.key,Utility.shortFormat.parse(it.value)
					break
				case 'sallingTotal':
				case 'total':
					project.putAt it.key,new BigDecimal( it.value)
					break
				default:
					break
			}
		}
		project.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
	//	product:flower,//
	//	startTime:new Date(111,5,8,10,00,00),//
	//	endTime:new Date(111,5,8,12,00,00),//
	//	quantity:10,
	//	price:550,//
	//	color:1,
	//	place:place8,
	//	modifiedPrice:500,
	//	costPrice:300,
	//	modifiedCostPrice:300,
	//	lastModifyBy:emp2,
	//	project:project1 //

	def addProduct={
		def type = params.type
		def detail= new BillDetail();
		detail.project = Project.findById(params.long("id"))
		def product = Product.findById(params.long("product" + type))
		detail.product = product
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def cal1 = Calendar.getInstance();
		def cal2 = Calendar.getInstance();
		switch(product.costUnit){
			case "0":
				detail.startTime = df.parse(params.startDate + " " + params.startHour + ":" + params.startMin)
				detail.endTime = detail.startTime
				break;
			case "1": //次(時間)
				detail.startTime = df.parse(params.startDate + " " + params.startHour + ":" + params.startMin)
				detail.endTime = df.parse(params.endDate + " " + params.endHour + ":" + params.startMin)
				cal1.setTime detail.startTime
				cal2.setTime detail.endTime
				if(cal2.compareTo(cal1) <= 0){
					return throwError("結束時間需大於開始時間");
				}
				break;
			case "2": //時
				def hour = 1000 * 60 * 60 * product.costRange
				detail.startTime = df.parse(params.startDate + " " + params.startHour + ":" + params.startMin)
				detail.endTime = df.parse(params.endDate + " " + params.endHour + ":" + params.startMin)
				cal1.setTime detail.startTime
				cal2.setTime detail.endTime
				if(cal2.compareTo(cal1) <= 0 || ((cal2.getTimeInMillis() - cal1.getTimeInMillis())%hour) != 0 ){
					return throwError("結束時間需大於開始時間 且 每次使用時間以 " + product.costRange + " 小時為單位");
				}
				break;
			case "3": //天
				def day = 1000 * 60 * 60 * 24 * product.costRange
				detail.startTime = df.parse(params.startDate + " 00:00")
				detail.endTime = df.parse(params.endDate + " 00:00")
				cal1.setTime detail.startTime
				cal2.setTime detail.endTime
				if(cal2.compareTo(cal1) <= 0 || ((cal2.getTimeInMillis() - cal1.getTimeInMillis())%hour) != 0 ){
					return throwError("結束日期需大於開始日期 且 每次使用時間以 " + product.costRange + " 天為單位");
				}
				break;
			case "4": //月
				detail.startTime = df.parse(params.startDate + " 00:00")
				cal1.setTime detail.startTime
				if((params.int("mouth") % product.costRange) != 0){
					return throwError("每次使用時間以 " + product.costRange + " 個月為單位");
				}
				cal1.add(Calendar.MONTH, params.int("mouth"))
				detail.endTime  = cal1.getTime();
				break;

		}


		def productHistory = new ProductHistory();
		switch(type){
			case "1":
				if(product.totalQuantity < params.int("amount1")){
					return throwError("目前剩餘庫存量:" + product.totalQuantity);
				}
				detail.quantity = params.int("amount1")
				product.totalQuantity -= detail.quantity
				detail.price = detail.product.sallingPrice
				detail.color = 1
				detail.modifiedPrice = detail.price
				detail.costPrice = product.costPrice
				detail.modifiedCostPrice = detail.costPrice

			// history
				new ProductHistory(
						product:product,
						project:detail.project,
						isPurchase:false,
						quantity:detail.quantity,
						date:detail.startTime,
						totalQuantity:product.totalQuantity,
						vendor:"",
						LastModifyBy: session.employee
						).save()
				break;
			case "2":
			//detail.startTime = df.parse(params.date2 + " " + params.hour2 + ":" + params.min2)
			//detail.endTime = detail.startTime
				detail.quantity = params.int("amount2")
				detail.price = product.sallingPrice
				detail.color = 2
				detail.modifiedPrice = detail.price
				detail.costPrice = product.costPrice
				detail.modifiedCostPrice = detail.costPrice


				new ProductHistory(
						product:product,
						project:detail.project,
						isPurchase:false,
						quantity:detail.quantity,
						date:detail.startTime,
						totalQuantity:0,
						vendor:params.vendor2,
						LastModifyBy: session.employee
						).save()
				break;
			case "3":
				def place = Place.findById(params.long("place3"))
				def link = ProductLinkPlace.findByProductAndPlace(detail.product,place)
				def hasUse = BillDetail.createCriteria().list{
					and{
						eq('place',place)
						gt('endTime',detail.startTime)
						lt('startTime',detail.endTime)

					}

				}
				if(hasUse.size()>0){
					return throwError("此時間場地使用中!!")
				}
			//detail.startTime = df.parse(params.startDate3 + " " + params.startHour3 + ":" + params.startMin3)
			//detail.endTime = df.parse(params.endDate3 + " " + params.endHour3 + ":" + params.endMin3)
				detail.quantity = 1
				detail.price = link.sallingPrice
				detail.color = 3
				detail.place = place
				detail.modifiedPrice = detail.price
				detail.costPrice = link.costPrice
				detail.modifiedCostPrice = detail.costPrice
				break;
			case "4":
				break;

		}
		detail.lastModifyBy = session.employee
		detail.save()
		if(detail.hasErrors()){
			println detail.errors
		}
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
