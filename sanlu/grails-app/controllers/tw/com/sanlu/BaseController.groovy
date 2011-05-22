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
	def beforeInterceptor ={
		if(session.empLevel){
			def res = [:]

			params.keySet().each (){
				res[it] = params.get(it);
			}
			params.responseJSON = res as JSON
		}else{
			if(params.controller != "main"){
				//redirect(controller:"main",action:"index")
			}else if(params.action!="login"){
				//redirect(controller:"main",action:"login")
			}
		}
	}
}
