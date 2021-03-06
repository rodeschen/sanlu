package tw.com.sanlu
import grails.converters.JSON
import grails.web.JSONBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Calendar

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
	def queryProjects = {
		def rows=[]
		def rowCount
		def projects
		def pList = Project.createCriteria()
		if(params.closing == "N"){
			def cal1 = Calendar.getInstance();
			cal1.set(Calendar.HOUR, 0)
			cal1.set(Calendar.MINUTE, 0)
			cal1.set(Calendar.SECOND, 0)
			cal1.set(Calendar.MILLISECOND, 0)
			//			def where = "ClosingDateGreaterThanEqualsOrClosingDateIsNull";
			//			rowCount = Project."countBy${where}"(cal1.getTime())
			//			projects = Project."findAllBy${where}"(cal1.getTime(),[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
			rowCount = pList.count{
				isNull("deleter")
				or{
					ge("closingDate",cal1.getTime())
					isNull("closingDate")
				}
			}
			pList = Project.createCriteria()
			projects = pList.list{
				isNull("deleter")
				or{
					ge("closingDate",cal1.getTime())
					isNull("closingDate")
				}
				firstResult (startRow)
				maxResults(pageRows)
				if(sortBy){
					switch(sortBy){
						case "funeralCompany.funeralCompanyName" :
						funeralCompany{
							order("funeralCompanyName",isAsc?"asc":"desc")
						}
						break;
						case "funeraler.funeralerName" :
						funeraler{
							order("funeralerName",isAsc?"asc":"desc")
						}
						break;
						case "emp.empName" :
						emp{
							order("empName",isAsc?"asc":"desc")
						}
						break;
						default:
						order(sortBy,isAsc?"asc":"desc")
					}
				}
			}
		}else{
			//			def where = "ClosingDateIsNotNull"
			//			rowCount = Project."countBy${where}"()
			//			projects = Project."findAllBy${where}"([max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
			rowCount = pList.count{
				and{
					isNull("deleter")
					isNotNull("closingDate")
				}

			}
			pList = Project.createCriteria()
			projects = pList.list{
				and{
					isNull("deleter")
					isNotNull("closingDate")
				}
				firstResult (startRow)
				maxResults(pageRows)
				if(sortBy){
					switch(sortBy){
						case "funeralCompany.funeralCompanyName" :
						funeralCompany{
							order("funeralCompanyName",isAsc?"asc":"desc")
						}
						break;
						case "funeraler.funeralerName" :
						funeraler{
							order("funeralerName",isAsc?"asc":"desc")
						}
						break;
						case "emp.empName" :
						emp{
							order("empName",isAsc?"asc":"desc")
						}
						break;
						default:
						order(sortBy,isAsc?"asc":"desc")
					}
				}
			}
		}

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
				},"type":{str,data->
					if(data.product.hasPlace){
						return "3"
					}else{
						return "1"
					}
				},"productType":{str , data ->
					return data.product.productType
				},"quantityView":{str,data->
					def unit;
					switch(data.product.costUnit){
						case 1:
						def useTime = data.endTime.getTime() - data.startTime.getTime()
						return data.quantity + data.product.unit + "/" + (useTime / 1000 / 60 / 60) + "小時";
						break;
						case 2:
						unit = "小時"
						case 3:
						unit = unit ? unit:"天"
						case 4:
						unit = unit ? unit:"月"
						if(true/*ata.product.costRange == 1*/){
							return (data.quantity + data.product.unit) + "/" + (/*data.quantity * */ formatDecimal(data.product.costRange)) +unit
						}else{
							return (data.quantity + data.product.unit)
						}
						break;
						default:
						return (data.quantity + data.product.unit);
					}
				}],"userdata":[amount:amount,price:itemCount,quantity:itemCount2],]
	}

	def queryid = {
		def project = Project.findById(params.long("id"))
		def res = [:] <<
		[id:project.id,
			projectNo:project.projectNo,
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
			closingDate:project.closingDate?.format("yyyy-MM-dd"),
			memo:project.memo]

		render res as JSON
	}

	def updateClosing = {
		def project = Project.findById(params.long("id"))
		project.closingDate = new Date()
		project.outDate = project.closingDate
		def details = BillDetail.findAllByProject(project)
		def amount1 = 0 ,amount2 =0 , amount3 = 0
		details?.each(){
			amount1 +=(it.modifiedPrice * it.quantity)
			println it.product.productName
			println it.modifiedPrice
			println it.product.price
			println it.product.costPrice
			if(it.product.hasPlace){
				def linkPlace = ProductLinkPlace.findByProductAndPlace(it.product,it.place)
				amount2 +=linkPlace.price
				amount3 +=linkPlace.costPrice
			}else{
				amount2 +=it.product.price * it.quantity
				amount3 +=it.product.costPrice * it.quantity
			}
		}
		project.sallingTotal = amount1
		project.total = amount2
		project.costTotal = amount3
		project.closer = session.employee
		project.save()
		render [:] as JSON
	}

	def updateBeforeClosing = {
		def project = Project.findById(params.long("id"))
		project.sallingTotal = BigDecimal.ZERO
		project.total = BigDecimal.ZERO
		project.costTotal = BigDecimal.ZERO
		project.closingDate = null
		project.outDate = null
		project.save()
		render [:] as JSON
	}

	/**
	 * 新增專案
	 */
	def addAction = {

		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def project = new Project();
		int count = Project.executeQuery("select MAX( id ) from Project")[0];
		count = count==null?0:count;
		project.projectNo = String.format("%07d", ++count);
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

	def updateViewBill = {

		def datas = JSON.parse(params.data)
		def ids = []
		def iddata = [:]
		datas.each(){
			ids.add(it.id.toLong())
			iddata[it.id.toLong()] = it.showBill.toBoolean()
			println iddata
		}
		def aBill = BillDetail.findAllByIdInList(ids)
		BillDetail.withTransaction{ status ->
			aBill?.each {
				it.showBill = iddata[it.id].toBoolean()
				it.save()
			}
		}
		def res = ["" : ""]
		render res as JSON
	}

	/**
	 * 修改專案
	 */
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

	/**
	 * 刪除專案
	 */
	def deleteAction = {
		def project = Project.findById(params.id)
		def details = BillDetail.findAllByProject(project)

		details?.each(){
			def product = it.product

			if(!product.hasPlace){
				if(product.productType != 0){
					new ProductHistory(
					product:product,
					project:project,
					isPurchase:false,
					quantity:(it.quantity * -1),
					date:new Date(),
					totalQuantity:0,
					vendor:it.vendor,
					lastModifyBy: session.employee
					).save()
				}else{
					product.totalQuantity += it.quantity
					new ProductHistory(
					product:product,
					project:project,
					isPurchase:false,
					quantity:(it.quantity * -1),
					date:new Date(),
					totalQuantity:(product.totalQuantity),
					vendor:"",
					lastModifyBy: session.employee
					).save()
					product.save()
				}
			}
			it.delete(flush: true)
		}
		//刪除Project，只放刪除人員
		project.deleter = session.employee;
		project.save();
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	/**
	 * 刪除已購買產品
	 */
	def deleteProduct = {
		def billDetail = BillDetail.findById(params.long("id"))
		
		if(billDetail){
			billDetail.delete(flush: true);
		}else{
			throwError("無法刪除");
		}	
		def res = ["IsSuccess" : true]
		render res as JSON
	}
	
	/**
	 * 修改專案
	 */
	def modifyAction={
		def project = Project.findById(id)
		if(!project) {
			return throwError("無法修改");
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

	/**
	 * 修改已購買產品
	 */
	def updateProduct ={
		def type = params.type
		def detail= BillDetail.findById(params.long("detailid"));
		def oldProduct = detail.product
		def oldQuantity = detail.quantity
		def oldVendor =detail.vendor

		if(!oldProduct.hasPlace){
			if(oldProduct.productType!=0){
				new ProductHistory(
				product:oldProduct,
				project:detail.project,
				isPurchase:false,
				quantity:(oldQuantity * -1),
				date:new Date(),
				totalQuantity:0,
				vendor:detail.vendor,
				LastModifyBy: session.employee
				).save()
			}else{
				oldProduct.totalQuantity += oldQuantity
				new ProductHistory(
				product:oldProduct,
				project:detail.project,
				isPurchase:false,
				quantity:(oldQuantity * -1),
				date:new Date(),
				totalQuantity:(oldProduct.totalQuantity),
				vendor:"",
				LastModifyBy: session.employee
				).save()
				oldProduct.save()
			}
		}

		//copy from addProudct


		def product = Product.findById(params.long("product" + type))
		detail.product = product
		def amount = parseCostUnit(params, type, product, detail)


		def productHistory = new ProductHistory();
		if("1".equals(type)){
			if(0 == params.productType){
				if(product.totalQuantity < params.int("amount1")){
					return throwError("目前剩餘庫存量:" + product.totalQuantity);
				}
				detail.quantity = params.int("amount1")
				product.totalQuantity -= detail.quantity
				detail.price = detail.product.sallingPrice
				detail.color = 1
				detail.place = null
				detail.modifiedPrice = params.modifiedPrice1?new BigDecimal(params.modifiedPrice1):detail.price
				//detail.costPrice = product.costPrice
				//detail.modifiedCostPrice = detail.costPrice
				detail.internalPrice = product.price
				detail.modifiedInternalPrice = detail.internalPrice
				detail.vendor=""

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
			}else{
				//detail.startTime = df.parse(params.date2 + " " + params.hour2 + ":" + params.min2)
				//detail.endTime = detail.startTime
				detail.quantity = params.int("amount1")
				detail.price = product.sallingPrice
				detail.color = 2
				detail.place = null
				detail.modifiedPrice = params.modifiedPrice2?new BigDecimal(params.modifiedPrice2):detail.price
				//detail.costPrice = product.costPrice
				//detail.modifiedCostPrice = detail.costPrice
				detail.internalPrice = product.price
				detail.modifiedInternalPrice = detail.internalPrice
				detail.vendor=params.vendor1


				new ProductHistory(
				product:product,
				project:detail.project,
				isPurchase:false,
				quantity:detail.quantity,
				date:detail.startTime,
				totalQuantity:0,
				vendor:params.vendor1,
				LastModifyBy: session.employee
				).save()
			}
		}else{
			def place = Place.findById(params.long("place3"))
			def link = ProductLinkPlace.findByProductAndPlace(detail.product,place)
			def hasUse = BillDetail.createCriteria().list{
				and{
					eq('place',place)
					ne("id",detail.id)
					gt('endTime',detail.startTime)
					lt('startTime',detail.endTime)

				}

			}
			if(hasUse.size()>0){
				return throwError("此時間場地使用中!!")
			}
			
			detail.quantity = amount
			detail.price = link.sallingPrice
			detail.color = 3
			detail.place = place
			detail.modifiedPrice = params.modifiedPrice3?new BigDecimal(params.modifiedPrice3):detail.price			
		}
		detail.lastModifyBy = session.employee
		detail.save()
		if(detail.hasErrors()){
			println detail.errors
			throwError detail.errors
		}
		def res = ["IsSuccess" : true]
		render res as JSON

	}

	/**
	 * 新增購買產品
	 */
	def addProduct={
		def type = params.type
		def detail= new BillDetail();
		detail.project = Project.findById(params.long("id"))
		def product = Product.findById(params.long("1".equals(type)?"product1":"product3"))
		detail.product = product
		def amount = parseCostUnit(params, type, product, detail)

		if("1".equals(type)){
			if(params.productType=="0"){
				//一般
				if(product.totalQuantity < params.int("amount1")){
					return throwError("目前剩餘庫存量:" + product.totalQuantity);
				}
				detail.quantity = amount
				product.totalQuantity -= detail.quantity
				detail.price = detail.product.sallingPrice
				detail.color = 1
				detail.modifiedPrice = params.modifiedPrice1?new BigDecimal(params.modifiedPrice1):detail.price
				detail.internalPrice = product.price
				detail.modifiedInternalPrice = detail.internalPrice
				detail.vendor=""

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
			}else{
				//無庫存/代叫商品
				//detail.startTime = df.parse(params.date2 + " " + params.hour2 + ":" + params.min2)
				//detail.endTime = detail.startTime
				detail.quantity = amount
				detail.price = product.sallingPrice
				detail.color = 2
				detail.modifiedPrice = params.modifiedPrice2?new BigDecimal(params.modifiedPrice2):detail.price
				detail.internalPrice = product.price
				detail.modifiedInternalPrice = detail.internalPrice
				detail.vendor=params.vendor1

				new ProductHistory(
				product:product,
				project:detail.project,
				isPurchase:false,
				quantity:detail.quantity,
				date:detail.startTime,
				totalQuantity:0,
				vendor:params.productType==1?"":params.vendor1,
				LastModifyBy: session.employee
				).save()

			}
		}else{
			//場地類
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
			detail.quantity = amount
			detail.price = link.sallingPrice
			detail.color = 3
			detail.place = place
			detail.modifiedPrice = params.modifiedPrice3?new BigDecimal(params.modifiedPrice3):detail.price
			detail.internalPrice = link.price
			detail.modifiedInternalPrice = detail.internalPrice
		}
		detail.lastModifyBy = session.employee
		//detail.showBill = params.boolean("showBill")
		detail.save()
		if(detail.hasErrors()){
			println detail.errors
			throwError detail.errors
		}
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def parseCostUnit(params, type, product, detail){
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def cal1 = Calendar.getInstance();
		def cal2 = Calendar.getInstance();
		def amount = params.int("1".equals(type)?"amount1":"amount3")
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
			//def hour = 1000 * 60 * 60 * product.costRange
				detail.startTime = df.parse(params.startDate + " " + params.startHour + ":" + params.startMin)
			//	detail.endTime = df.parse(params.endDate + " " + params.endHour + ":" + params.startMin)
				cal1.setTime detail.startTime
				int costRange = product.costRange.intValue()
				cal1.add(Calendar.HOUR ,costRange * amount)
				cal1.add(Calendar.MINUTE , product.costRange.subtract(new BigDecimal(costRange)).multiply(new BigDecimal(amount)).multiply(new BigDecimal(60)).intValue())
				detail.endTime  = cal1.getTime();
			//	cal1.setTime detail.startTime
			//	cal2.setTime detail.endTime
			//	if(cal2.compareTo(cal1) <= 0 || ((cal2.getTimeInMillis() - cal1.getTimeInMillis())%hour) != 0 ){
			//		return throwError("結束時間需大於開始時間 且 每次使用時間以 " + product.costRange + " 小時為單位");
			//	}
				break;
			case "3": //天
			//def day = 1000 * 60 * 60 * 24 * product.costRange
				detail.startTime = df.parse(params.startDate + " 00:00")

			//	detail.endTime = df.parse(params.endDate + " 00:00")
				cal1.setTime detail.startTime
				int costRange = product.costRange.intValue()
				cal1.add(Calendar.DATE, costRange * amount)
				cal1.add(Calendar.HOUR , product.costRange.subtract(new BigDecimal(costRange)).multiply(new BigDecimal(amount)).multiply(new BigDecimal(24)).intValue())
				detail.endTime  = cal1.getTime();
			//	cal2.setTime detail.endTime
			//	if(cal2.compareTo(cal1) <= 0 || ((cal2.getTimeInMillis() - cal1.getTimeInMillis())%hour) != 0 ){
			//		return throwError("結束日期需大於開始日期 且 每次使用時間以 " + product.costRange + " 天為單位");
			//	}
				break;
			case "4": //月
				detail.startTime = df.parse(params.startDate + " 00:00")
				cal1.setTime detail.startTime
			//	if((params.int("mouth") % product.costRange) != 0){
			//		return throwError("每次使用時間以 " + product.costRange + " 個月為單位");
			//	}
			//	cal1.add(Calendar.MONTH, params.int("mouth"))
				int costRange = product.costRange.intValue()
				cal1.add(Calendar.MONTH, costRange * amount)
				cal1.add(Calendar.DATE , product.costRange.subtract(new BigDecimal(costRange)).multiply(new BigDecimal(amount)).multiply(new BigDecimal(30)).intValue())
				detail.endTime  = cal1.getTime();
				break;
		}
		return amount
	}

	def search={}

	/**
	 * 搜尋
	 */
	@GridQuery
	def searchProject= {
		def pList = Project.createCriteria()
		DateFormat df = new SimpleDateFormat("yyyy-M-d");
		def projects = pList.list{
			firstResult (startRow)
			maxResults(pageRows)
			if(sortBy){
				order(sortBy,isAsc?"asc":"desc")
			}
			and{
				if(params.projectNo){
					eq("projectNo",String.format("%07d", params.int("projectNo")))
				}
				if (params.projectName){
					like('projectName',"%"+params.projectName+"%")
				}
				if(params.funeralCompany){
					funeralCompany{eq("id",params.long("funeralCompany"))}
				}
				if(params.funeraler){
					funeraler{eq("id",params.long("funeraler"))}
				}
				if(params.contact){
					like('contact',"%"+params.contact+"%")
				}
				if(params.contactAddrCity){
					like('contactAddrCity',"%"+params.contactAddrCity+"%")
				}
				if(params.contactAddrArea){
					like('contactAddrArea',"%"+params.contactAddrArea+"%")
				}
				if(params.memo){
					like('contactAddrArea',"%"+params.memo+"%")
				}
				if(params.inDate){
					if("B".equals(params.inDateKind)){
						le("inDate",df.parse(params.inDate))
					}else{
						ge("inDate",df.parse(params.inDate))
					}
				}
				if(params.outDate){
					if("B".equals(params.outDateKind)){
						le("outDate",df.parse(params.outDate))
					}else{
						ge("outDate",df.parse(params.outDate))
					}
				}
			}
		}
		pList = Project.createCriteria()
		def projectCount = pList.count{
			and{
				if(params.projectNo){
					eq("projectNo",String.format("%07d", params.int("projectNo")))
				}
				if (params.projectName){
					like('projectName',"%"+params.projectName+"%")
				}
				if(params.funeralCompany){
					funeralCompany{eq("id",params.long("funeralCompany"))}
				}
				if(params.funeraler){
					funeraler{eq("id",params.long("funeraler"))}
				}
				if(params.contact){
					like('contact',"%"+params.contact+"%")
				}
				if(params.contactAddrCity){
					like('contactAddrCity',"%"+params.contactAddrCity+"%")
				}
				if(params.contactAddrArea){
					like('contactAddrArea',"%"+params.contactAddrArea+"%")
				}
				if(params.memo){
					like('contactAddrArea',"%"+params.memo+"%")
				}
				if(params.inDate){
					if("B".equals(params.inDateKind)){
						le("inDate",df.parse(params.inDate))
					}else{
						ge("inDate",df.parse(params.inDate))
					}
				}
				if(params.outDate){
					if("B".equals(params.outDateKind)){
						le("outDate",df.parse(params.outDate))
					}else{
						ge("outDate",df.parse(params.outDate))
					}
				}
			}
		}
		/*
		 def queryString = "from Project as p where "
		 queryString <<= params.projectNo?" p.projectNo = '"+String.format("%07d", params.int("projectNo"))+"' and":""
		 queryString <<= params.projectName?" p.projectName like '%"+params.projectName+"%' and":""
		 queryString <<= params.funeralCompany?" p.funeralCompany.id= "+params.long("funeralCompany")+" and":""
		 queryString <<= params.funeraler?" p.funeraler.id= "+params.long("funeraler")+" and":""
		 queryString <<= params.contact?" p.contact like '%"+params.contact+"%' and":""
		 queryString <<= params.contactPhone?" p.contactPhone like '%"+params.contactPhone+"%' and":""
		 queryString <<= params.contact?" p.contact like '%"+params.contact+"%' and":""
		 queryString <<= params.contactAddrCity?" p.contactAddrCity like '%"+params.contactAddrCity+"%' and":""
		 queryString <<= params.contactAddrArea?" p.contactAddrArea like '%"+params.contactAddrArea+"%' and":""
		 queryString <<= params.memo?" p.contactAddrArea like '%"+params.memo+"%' and":""
		 queryString <<= params.inDate?" p.inDate"+("B".equals(params.inDateKind) ?" <= ":" >= ")+ "'"+df.parse(params.inDate) + "' and":""
		 queryString <<= params.outDate?" p.outDate"+("B".equals(params.outDateKind) ?" <= ":" >= ")+"'"+ df.parse(params.outDate) + "' and":""
		 queryString = queryString.substring(0,queryString.length()-3)  + (" order by p."+sortBy +(isAsc?" asc":" desc"))
		 println  "SearchProject:"+queryString*/
		//def projects= Project.findAll(queryString,[max:pageRows,offset:startRow])
		["rowData":projects,"rowCount":projectCount]
	}

	//去小數零
	private BigDecimal formatDecimal(BigDecimal n){
		return n.toString().indexOf(".0")>0?n.intValue():n;
	}
	
	def addDays = {		
		def cal = Calendar.getInstance()
		if(params.startDate){
			cal.setTime Utility.stringToDate(params.startDate, "yyyy-MM-dd")
		}
		cal.add(Calendar.DATE, params.int("day") * params.int("costRange"))
		def res = ["endDate" : Utility.dateFormat.format(cal.getTime())]
		render res as JSON
	}
	
	/**
	 * 計算兩個日期相差天數
	 */
	def daysBetween = {
		def cal1 = Calendar.getInstance()
		cal1.setTime Utility.stringToDate(params.startDate, "yyyy-MM-dd")
		
		def cal2 = Calendar.getInstance()
		cal2.setTime Utility.stringToDate(params.endDate, "yyyy-MM-dd")
		
		def res = ["amount" : Utility.daysBetween(cal1.getTime(),cal2.getTime()) / params.int("costRange")]
		render res as JSON
	}
	
	
}
