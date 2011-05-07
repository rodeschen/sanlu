package tw.com.sanlu

import grails.converters.JSON
import java.sql.Timestamp
import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * 商品管理
 * @author rickhuang
 *
 */
class ProductController extends GridController{
	def queryAction = {
		def rows=[]
		boolean hasPlace = params.boolean("hasPlace")

		//Project.findAll("from Project as p where p.outDate is null or p.outDate > day(current_date()) "+(sortBy?"order by "+sortBy+(isAsc?" asc":" desc"):""),[max:pageRows,offset:startRow])
		def products = hasPlace?ProductLinkPlace.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"): Product.findByHasPlace(false,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])

		for (product in products) {
			def row = [:]
			def o=[]
			columns.each(){
				def obj = it.split('\\.')
				def tmp = product

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
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			company.setLastModifyBy emp
		}
		company.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}

