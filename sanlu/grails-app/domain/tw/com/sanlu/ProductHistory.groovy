package tw.com.sanlu

import java.util.Date;

/**
 * 產品修改記錄
 * @author rick
 *
 */
class ProductHistory {
	//產品
	Product product
	//使用專案
	Project project
	//進貨數量/使用數量
	BigDecimal usedQuantity
	//庫存數量
	Integer totalQuantity	
	//最後修改時間
	Date lastUpdated
	//最後修改人
	Employee lastModifyBy
    static constraints = {
		project nullable:true
    }
}
