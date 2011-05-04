package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * 禮儀公司管理
 * @author rick
 *
 */
class FuneralCompanyController extends GridController{
	def queryAction = {
		def rows=[]
		def row = [:]
		def companys = FuneralCompany.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		for (company in companys) {
			def o=[]
			columns.each(){
				def obj = it.split('\\.')
				def tmp = company

				for(i in obj){
					tmp = tmp.getAt(i)
				}
				if(tmp instanceof Timestamp){

					tmp=	Utility.shortFormat.format(tmp)
				}
				o.add tmp
			}
			row.put(GridEnum.CELL.getCode(),o)
			rows.add row
		}
		return rows
	}
	public int getCountRow(params){
		FuneralCompany.count()
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
		company.setLastModify new Date()
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			company.setLastModifyBy emp
		}
		company.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
