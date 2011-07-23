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
			project{ eq('id',params.id?params.long("id"):"") }
		}

		bList = BillDetail.createCriteria()
		def projects = bList.list{
			project{ eq('id',params.id?params.long("id"):"") }
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
		["rowData":projects,"rowCount":rowCount,format:["amount":{str , data -> return data.modifiedPrice * data.quantity}],"userdata":[amount:amount,price:itemCount,quantity:itemCount2]]
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
		def productHistory = new ProductHistory();
		switch(type){
			case "1":
				detail.startTime = df.parse(params.date1 + " " + params.hour1 + ":" + params.min1)
				detail.endTime = detail.startTime
				if(product.totalQuantity < params.int("amount1")){
					// throw error
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
				detail.startTime = df.parse(params.date2 + " " + params.hour2 + ":" + params.min2)
				detail.endTime = detail.startTime
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
				detail.startTime = df.parse(params.startDate3 + " " + params.startHour3 + ":" + params.startMin3)
				detail.endTime = df.parse(params.endDate3 + " " + params.endHour3 + ":" + params.endMin3)
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
