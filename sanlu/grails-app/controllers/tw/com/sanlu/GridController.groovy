package tw.com.sanlu

import org.codehaus.groovy.grails.web.json.JSONArray;
import org.codehaus.groovy.grails.web.json.JSONObject;
import grails.converters.JSON
import java.util.concurrent.ThreadPoolExecutor.AbortPolicy;


/**
 * Grid model
 * @author rickhuang
 *
 */
abstract class GridController extends BaseController {
	public int page = 0, pageRows = 0, startRow = 0, rowCount = 0, pagerows = 0
	def id ,sortBy,columns=[]


	public boolean pages,isAsc

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
				rowCount = getCountRow(params)
				columns = getColumns(params.get(GridEnum.COL_PARAM.getCode()));
			}

			if (params.containsKey(GridEnum.SORTCOLUMN)) {
				sortBy = params.get(GridEnum.SORTCOLUMN.getCode())
				boolean isAsc = GridEnum.SORTASC.getCode().equals(
						params.boolean(GridEnum.SORTTYPE.getCode()))
			}

			result.put(GridEnum.PAGEROWS.getCode(),queryAction())
			result.put(GridEnum.PAGE.getCode(),page)
			result.put(GridEnum.TOTAL.getCode(),rowCount.intdiv(pageRows)
					+ (rowCount % pageRows > 0 ? 1 : 0))
			result.put(GridEnum.RECORDS.getCode(),rowCount)
			render result as JSON
		}catch(Exception e){
			log.error e.dump()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}
	def queryAction={}
	public abstract int getCountRow(params)

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
			columns = getColumns(new JSONArray(params.get("columnParam")));
			def data = new JSONObject(params.get("data"))
			id  = data.containsKey("id")?data.getLong("id"):null
			modifyAction()
		}catch(Exception e){
			log.error e.printStackTrace()
			render(status: 400, contentType:"text/json", text: e.dump())
		}
	}
	def modifyAction={}
}
