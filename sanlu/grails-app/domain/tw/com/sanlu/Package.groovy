package tw.com.sanlu

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
	static constraints = {
		packageName maxLength:50
	}
}
