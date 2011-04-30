package tw.com.sanlu

/**
 * 連結套餐與商品關係
 * @author rickhuang
 *
 */
class PackageLinkProduct implements Serializable{
	Product prod
	Package pack
	static mapping = {
		id composite:['prod', 'pack']
	}
	static constraints = {
	}
}
