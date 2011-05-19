package tw.com.sanlu

import grails.converters.JSON

class ComboboxController extends BaseController {

	def funeral = {
		def l = FuneralCompany.findAll()
		def res = [:]
		l?.each(){
			res[it.id] = it.funeralCompanyName
		}
		render res as JSON
	}
}
