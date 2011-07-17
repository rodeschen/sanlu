import grails.util.GrailsUtil
import tw.com.sanlu.BillDetail
import tw.com.sanlu.Employee
import tw.com.sanlu.FuneralCompany
import tw.com.sanlu.Funeraler;
import tw.com.sanlu.Place
import tw.com.sanlu.Product
import tw.com.sanlu.ProductHistory
import tw.com.sanlu.ProductLinkPlace
import tw.com.sanlu.Project

class BootStrap {

	def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":
				log.debug("development")
				try{
					//init Employee
					def emp1 = new Employee(
							empNo:"00001",
							empName:"emp1",
							password:"1234".encodeAsMD5(),
							hireDate:new Date(),
							empLevel:1,
							isLeft:false,
							gender:"M")
					emp1.save()
					def emp2= new Employee(
							empNo:"00002",
							empName:"emp2",
							password:"1234".encodeAsMD5(),
							hireDate:new Date(),
							empLevel:2,
							isLeft:false,
							gender:"M")
					emp2.save()
					def emp3 = new Employee(
							empNo:"00003",
							empName:"emp3",
							password:"1234".encodeAsMD5(),
							hireDate:new Date(),
							empLevel:5,
							isLeft:true,
							gender:"M")
					emp3.save()
					//init 禮儀公司
					def fCom = new FuneralCompany(
							funeralCompanyName:"祥安禮儀",
							phone1:"091234567",
							contactAddrCity:"新北市",
							contactAddrArea:"三重區",
							contactAddr:"XX路",							
							lastModifyBy:emp1
							)
					fCom.save()
					def fCom2 = new FuneralCompany(
							funeralCompanyName:"祥安禮儀2",
							phone1:"091234567",
							lastModifyBy:emp1
							)
					fCom2.save()
					//init 禮儀師
					def funer = new Funeraler(
							funeralCommpany:fCom,
							funeralerName:"李XX",
							phone1:"0988765241",
							lastModifyBy:emp1
							)
					funer.save()
					def funer2 = new Funeraler(
							funeralCommpany:fCom2,
							funeralerName:"林XX",
							phone1:"0988765241",
							lastModifyBy:emp1
							)
					funer2.save()


					//init Place
					def place = new Place(
							placeName : "助念室",
							lastModifyBy:emp1
							)
					place.save()
					def place1 = new Place(
							placeName : "功德廳",
							lastModifyBy:emp1
							)
					place1.save()
					def place2 = new Place(
							placeName : "大忠廳",
							lastModifyBy:emp1
							)
					place2.save()
					def place3 = new Place(
							placeName : "靈位區",
							lastModifyBy:emp1
							)
					place3.save()
					def place4 = new Place(
							placeName : "至正廳",
							lastModifyBy:emp1
							)
					place4.save()
					def place5 = new Place(
							placeName : "誦經室(一)",
							lastModifyBy:emp1
							)
					place5.save()
					def place6 = new Place(
							placeName : "誦經室(二)",
							lastModifyBy:emp1
							)
					place6.save()
					def place7 = new Place(
							placeName : "誦經室(三)",
							lastModifyBy:emp1
							)
					place7.save()
					def place8 = new Place(
							placeName : "誦經室(五)",
							lastModifyBy:emp1
							)
					place8.save()
					//init Product
					def leave = new Product(productNo:"000004",
							productName:"告別式",
//							totalQuantity:50,
//							price:100,
//							sallingPrice:200,
//							costPrice:50,
							//timeType:1,
							unit:"場",
							lastModifyBy:emp1,
							hasPlace:true)
					leave.save()
					//init Product link Place
					def productLinkPlace = new ProductLinkPlace(
							product:leave,
							place:place1,
							price:2000,
							sallingPrice:1000,
							costPrice:100,
							lastModifyBy:emp1
							)
					productLinkPlace.save()
					def productLinkPlace1 = new ProductLinkPlace(
							product:leave,
							place:place3,
							price:3000,
							sallingPrice:2000,
							costPrice:200,
							lastModifyBy:emp1
							)

					productLinkPlace1.save()
					def product2 = new Product(productNo:"000005",
							productName:"助念",
//							totalQuantity:50,
//							price:100,
//							sallingPrice:200,
//							costPrice:50,
							//timetype:1,
							unit:"場",
							lastModifyBy:emp1,
							hasPlace:true)
					product2.save()
					//init Product link Place
					def product2LinkPlace = new ProductLinkPlace(
							product:product2,
							place:place2,
							price:3000,
							sallingPrice:2000,
							costPrice:200,
							lastModifyBy:emp1
							)
					product2LinkPlace.save()
					def product2LinkPlace2 = new ProductLinkPlace(
							product:product2,
							place:place3,
							price:3000,
							sallingPrice:2000,
							costPrice:200,
							lastModifyBy:emp1
							)
					product2LinkPlace2.save()

					def flower = new Product(
							productNo:"000001",
							productName:"瓶花",
							totalQuantity:50,
							price:100,
							sallingPrice:200,
							costPrice:50,
							isAgency:true,
							//timetype:1,
							lastModifyBy:emp1,
							unit:"對",
							hasPlace:false
							)
					flower.save()
					def washbasin = new Product(
							productNo:"000002",
							productName:"奉臉盆水",
							totalQuantity:100,
							price:200,
							sallingPrice:500,
							costPrice:100,
							isAgency:false,
							//timetype:1,
							lastModifyBy:emp1,
							unit:"組",
							hasPlace:false
							)
					washbasin.save()
					if(washbasin.hasErrors()){
						println washbasin.errors
					}

					def hall = new Product(
							productNo:"000003",
							productName:"六菜碗",
							totalQuantity:1,
							price:400,
							sallingPrice:800,
							costPrice:500,
							isAgency:true,
							//timetype:1,
							lastModifyBy:emp1,
							unit:"節",
							hasPlace:false
							)
					hall.save()

					//init Project
					def project1 = new Project(
							projectName:"張一二",
							funeralCompany : fCom,
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
							startTime:new Date(111,5,8,10,00,00),
							endTime:new Date(111,5,8,12,00,00),
							quantity:10,
							price:550,
							color:1,
							place:place8,
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
							startTime:new Date(111,5,6,10,00,00),
							endTime:new Date(111,5,6,14,00,00),
							quantity:10,
							price:550,
							color:2,
							place:place4,
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
					
					def productHistory =new ProductHistory(
						product:hall,
						project:project1,
						isPurchase:true,
						quantity:90,
						date:new Date(),
						totalQuantity:hall.totalQuantity,
						vendor:"廠商一",
						LastModifyBy: emp2
						)
					productHistory.save()
					if(productHistory.hasErrors()){
						println productHistory.errors
					}
				}catch(Exception e){
					println e.dump()
				}

				break
			case "production" : break
		}
		def destroy = {
		}
	}
}