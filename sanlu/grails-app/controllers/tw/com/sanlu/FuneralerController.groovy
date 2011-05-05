package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * 禮儀師
 * @author rick
 *
 */
class FuneralerController extends GridController{
	def queryAction = {
		def rows=[]
		def row = [:]
		//def funeralers = Funeraler.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")		
		def company = FuneralCompany.findById(params.long("funeralCompanyId"))		
		def funeralers = Funeraler.findByFuneralCommpany(company,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
		for (funeraler in funeralers) {
			def o=[]
			columns.each(){
				def obj = it.split('\\.')
				def tmp = funeraler

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
		Funeraler.count()
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
		funeraler.setLastModify new Date()
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			funeraler.setLastModifyBy emp
		}
		funeraler.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
