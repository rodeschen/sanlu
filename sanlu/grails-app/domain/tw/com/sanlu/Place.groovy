package tw.com.sanlu

import java.util.Date;

/**
 * 場地
 * @author rickhuang
 *
 */
class Place {
	String placeName
	//最後修改日期
	Date lastUpdated 
	//最後修改人員
	Employee lastModifyBy

    static constraints = {
		placeName maxSize:50
    }
}
