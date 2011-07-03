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

		def productLinkPlace = hasPlace?ProductLinkPlace.findByPlaceAndProduct(Place.findById(params.get("placeId")),Product.findById(params.get("productId"))):Product.findById(id)

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
		println(json.getString("placeId"))
		if(hasPlace){
			productLinkPlace = ProductLinkPlace.findByPlaceAndProduct(Place.findById(json.getString("OplaceId")),Product.findById(json.getString("OproductId")))
		}else{
			productLinkPlace= Product.findById(id)
		}
		if(!productLinkPlace) {
			return println("無法修改")
		}
		if(hasPlace){
			def place = productLinkPlace.getPlace();
			def product = productLinkPlace.getProduct();
			json.each(){
				def keyName = it.key
				switch(keyName){
					case 'placeName':
						place.putAt keyName,it.value
						break
					case 'price':
					case 'sallingPrice':
					case 'costPrice':
						productLinkPlace.putAt keyName,new BigDecimal(it.value)
						break					
					case 'hasPlace':
						product.putAt keyName,new Boolean(it.value)
						break
					case 'timeType':
					case 'unit':
						product.putAt keyName,it.value
						break
					default:
						break
				}
			}
		}else{
			json.each(){
				def keyName = it.key
				switch(keyName){
					case 'lastUpdated':
					case 'id':
					case 'productNo':
					case 'placeId':
					case 'productId':
						break
					case 'price':
					case 'sallingPrice':
					case 'costPrice':
					case 'totalQuantity':
						productLinkPlace.putAt keyName,new BigDecimal(it.value)
						break
					case 'hasPlace':
						productLinkPlace.putAt keyName,new Boolean(it.value)
						break
					default:
						productLinkPlace.putAt keyName,it.value
				}
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

