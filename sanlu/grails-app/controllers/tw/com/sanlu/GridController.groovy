package tw.com.sanlu

import java.util.concurrent.ThreadPoolExecutor.AbortPolicy;

/**
 * Grid model
 * @author rickhuang
 *
 */
abstract class GridController {
	public int page = 0, pageRows = 0, startRow = 0, rowCount = 0, pagerows = 0
	public String sortBy = null
	public boolean pages,isAsc

	def index = {
	}

	def query={
		pages= params.containsKey(GridEnum.PAGE.getCode())

		if (pages) {
			page = params.int(GridEnum.PAGE.getCode())
			pageRows = params.int( GridEnum.PAGEROWS.getCode())
			startRow = (page - 1) * pageRows;
			rowCount = getCountRow(params)
		}

		if (params.containsKey(GridEnum.SORTCOLUMN)) {
			sortBy = params.get(GridEnum.SORTCOLUMN.getCode())
			boolean isAsc = GridEnum.SORTASC.getCode().equals(
					params.boolean(GridEnum.SORTTYPE.getCode()))
		}
		queryAction()
	}

	def queryAction={}
	public abstract int getCountRow(params)
}
