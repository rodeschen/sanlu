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
		def pw = params.get("pw")
		Employee employee = Employee.findByEmpNameAndPassword(userId,pw)
		if(employee){
			log.debug userId+" login sucess"
			session.empName =employee.empName
			session.empNo =employee.empNo
			session.empLevel =employee.empLevel
			
		}else{
		log.debug userId+" login fail."
			flash.message = "帳號或密碼不正確"
			
		}		
		redirect(controller:"main",action:"index")
	}
	
	def logout = {
			session.empName =null
			session.empNo =null
			session.empLevel =null
			redirect(action:"index")
		}
}
