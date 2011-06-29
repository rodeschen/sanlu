package tw.com.sanlu

import grails.converters.JSON
import java.sql.Timestamp
import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery;

/**
 * 商品管理
 * @author rickhuang
 *
 */
class ProductController extends GridController{

	@GridQuery
	def queryPlace = {
		["rowData":Place.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":Place.count()]
	}
	@GridQuery
	def queryProduct = {
		["rowData":Product.findAllByHasPlace(false,[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"]),
					"rowCount":Product.countByHasPlace(false)]
	}
	@GridQuery
	def queryPlaceProduct = {
		["rowData":ProductLinkPlace.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":ProductLinkPlace.count()]
	}

	def insertAction={
		
		//def productLinkPlace = hasPlace?ProductLinkPlace.findByPlaceAndProduct(Place.findById(params.get("place.id")),Product.findById(params.get("product.id"))):Product.findById(id)
		def json = new JSONObject(params.get("data"))
		boolean hasPlace = json.getBoolean("hasPlace")
		int count = hasPlace?ProductLinkPlace.executeQuery("select max(id) from ProductLinkPlace")[0]:Product.executeQuery("select max(id) from Product")[0]
		//		if(hasPlace){
		//		}else{
		def product = new Product(
				productNo:String.format("%06d", ++count),
				productName:json.getString("productName"),
				totalQuantity:new BigDecimal(json.getInt("totalQuantity")),
				price:new BigDecimal(json.getString("price")),
				sallingPrice:new BigDecimal(json.getString("sallingPrice")),
				costPrice:new BigDecimal(json.getString("costPrice")),
				timeType:json.getString("timeType"),
				unit:json.getString("unit"),
				hasPlace: json.getBoolean("hasPlace"),
				lastModifyBy:session.employee)

		product.save()
		if(product.hasErrors()){
			println product.errors
		}
		//		}


		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def deleteAction = {
		boolean hasPlace = params.boolean("hasPlace")
		println id
		def productLinkPlace = hasPlace?ProductLinkPlace.findByPlaceAndProduct(Place.findById(params.get("place.id")),Product.findById(params.get("product.id"))):Product.findById(id)

		def res = ["IsSuccess" : true]
		if(productLinkPlace){
			productLinkPlace.delete()
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
	def modifyAction={

		def productLinkPlace
		def json = new JSONObject(params.get("data"))
		boolean hasPlace = json.getBoolean("hasPlace")
		log.debug hasPlace
		if(hasPlace){
			productLinkPlace = ProductLinkPlace.findByPlaceAndProduct(Place.findById(json.getString("place.id")),Product.findById(json.getString("product.id")))
		}else{
			productLinkPlace= Product.findById(id)
		}
		if(!productLinkPlace) {
			return println("無法修改")
		}
		def tmp
		json.each(){
			def keyNames = it.key.split('\\.')			
			int i=0
			for(i=0;i<keyNames.size()-1;i++){
				tmp = i==0?productLinkPlace.getAt(keyNames[i]):tmp.getAt(keyNames[i])
			}
			def keyName = keyNames[i]
			switch(keyName){
				case 'lastUpdated':
				case 'id':
					break
				case 'price':
				case 'sallingPrice':
				case 'costPrice':
				case 'totalQuantity':
					(keyNames.size() >1? tmp:productLinkPlace).putAt keyName,new BigDecimal(it.value)
					break
				case 'hasPlace':
				(keyNames.size() >1? tmp:productLinkPlace).putAt keyName,new Boolean(it.value)
					break
				default:
					(keyNames.size() >1? tmp:productLinkPlace).putAt keyName,it.value
			}
		}
		productLinkPlace.setLastModifyBy session.employee

		productLinkPlace.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
	//product.lastModifyBy.empName
	def setObj(keyNames,obj,val){
		if(keyNames.indexOf('.') > -1){
			def keyName = keyNames.substring(0,keyNames.indexOf('.'))
			def lastKeyNames = keyNames.substring(keyNames.indexOf('.')+1)
			setObj(lastKeyNames,obj.getAt(keyName),val)
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
		}
	}
}

