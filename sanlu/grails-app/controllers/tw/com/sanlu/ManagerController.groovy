package tw.com.sanlu

class ManagerController extends BaseController {

	def index = { }

	def funeralcompany = {}

	def product ={}

	def employee={}

	def purchase={}

	def place={}

	def downloadLog ={
		if(!params.logName.matches(Utility.LOGSEXP)){
			return throwError("log is not exist!!");			
		}
		def file = new File("logs/"+params.logName);
		if(file.exists()){
			response.setContentType("application/octet-stream")
			response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(file.getName(), "UTF8"))
			response.outputStream << file.newInputStream()
		}else{			
			return throwError("log is not exist!!");
		}
	}
}
