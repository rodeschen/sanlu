package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * 員工管理
 * @author rick
 *
 */
class EmployeeController extends GridController{
	def queryAction = {
		def rows=[]
		def emps = Employee.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		for (emp in emps) {
			def row = [:]
			def o=[]
			columns.each(){
				def obj = it.split('\\.')
				def tmp = emp

				for(i in obj){
					tmp = tmp.getAt(i)
				}
				if(tmp instanceof Timestamp){

					tmp= Utility.shortFormat.format(tmp)
				}
				o.add tmp
			}
			row.put(GridEnum.CELL.getCode(),o)
			rows.add row
		}
		return rows
	}
	public int getCountRow(params){
		Employee.count()
	}
	def modifyAction={
		def emp = Employee.findById(id)
		if(!emp) {
			return println("無法修改")
		}

		new JSONObject(params.data).each(){
			switch( it.key ){
				case 'empNo':
				case 'empName':
				case 'gender':
				case 'password':
				case 'hireDate':
				case 'empLevel':
					emp.putAt it.key,it.value
					break
			}
		}
		emp.save()
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
		println params.int("empLevel")
		Date hireDate = new Date(Integer.parseInt(h.substring(0,4)),Integer.parseInt(h.substring(5,7)),Integer.parseInt(h.substring(8,10)),00,00,00)
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
