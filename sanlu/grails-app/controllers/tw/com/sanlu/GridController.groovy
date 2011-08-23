package tw.com.sanlu

import grails.converters.JSON

import java.sql.Timestamp

import org.codehaus.groovy.grails.web.json.JSONArray
import org.codehaus.groovy.grails.web.json.JSONObject

import tw.com.sanlu.annotation.GridQuery


/**
 * Grid model
 * @author rickhuang
 *
 */
abstract class GridController extends BaseController {
	public int page = 0, pageRows = 0, startRow = 0, rowCount = 0, pagerows = 0
	def id ,sortBy,columns=[],rowData,format,userdata
	public boolean pages,isAsc

	def beforeInterceptor = {
		def b = super.beforeInterceptor.call()
		if(b){
			def action = delegate.class.declaredFields.find{it.name == actionName}
			if(action && action.isAnnotationPresent(GridQuery)){
				params.delegateAction = actionName
				query()
				return false
			}
		}
	}

	def index = {
	}

	def query={
		def result=[:];
		try{
			pages= params.containsKey(GridEnum.PAGE.getCode())

			if (pages) {
				page = params.int(GridEnum.PAGE.getCode())
				pageRows = params.int(GridEnum.PAGEROWS.getCode())
				startRow = (page - 1) * pageRows;
				//rowCount = getCountRow(params)
				columns = getColumns(params.get(GridEnum.COL_PARAM.getCode()));
			}
			if (params.containsKey(GridEnum.SORTCOLUMN.getCode())) {
				sortBy = params.get(GridEnum.SORTCOLUMN.getCode())
				sortBy = sortBy?sortBy:null
				isAsc = GridEnum.SORTASC.getCode().equals(
						params.get(GridEnum.SORTTYPE.getCode()))
			}
			def res = delegate."${params.delegateAction}"()
			rowData = res["rowData"]
			rowCount = res["rowCount"]
			format = res["format"]
			userdata = res["userdata"]
			def rows=[]
			for (data in rowData) {
				def o=[]
				def row = [:]
				columns.each(){
					def obj = it.split('\\.')
					def tmp = data

					for(i in obj){
						try{
							tmp = tmp.getAt(i)
						}catch(e){
							tmp = ""
						}
					}
					if(tmp instanceof Timestamp){
						tmp = Utility.ADFormat.format(tmp)
					}
					//format ????
					tmp = format?(format.containsKey(it)?format[it](tmp,data):tmp):tmp
					o.add tmp
				}
				row.put(GridEnum.CELL.getCode(),o)
				rows.add row
			}


			result.put(GridEnum.PAGEROWS.getCode(),rows)
			result.put(GridEnum.PAGE.getCode(),page)
			result.put(GridEnum.TOTAL.getCode(),rowCount.intdiv(pageRows)
					+ (rowCount % pageRows > 0 ? 1 : 0))
			result.put(GridEnum.RECORDS.getCode(),rowCount)
			if(userdata)result.put("userdata",userdata)
			render result as JSON
		}catch(Exception e){
			log.error e.dump()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}

	/**
	 * 取得iGrid中的Column Name
	 *
	 * @param params
	 *            String
	 * @return String string[]
	 */
	public getColumns(colInfo) {
		JSONArray arr = new JSONArray(colInfo)
		def colName= new String[arr.size()]
		for (int i = 0; i < arr.size(); i++) {
			JSONObject m =arr.get(i);
			colName[i] =m.containsKey(GridEnum.COL_INDEX.getCode()) ? m.get(GridEnum.COL_INDEX.getCode()) : m
					.get(GridEnum.COL_NAME.getCode());
		}
		return colName
	}

	def delete={
		try{
			id  = params.containsKey("id")?params.long("id"):null
			deleteAction()
		}catch(Exception e){
			log.error e.dump()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}
	def deleteAction={}

	def modify={
		try{
			if(params.containsKey("data")){
				def data = new JSONObject(params.data)
				id  = data.containsKey("id")&&data.get("id")?data.getLong("id"):null
			}
			modifyAction()
		}catch(Exception e){
			log.error e.printStackTrace()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}
	def modifyAction={}

	def insert={
		try{
			insertAction()
		}catch(Exception e){
			log.error e.printStackTrace()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}
	def insertAction={}
}
