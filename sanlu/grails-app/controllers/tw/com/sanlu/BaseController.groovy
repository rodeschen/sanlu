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
		def res = [:]
		params.keySet().each (){
			res[it] = params.get(it);
		}
		params.responseJSON = res as JSON; 
	}
}
