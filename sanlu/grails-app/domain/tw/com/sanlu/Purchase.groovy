package tw.com.sanlu

/**
 * 進貨表單
 * @author rickhuang
 *
 */
class Purchase {
	Product product
	//進貨價格
	BigDecimal purchasePrice
	//進貨數量
	Integer quantity
	//進貨日期
	Date purchaseDate
	//最後修改人
	Employee lastModifyBy
    static constraints = {
    }
}
