package tw.com.sanlu

import grails.converters.JSON
import tw.com.sanlu.annotation.GridQuery;

/**
 * 場地
 */
class PlaceController extends GridController{
	@GridQuery
	def queryPlace = {
		["rowData":Place.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"),
					"rowCount":Place.count()]
	}
	def insertAction={

		def place = new Place(
				placeName:params.placeName,
				lastModifyBy:session.employee)
		place.save()

		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def modifyAction={
		def place = Place.findById(params.long("id"))
		if(!place) {
			return println("無法修改")
		}
		place.setPlaceName params.placeName
		place.setLastModifyBy session.employee
		place.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}

	def deleteAction = {
		def place = Place.findById(params.long("id"))
		def res = ["IsSuccess" : true]
		if(place){
			place.delete()
		}else{
			res =["IsSuccess" : false]
		}
		render res as JSON
	}
}
