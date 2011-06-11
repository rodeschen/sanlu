package tw.com.sanlu.excel;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

/**
 * 
 * @author rick
 *
 */
public class ExcelUtility {
	/**
	 * 讀取郵局7.1 »臺灣地區郵遞區號前3碼一覽表(Excel版 )
	 * http://www.post.gov.tw/post/index.jsp
	 * @param filePath
	 * @return Map<String, List<String>>
	 */
	public static Map<String, List<String>> handleAddrExcel(String filePath) {
		Map<String, List<String>> map = new LinkedHashMap<String, List<String>>();
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(new File(filePath));
			Sheet sheet = workbook.getSheet(0);
			String city = null;
			List<String> cityArea = null;
			for (int col = 0; col < sheet.getColumns(); col += 3) {
				for (int row = 1; row < sheet.getRows(); row++) {
					Cell cell = sheet.getCell(col, row);
					if ("".equals(cell.getContents())) {
						continue;
					}
					if (cell.getCellFormat().getFont().getPointSize() == 11) {
						if (col != 0 || row != 1) {
							map.put(city, cityArea);
						}
						city = cell.getContents();
						cityArea = new ArrayList<String>();
					} else {
						cityArea.add(cell.getContents());
					}
				}
			}
			map.put(city, cityArea);
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			workbook.close();
		}
		return map;
	}
}
