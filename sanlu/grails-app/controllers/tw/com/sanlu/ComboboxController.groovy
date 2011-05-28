package tw.com.sanlu

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


	def employee ={
		def l = Employee.findAll()
		def res = [:]
		l?.each(){
			res[it.empNo] = it.empName
		}
		render res as JSON
	}
}
