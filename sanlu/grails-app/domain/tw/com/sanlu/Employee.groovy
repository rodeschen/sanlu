package tw.com.sanlu

import java.util.Date;

/**
 * 員工資料
 * @author rick
 */
class Employee {
	String empNo
	String empName
	String password
	//雇用日期
	Date hireDate
	//員工層級5最大
	Integer empLevel
	//性別
	String gender
	//已離職
	Boolean isLeft =false
	static constraints = {
		empNo minSize:5,maxSize:5,blank:false, unique:true
		empName maxSize:8,blank:false
		empLevel size:1,range:0..5
		password minSize:4,password:true
		gender(inList:["M", "F"])		
	}
}
