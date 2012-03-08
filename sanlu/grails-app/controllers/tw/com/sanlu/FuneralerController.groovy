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
		def funeralers =Funeraler.findAllByFuneralCommpany(company,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
		["rowData":funeralers,"rowCount":Funeraler.list().size()]
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
		def funeraler = Funeraler.findById(params.id)
		if(!funeraler) {
			return throwError("無法修改");
		}

		funeraler.setFuneralerName params.funeralerName
		funeraler.setPhone1 params.phone1
		funeraler.setPhone2 params.phone2
		funeraler.setLastModifyBy session.employee

		funeraler.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def insertAction={
		def company = FuneralCompany.findById(params.funeralCompanyId)
		def funeraler = new Funeraler(
				funeralCommpany:company,
				funeralerName:params.funeralerName,
				phone1:params.phone1,
				phone2:params.phone2,
				lastModifyBy:session.employee)
		funeraler.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
