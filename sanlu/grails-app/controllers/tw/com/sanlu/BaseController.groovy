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
	def manageUrl = ["product","funeraler","funeralercompany","employee"]
	def beforeInterceptor ={
		if(manageUrl.contains(params.controller)?1==session.empLevel:session.empLevel ){
			def res = [:]
			params.keySet().each (){
				res[it] = params.get(it);
			}
			params.responseJSON = res as JSON
		}else if(!"main".equals(params.controller) && !"login".equals(params.controller)){
			redirect(controller:"main",action:"index")
		}
	}
}
