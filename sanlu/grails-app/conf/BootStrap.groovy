import grails.util.GrailsUtil
import tw.com.sanlu.BillDetail
import tw.com.sanlu.Employee
import tw.com.sanlu.FuneralCompany
import tw.com.sanlu.Funeraler;
import tw.com.sanlu.Product
import tw.com.sanlu.Project

class BootStrap {

	def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":

			//init 禮儀公司
				def fCom = new FuneralCompany(
				funeralCompanyName:"祥安禮儀",
				phone1:"091234567",
				address:"新北市三重區XX路"
				)
				fCom.save()
			//init 禮儀師
				def funer = new Funeraler(
						funeralCommpany:fCom,
						funeralerName:"李XX",
						phone1:"0988765241"
						)
				funer.save()
			//init Employee
				def emp1 = new Employee(
						empNo:"00001",
						empName:"emp1",
						password:"1234",
						hireDate:new Date(),
						empLevel:5,
						gender:"M")
				emp1.save()
				def emp2= new Employee(
						empNo:"00002",
						empName:"emp2",
						password:"1234",
						hireDate:new Date(),
						empLevel:5,
						gender:"M")
				emp2.save()
				def emp3 = new Employee(
						empNo:"00003",
						empName:"emp3",
						password:"1234",
						hireDate:new Date(),
						empLevel:5,
						gender:"M")
				emp3.save()


			//init Product
				def flower = new Product(
						productNo:"000001",
						productName:"花",
						totalQuantity:50,
						price:100,
						sallingPrice:200,
						costPrice:50,
						timeType:1,
						unit:"對"
						)
				flower.save()
				if(flower.hasErrors()){
					println flower.errors
				}
				def washbasin = new Product(
						productNo:"000002",
						productName:"奉臉盆水",
						totalQuantity:100,
						price:200,
						sallingPrice:500,
						costPrice:100,
						timeType:1,
						unit:"組"
						)
				washbasin.save()

				def hall = new Product(
						productNo:"000003",
						productName:"大忠廳",
						totalQuantity:1,
						price:6400,
						sallingPrice:8000,
						costPrice:5000,
						timeType:1,
						unit:"節"
						)
				hall.save()
			//init Project
				def project1 = new Project(
						projectName:"projectName",
						funeraler:funer,
						inDate:new Date(99,12,1,10,00,00),
						outDate:new Date(100,12,1,10,00,00),
						emp:emp1,
						sallingTotal:100000,
						total:90000,
						costTotal:80000
						)
				project1.save()
				if(project1.hasErrors()){
					println project1.errors
				}
			//init BillDetail
				def flowerDetail = new BillDetail(
						product:flower,
						startTime:new Date(99,12,1,10,00,00),
						endTime:new Date(),
						quantity:10,
						price:550,
						modifiedPrice:500,
						costPrice:300,
						modifiedCostPrice:300,
						lastModifyBy:emp2,
						project:project1
						)
				flowerDetail.save()
				if(flowerDetail.hasErrors()){
					println flowerDetail.errors
				}
				def washbasinDetail= new BillDetail(
						product:washbasin,
						startTime:new Date(99,12,1,10,00,00),
						endTime:new Date(),
						quantity:10,
						price:550,
						modifiedPrice:500,
						costPrice:300,
						modifiedCostPrice:300,
						lastModifyBy:emp2,
						project:project1
						)
				washbasinDetail.save()
				if(washbasinDetail.hasErrors()){
					println washbasinDetail.errors
				}


				break
			case "production" : break
		}
		def destroy = {
		}
	}
}