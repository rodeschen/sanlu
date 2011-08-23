package tw.com.sanlu

import org.codehaus.groovy.grails.web.json.JSONArray;
import org.codehaus.groovy.grails.web.json.JSONObject;
import grails.converters.JSON
import java.util.concurrent.ThreadPoolExecutor.AbortPolicy;


/**
 * Grid model
 * @author rickhuang
 *
 */
abstract class BaseController {
	def manageUrl = [
		"product",
		"funeraler",
		"funeralercompany",
		"employee"
	]
	def beforeInterceptor ={
		def b = true;
		if(manageUrl.contains(params.controller)?1==session.empLevel:session.empLevel ){
			def res = [:]
			params.keySet().each (){
				res[it] = params.get(it);
			}
			params.responseJSON = res as JSON
		}else if(!"main".equals(params.controller) && !"login".equals(params.controller)){
			if(!request.xhr){
				if(params.action){
					redirect(controller:"main",action:"index")
				}else{
					redirect(uri:"/")
				}
			}else{
				render(status: 400, contentType:"text/json", text: "sessionError")
				b = false;
			}
		}
		return b
	}

	protected throwError(message){
		//response.status HttpServletResponse.SC_INTERNAL_SERVER_ERROR
		if(request.xhr){
			def res = "errorMessage:\n" + message
			return render(status: 400, contentType:"text/json", text: res)
		}
	}
}
