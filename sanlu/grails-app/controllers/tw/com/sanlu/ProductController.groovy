package tw.com.sanlu

import grails.converters.JSON
import java.sql.Timestamp
import java.text.DateFormat
import java.text.SimpleDateFormat

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
		def products =Product.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		["rowData":products,"rowCount":Product.list().size()]
	}
	@GridQuery
	def queryPlaceProduct = {
		def productLinkPlace =ProductLinkPlace.findAllByProduct(Product.findById(params.get("product.id")),[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])
		["rowData":productLinkPlace,"rowCount":ProductLinkPlace.list().size()]
	}

	def insertAction={

		def json = new JSONObject(params.get("data"))
		boolean isNomal = new Boolean(params.get("isNomal"))
		int count = isNomal?Product.executeQuery("select count(id) from Product")[0]:0		
		boolean hasPlace = "T".equals( json.getString("hasPlace"))
		def product = null

		if(isNomal){
			if(hasPlace){
				product = new Product(
						productNo:String.format("%06d", ++count),
						productName:json.getString("productName"),
						totalQuantity:new BigDecimal(0),
						unit:json.getString("unit"),
						hasPlace:"T".equals( json.getString("hasPlace")),
						costRange:json.containsKey("costRange")?json.getInt("costRange"):0,
						lastModifyBy:session.employee)
			}else{
				product = new Product(
						productNo:String.format("%06d", ++count),
						productName:json.getString("productName"),
						price:new BigDecimal(json.getString("price")),
						sallingPrice:new BigDecimal(json.getString("sallingPrice")),
						unit:json.getString("unit"),
						hasPlace:"T".equals( json.getString("hasPlace")),
						costRange:json.getInt("costRange"),
						productType:json.getInt("productType"),
						lastModifyBy:session.employee)
			}
		}else{
			product = new ProductLinkPlace(
					product : Product.findById(json.getString("productId")),
					place : Place.findById(json.getString("placeId")),
					price:new BigDecimal(json.getString("price")),
					sallingPrice:new BigDecimal(json.getString("sallingPrice")),
					costPrice:new BigDecimal(json.getString("costPrice")),
					//costPrice:0,
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
		def productLinkPlace = !isNomal?ProductLinkPlace.findById(id):Product.findById(id)
		def billDetail = BillDetail.findByProduct(productLinkPlace)
		if(billDetail){
			return throwError(billDetail.product.productName+" 在案號:"+billDetail.project.projectNo+" 已購買，所以無法刪除!!");
		}
		def res = ["IsSuccess" : true]
		if(productLinkPlace){
			productLinkPlace.delete()
			if(productLinkPlace.hasErrors()){
				println productLinkPlace.errors
				render(status: 400, contentType:"text/json", productLinkPlace.errors)
			}
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
			productLinkPlace = ProductLinkPlace.findById(id)
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
						break
					case 'price':
					case 'sallingPrice':
					case 'costRange':
					case 'costUnit':
					case 'costPrice':
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
	/*def setObj(keyNames,obj,val){
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
	 case 'cosRange':
	 case 'costUnit':
	 obj.putAt keyNames,new BigDecimal(val)
	 break
	 default:
	 obj.putAt keyNames,val
	 }
	 }
	 }*/

	def purchase={

		def product = Product.findById(params.normalProduct)
		def purchaseQuantity = new BigDecimal(params.purchaseQuantity)
		//原庫存數量 * 原成本單價 + 進貨數量 * 進貨單價
		def totalCost = (product.totalQuantity?product.totalQuantity.multiply(product.costPrice):BigDecimal.ZERO).plus(purchaseQuantity.multiply(new BigDecimal(params.purchasePrice)))

		product.totalQuantity = (product.totalQuantity?product.totalQuantity:BigDecimal.ZERO).plus(purchaseQuantity)

		product.costPrice = totalCost.divide(product.totalQuantity,2,BigDecimal.ROUND_HALF_UP)

		product.save()
		DateFormat df = new SimpleDateFormat("yyyy-M-d");
		def productHistory =new ProductHistory(
				product:product,
				project:Project.findById(params.project),
				isPurchase:true,
				quantity:purchaseQuantity,
				date:df.parse(params.date),
				totalQuantity:product.totalQuantity,
				vendor:params.vendor,
				memo:params.memo,
				LastModifyBy: session.employee
				)
		productHistory.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}

