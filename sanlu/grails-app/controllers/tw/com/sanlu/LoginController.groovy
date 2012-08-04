package tw.com.sanlu

/**
 * 登入
 * @author rick
 *
 */
class LoginController extends BaseController {

	def index = { }

	def login = {
		def userId = params.get("id")
		def pw = params.get("pw").encodeAsMD5()
		Employee employee = Employee.findByEmpNameAndPassword(userId,pw)
		if(employee && !employee.isLeft){
			log.info userId+" login sucess"
			session.empName =employee.empName
			session.empNo =employee.empNo
			session.empLevel =employee.empLevel
			session.employee = employee			
			session.errMsg = ""
		}else{
			log.info userId+" login fail."
			session.errMsg = "帳號或密碼錯誤"
		}		
		redirect(uri:"/")
	}
	
	def logout = {
			session.empName =null
			session.empNo =null
			session.empLevel =null
			redirect(uri:"/")
		}
}
