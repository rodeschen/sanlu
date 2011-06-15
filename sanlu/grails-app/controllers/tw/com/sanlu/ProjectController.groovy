package tw.com.sanlu
import grails.converters.JSON
import grails.web.JSONBuilder

import java.text.DateFormat
import java.text.SimpleDateFormat

import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery

/**
 * 專案清單
 * @author rick
 *
 */
class ProjectController extends GridController {
	
	
	def index = {
		[rjson : params.responseJSON.toString()]
	}
	@GridQuery
	def queryNonClose = {
		def rows=[] 
		
		def rowCount = Project.countByClosingDateOrClosingDateIsNull(new Date());
		def projects = Project.findAllByClosingDateOrClosingDateIsNull(new Date(),[max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc"])

		//format
		//return ["rowData":projects,"rowCount":rowCount,"format":["projectName":{str -> return "$str xxxxccc"}]]
		["rowData":projects,"rowCount":rowCount]
	}

	def queryid = {
		def project = Project.findById(params.long("id"))
		def res = [:] << 
		[projectName:project.projectName,
		 inDate:project.inDate?.format("yyyy-MM-dd"),
		 inHour:project.inDate?.format("HH"),
		 inMin: project.inDate?.format("mm"),
		 funeralCompany:project.funeralCompany.id,
		 funeraler:project.funeraler.id,
		 employee:project.emp.empNo]
		
		render res as JSON
	}
	
	def addAction = {
		
		DateFormat df = new SimpleDateFormat("yyyy-M-d HH:mm");
		def project = new Project();
		project.projectName = params.projectName
		project.funeralCompany = FuneralCompany.findById(params.long("funeralCompany"))
		project.funeraler = Funeraler.findById(params.long("funeraler"))
		project.emp = Employee.findById(params.long("employee"))
		project.inDate = df.parse(params.inDate + " " + params.inHour + ":" + params.inMin)
		project.save()
		if(project.hasErrors()){
			println project.errors;
		}
		
		def res = ["id" : project.id]
		render res as JSON
	}

	def deleteAction = {
		def project = Project.findById(id)
		return project?project.delete():println("無法刪除")
	}
	def modifyAction={
		def project = Project.findById(id)
		if(!project) {
			return println("無法修改")
		}
		new JSONObject(params.get("data")).each(){
			switch( it.key ){
				case 'projectName':
					project.putAt it.key,it.value
					break
				case 'inDate':
				case 'outDate':
					project.putAt it.key,Utility.shortFormat.parse(it.value)
					break
				case 'sallingTotal':
				case 'total':
					project.putAt it.key,new BigDecimal( it.value)
					break
				default:
					break
			}
		}
		project.save()
		def res = ["IsSuccess" : true]
		render res as JSON
	}
}
