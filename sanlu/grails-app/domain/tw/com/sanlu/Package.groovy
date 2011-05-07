package tw.com.sanlu

import java.util.Date;

/**
 * 套餐
 * @author rickhuang
 *
 */
class Package {
	//套餐名
	String packageName
	//內帳套餐價格
	BigDecimal packagePrice
	//外帳套餐價格
	BigDecimal sallingPackagePrice
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static constraints = {
		packageName maxLength:50
	}
}
