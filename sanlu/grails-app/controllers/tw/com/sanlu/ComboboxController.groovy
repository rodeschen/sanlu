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
	Map<String, List<String>> addrMap=null;
	def city={
		def res = [:]
		if(addrMap==null){
			addrMap = ExcelUtility.handleAddrExcel("addr.xls")
		}
		addrMap?.each(){
			res[it.key] = it.value
		}
		render res as JSON
	}

	def cityArea={
		def res = [:]
		if(params.city){
			def area = addrMap.get(params.city)
			area?.each(){
				res[it.key] = it.key
			}
		}
		render res as JSON
	}
}
