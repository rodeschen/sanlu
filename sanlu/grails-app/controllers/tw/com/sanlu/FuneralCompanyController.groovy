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
		def funeralCompanys = FuneralCompany.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		["rowData":funeralCompanys,
					"rowCount":FuneralCompany.list().size()]
	}

	def deleteAction = {
		def company = FuneralCompany.findById(id)
		def res = ["IsSuccess" : true]
		if(company){
			company.delete(flush: true)
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
	def modifyAction={
		def company = FuneralCompany.findById(params.long("id"))
		if(!company) {
			return throwError("無法修改");			
		}

		new JSONObject(params).each(){
			switch( it.key ){
				case 'funeralCompanyName':
				case 'phone1':
				case 'phone2':
				case 'contactAddr':
				case 'contactAddrCity':
				case 'contactAddrArea':
					company.putAt it.key,it.value
					break
			}
		}
		company.setLastModifyBy session.employee

		company.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def insertAction={
		def funeralCompany = new FuneralCompany(
				funeralCompanyName:params.funeralCompanyName,
				phone1:params.phone1,
				phone2:params.phone2,
				contactAddrCity:params.contactAddrCity,
				contactAddrArea:params.contactAddrArea,
				contactAddr:params.contactAddr,
				lastModifyBy:session.employee)
		funeralCompany.save()

		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
