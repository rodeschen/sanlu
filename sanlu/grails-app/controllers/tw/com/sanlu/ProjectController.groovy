package tw.com.sanlu
import grails.converters.JSON


class ProjectController extends GridController {

	def index = { }
	def queryAction = {

		def projects = Project.list(max:pageRows,offset:startRow,sort:sortBy,order:isAsc?"asc":"desc")
		render projects as JSON
	}
	public int getCountRow(params){
		100
	}
}
