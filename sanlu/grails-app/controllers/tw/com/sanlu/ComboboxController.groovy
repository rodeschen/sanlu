package tw.com.sanlu

import java.util.List;
import java.util.Map;

import org.apache.commons.io.comparator.LastModifiedFileComparator;

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
	
	def funeralCompanyAuto = {
		def l = FuneralCompany.findAllByFuneralCompanyNameLike("%"+params.term+"%")
		def res = []
		int i=0;
		l?.each(){
			res[i++] = it.funeralCompanyName
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
			addrMap = ExcelUtility.handleAddrExcel()
		}
		render addrMap as JSON
	}
	//場地型商品
	def placeOfProduct ={
		def l = Product.findAllByHasPlace(true)
		def res = [:]
		l?.each(){
			res[it.id] = ["value":it.id,"unit":it.costUnit,range:it.costRange,"text":it.productName]
		}
		render res as JSON
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

	//一般商品
	def normalProduct ={
		def l = Product.findAllByHasPlaceAndProductType(false,0)
		def res = [:]
		l?.each(){
			res[it.id] = ["value":it.id,"unit":it.costUnit,range:it.costRange,"text":it.productName]
		}
		render res as JSON
	}
	//代叫商品
	def normalProduct2 = {
		def l = Product.findAllByHasPlaceAndProductType(false,2)
		def res = [:]
		l?.each(){
			res[it.id] = ["value":it.id,"unit":it.costUnit,range:it.costRange,"text":it.productName]
		}
		render res as JSON
	}

	//一般無庫存商品
	def normalProduct1 = {
		def l = Product.findAllByHasPlaceAndProductType(false,1)
		def res = [:]
		l?.each(){
			res[it.id] = ["value":it.id,"unit":it.costUnit,range:it.costRange,"text":it.productName]
		}
		render res as JSON
	}

	//非場地型商品
	def product ={
		def l = Product.findAllByHasPlace(false)
		def res = [:]
		l?.each(){
			res[it.id] = it.productName
		}
		render res as JSON
	}

	def placeByProduct={
		def res = [:]
		if(params.getAt("id")){
			def l = ProductLinkPlace.findAllByProduct(Product.findById(params.get("id")));
			l?.each(){
				res[it.place.id] = it.place.placeName
			}
		}
		render res as JSON
	}

	//進行中專案
	def nonCloseProject={
		def projects = Project.findAllByClosingDateOrClosingDateIsNull(new Date())
		def res = [:]
		projects?.each(){
			res[it.id] = it.projectName
		}
		render res as JSON
	}

	//View Logs
	def logs={
		def res = [:]
		def dir = new File("logs");
		File[] files = dir.listFiles(new LogFileNameFilter());
		Arrays.sort(files, LastModifiedFileComparator.LASTMODIFIED_REVERSE);
		files?.each(){
			res[it.getName()] = it.getName()
		}
		render res as JSON
	}

}
