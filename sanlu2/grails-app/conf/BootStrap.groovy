import tw.com.sanlu.Employee
import grails.util.GrailsUtil
class BootStrap {

	def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":
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
				if(emp1.hasErrors()){
					println emp1.errors
				}
				
				break
			case "production" : break
		}
		def destroy = {
		}
	}
}
