package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery;

/**
 * 禮儀師
 * @author rick
 *
 */
class FuneralerController extends GridController{


	@GridQuery
	def queryByComp = {
		def company = FuneralCompany.findById(params.long("funeralCompanyId"))
		["rowData":Funeraler.findByFuneralCommpany(company,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"]),
					"rowCount":Funeraler.countByFuneralCommpany(company)]
	}



	def deleteAction = {
		def funeraler = Funeraler.findById(id)
		def res = ["IsSuccess" : true]
		if(funeraler){
			funeraler.delete()
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
	def modifyAction={
		def funeraler = Funeraler.findById(id)
		if(!funeraler) {
			return println("無法修改")
		}

		new JSONObject(params.get("data")).each(){
			switch( it.key ){
				case 'FuneralerName':
				case 'phone1':
				case 'phone2':
					funeraler.putAt it.key,it.value
					break
			}
		}
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			funeraler.setLastModifyBy emp
		}
		funeraler.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
