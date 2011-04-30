package tw.com.sanlu;

/**
 * Grid 參數
 * 
 * @author rickhuang
 * 
 */
public enum GridEnum {
	PAGE("page"), PAGEROWS("rows"), TOTAL("total"), RECORDS("records"), SORTTYPE(
			"sord"), SORTASC("asc"), SORTDESC("desc"), SORTCOLUMN("sidx"), CELL(
			"cell"), COL_NAME("name"), COL_INDEX("index"), COL_PARAM(
			"_columnParam");

	private String code;

	GridEnum(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

}
