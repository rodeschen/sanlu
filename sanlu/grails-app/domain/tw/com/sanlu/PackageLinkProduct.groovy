package tw.com.sanlu

import java.util.Date;

/**
 * 連結套餐與商品關係
 * @author rickhuang
 *
 */
class PackageLinkProduct implements Serializable{
	Product prod
	Package pack
	//最後修改日期
	Date lastUpdated
	//最後修改人員
	Employee lastModifyBy
	static mapping = {
		id composite:['prod', 'pack']
	}
	static constraints = {
	}
}
