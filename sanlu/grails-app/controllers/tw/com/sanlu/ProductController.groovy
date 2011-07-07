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
		["rowData":Product.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":Product.count()]
	}
	@GridQuery
	def queryPlaceProduct = {
		["rowData":ProductLinkPlace.findAllByProduct(Product.findById(params.get("product.id")),[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"]),
					"rowCount":ProductLinkPlace.count()]
	}

	def insertAction={

		def json = new JSONObject(params.get("data"))
		boolean isNomal = new Boolean(params.get("isNomal"))
		int count = isNomal?Product.executeQuery("select max(id) from Product")[0]:0
		boolean hasPlace = "T".equals( json.getString("hasPlace"))
		def product = null

		if(isNomal){
			if(hasPlace){
				product = new Product(
						productNo:String.format("%06d", ++count),
						productName:json.getString("productName"),
						totalQuantity:new BigDecimal(json.getInt("totalQuantity")),
						unit:json.getString("unit"),
						hasPlace:"T".equals( json.getString("hasPlace")),
						lastModifyBy:session.employee)
			}else{
				product = new Product(
						productNo:String.format("%06d", ++count),
						productName:json.getString("productName"),
						totalQuantity:new BigDecimal(json.getInt("totalQuantity")),
						price:new BigDecimal(json.getString("price")),
						sallingPrice:new BigDecimal(json.getString("sallingPrice")),
						costPrice:new BigDecimal(json.getString("costPrice")),
						unit:json.getString("unit"),
						hasPlace:"T".equals( json.getString("hasPlace")),
						lastModifyBy:session.employee)
			}
		}else{
			println json.getString("productId")
			println json.getString("placeId")
			product = new ProductLinkPlace(
					product : Product.findById(json.getString("productId")),
					place : Place.findById(json.getString("placeId")),
					price:new BigDecimal(json.getString("price")),
					sallingPrice:new BigDecimal(json.getString("sallingPrice")),
					costPrice:new BigDecimal(json.getString("costPrice")),
					lastModifyBy:session.employee)
		}
		product.save()
		if(product.hasErrors()){
			println product.errors
		}


		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def deleteAction = {
		boolean isNomal = new Boolean(params.get("isNomal"))

		def productLinkPlace = !isNomal?ProductLinkPlace.findByPlaceAndProduct(Place.findById(params.get("place.id")),Product.findById(params.get("product.id"))):Product.findById(id)

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

		boolean isNomal = new Boolean(params.get("isNomal"))

		if(!isNomal){
			productLinkPlace = ProductLinkPlace.findByPlaceAndProduct(Place.findById(json.getString("OplaceId")),Product.findById(json.getString("OproductId")))
		}else{
			productLinkPlace= Product.findById(id)
		}
		if(!productLinkPlace) {
			return println("無法修改")
		}
		if(!isNomal){
			//場地
			def place = productLinkPlace.getPlace();
			def product = productLinkPlace.getProduct();
			json.each(){
				def keyName = it.key
				switch(keyName){
					case 'placeId':
						if(place.getId()!=it.value){
							productLinkPlace.putAt "place",Place.findById(it.value)
						}
						break
					case 'productId':
						if(product.getId()!=it.value){
							productLinkPlace.putAt "product",Product.findById(it.value)
						}
						break
					case 'price':
					case 'sallingPrice':
					case 'costPrice':
						productLinkPlace.putAt keyName,new BigDecimal(it.value)
						break
					default:
						break
				}
			}
		}else{
			//產品
			json.each(){
				def keyName = it.key
				switch(keyName){
					case 'lastUpdated':
					case 'id':
					case 'productNo':
					case 'placeId':
					case 'productId':
					case 'OproductId':
					case 'OplaceId':
						break
					case 'price':
					case 'sallingPrice':
					case 'costPrice':
					case 'totalQuantity':
						productLinkPlace.putAt keyName,new BigDecimal(it.value)
						break
					case 'hasPlace':
						productLinkPlace.putAt keyName,new Boolean("T".equals(it.value))
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
					obj.putAt keyNames,new BigDecimal(val)
					break
				default:
					obj.putAt keyNames,val
			}
		}
	}
}

