package tw.com.sanlu
import grails.converters.JSON
import java.sql.Timestamp
import java.text.DateFormat

import org.codehaus.groovy.grails.web.json.JSONObject

/**
 * 專案清單
 * @author rick
 *
 */
class ProjectController extends GridController {
	
	def index = { }
	def queryAction = {

		//def projects = Project.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		//		def c = Project.createCriteria()
		//		def results = c.list (max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc") {
		//			isNull("holderGender")
		//			or
		//			gt("outDate",date())
		//			order("holderLastName", "desc")
		//		}
		def rows=[]
		def row = [:]
		def projects = Project.findAll("from Project as p where p.outDate is null or p.outDate > day(current_date()) "+(sortBy?"order by "+sortBy+(isAsc?" asc":" desc"):""),[max:pageRows,offset:startRow])
		for (project in projects) {
			//def o =[:]
			def o=[]
			columns.each(){
				def obj = it.split('\\.')
				def aa = project

				for(i in obj){
					//		system.out.print i
					aa = aa.getAt(i)
				}
				if(aa instanceof Timestamp){

					aa=	Utility.shortFormat.format(aa)
				}
				o.add aa
				//o.put("${it}", aa)

			}
			row.put(GridEnum.CELL.getCode(),o)
			rows.add row
		}
		return rows
	}
	public int getCountRow(params){
		Project.count()
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
