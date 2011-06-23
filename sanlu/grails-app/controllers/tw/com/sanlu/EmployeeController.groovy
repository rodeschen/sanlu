package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery;

/**
 * 員工管理
 * @author rick
 *
 */
class EmployeeController extends GridController{

	@GridQuery
	def queryAll = {
		["rowData":Employee.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":Employee.count()]
	}


	def modifyAction={
		def emp = Employee.findById(params.long("id"))
		if(!emp) {
			return println("無法修改")
		}

		def ids = [
			"empName",
			"gender",
			"empLevel",
			"hireDate"
		]
		ids.each(){
			switch( it ){
				case 'empName':
				case 'gender':
					emp.putAt it,params.get(it)
					break
				case 'empLevel':
					emp.putAt it,params.int(it)
					break
				case 'hireDate':
					emp.putAt it,new Date(Integer.parseInt(params.get(it).substring(0,4))-1900,Integer.parseInt(params.get(it).substring(5,7)),Integer.parseInt(params.get(it).substring(8,10)),00,00,00)
					break
			}
		}
		emp.save()
		if(emp.hasErrors()){
			println emp.errors
		}
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def pwreset = {
		def emp = Employee.findById(params.long("id"))
		if(!emp) {
			return println("無法修改")
		}

		emp.setPassword(params.get("pw").encodeAsMD5())
		emp.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def insertAction={
		int count = Employee.executeQuery("select max(id) from Employee")[0]
		String h = params.hireDate
		Date hireDate = new Date(Integer.parseInt(h.substring(0,4))-1900,Integer.parseInt(h.substring(5,7)),Integer.parseInt(h.substring(8,10)),00,00,00)
		def emp = new Employee(
				empNo:String.format("%05d", ++count),
				empName:params.empName,
				password:"1234".encodeAsMD5(),
				hireDate:hireDate,
				empLevel:params.int("empLevel"),
				isLeft:params.boolean("isLeft"),
				gender:"M")
		emp.save()

		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
