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
		def products = hasPlace?ProductLinkPlace.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"): Product.findAllByHasPlace(false,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
		//println hasPlace + products.size()
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
		ProductLinkPlace.count()
	}

	def deleteAction = {
		boolean hasPlace = params.boolean("hasPlace")
		def productLinkPlace = hasPlace?ProductLinkPlace.findByPlaceAndProduct(Place.findById(params.get("place.id")),Product.findById(params.get("product.id"))):Product.findById(id)
		println productLinkPlace
		def res = ["IsSuccess" : true]
		if(productLinkPlace){
			productLinkPlace.delete()
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
	def modifyAction={
		boolean hasPlace = params.boolean("hasPlace")
		def productLinkPlace
		def json = new JSONObject(params.get("data"))
		if(hasPlace){
			productLinkPlace = ProductLinkPlace.findByPlaceAndProduct(Place.findById(json.getString("place.id")),Product.findById(json.getString("product.id")))
		}else{
			productLinkPlace= Product.findById(id)
		}
		if(!productLinkPlace) {
			return println("無法修改")
		}

		json.each(){
			setObj(it.key,productLinkPlace,it.value)
		}
		Employee emp = Employee.findByEmpNo("00002")
		if(emp){
			productLinkPlace.setLastModifyBy emp
		}
		productLinkPlace.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
	//product.lastModifyBy.empName
	def setObj(keyNames,obj,val){
		if(keyNames.indexOf('.') > -1){
			def keyName = keyNames.substring(0,keyNames.indexOf('.'))
			def lastKeyNames = keyNames.substring(keyNames.indexOf('.')+1)
			obj.putAt(keyName,setObj(lastKeyNames,obj.getAt(keyName),val))
			return obj
		}else{
			switch( keyNames ){
				case 'lastUpdated':
					break
				case 'outDate':
					obj.putAt keyNames,Utility.shortFormat.parse(val)
					break
				case 'price':
				case 'sallingPrice':
				case 'costPrice':
				case 'totalQuantity':
					obj.putAt keyNames,new BigDecimal( val)
					break				
				default:
					obj.putAt keyNames,val
			}
			return obj
		}
	}
}

