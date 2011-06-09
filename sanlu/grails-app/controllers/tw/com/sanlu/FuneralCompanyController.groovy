package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery;

/**
 * 禮儀公司管理
 * @author rick
 *
 */
class FuneralCompanyController extends GridController{

	@GridQuery
	def queryAll = {
		["rowData":FuneralCompany.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":FuneralCompany.count()]
	}

	def deleteAction = {
		def company = FuneralCompany.findById(id)
		def res = ["IsSuccess" : true]
		if(company){
			company.delete()
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
	def modifyAction={
		def company = FuneralCompany.findById(id)
		if(!company) {
			return println("無法修改")
		}

		new JSONObject(params.get("data")).each(){
			switch( it.key ){
				case 'funeralCompanyName':
				case 'phone1':
				case 'phone2':
				case 'address':
					company.putAt it.key,it.value
					break
			}
		}
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			company.setLastModifyBy emp
		}
		company.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
