package tw.com.sanlu

import java.util.List;
import java.util.Map;
import tw.com.sanlu.excel.ExcelUtility;
import grails.converters.JSON

class ComboboxController extends BaseController {

	//禮儀公司
	def funeralCompany = {
		def l = FuneralCompany.findAll()
		def res = [:]
		l?.each(){
			res[it.id] = it.funeralCompanyName
		}
		render res as JSON
	}

	//禮儀師
	def funeraler = {
		def id = params.id

		def l = Funeraler.findByFuneralCommpany(FuneralCompany.findById(id))
		def res = [:]
		l?.each(){
			res[it.id] = it.funeralerName
		}
		render res as JSON
	}

	//員工
	def employee ={
		def l = Employee.findAll()
		def res = [:]
		l?.each(){
			res[it.empNo] = it.empName
		}
		render res as JSON
	}

	//地址	
	private static Map<String, List<String>> addrMap;
	def city={
		if(addrMap==null){
			addrMap = ExcelUtility.handleAddrExcel("addr.xls")
		}
		render addrMap as JSON
	}
	
	//場地
	def place ={
		def l = Place.findAll()
		def res = [:]
		l?.each(){
			res[it.id] = it.placeName
		}
		render res as JSON
	}
}
