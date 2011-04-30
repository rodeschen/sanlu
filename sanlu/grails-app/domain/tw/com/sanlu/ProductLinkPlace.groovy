package tw.com.sanlu

import java.io.Serializable;

/**
 *	產品連結場地關係表
 */
class ProductLinkPlace implements Serializable{
	Product product
	Place place
	//內帳單價
	BigDecimal price
	//銷售單價
	BigDecimal sallingPrice
	//成本單價
	BigDecimal costPrice
	static mapping = {
		id composite:['product', 'place']
	}	
	static constraints = {
	}
}
