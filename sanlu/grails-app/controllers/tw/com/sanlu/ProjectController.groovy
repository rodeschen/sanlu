package tw.com.sanlu
import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject


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
}
