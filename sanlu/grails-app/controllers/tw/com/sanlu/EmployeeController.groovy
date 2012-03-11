package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp
import java.text.DateFormat
import java.text.SimpleDateFormat

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
		def employees = Employee.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		["rowData":employees,"rowCount":Employee.list().size()]
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
		DateFormat df = new SimpleDateFormat("yyyy-M-d");
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
					emp.putAt it,df.parse(params.get(it))
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
		int count = Employee.executeQuery("select count(id) from Employee")[0]		
		DateFormat df = new SimpleDateFormat("yyyy-M-d");
		def emp = new Employee(
				empNo:String.format("%05d", ++count),
				empName:params.empName,
				password:"1234".encodeAsMD5(),
				hireDate:df.parse(params.hireDate),
				empLevel:params.int("empLevel"),
				isLeft:params.boolean("isLeft"),
				gender:"M")
		emp.save()

		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
