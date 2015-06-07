package api;


import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import api.pojo.Api;

public class HttpClientUtil {

	public static String doRequest(Api api) throws Exception{
		if(api.getMethod().equalsIgnoreCase("post")){
			return doPost(api.getUrl(), api.getHeaders(), api.getParams());
		}else if(api.getMethod().equalsIgnoreCase("get")){
			return doGet(api.getUrl(), api.getHeaders(), api.getParams()); 
		}
		return null ;
	}

	public static String doGet(String url , Map<String, String> headers , Map<String, String> params) throws Exception{
		HttpClient hc = new HttpClient() ;
		GetMethod getMethod = new GetMethod(url);
		if(params != null){
			NameValuePair[] param = new NameValuePair[params.size()]; 
			int index = 0 ;
			Iterator<Entry<String, String>> paramKeys = params.entrySet().iterator();
			while(paramKeys.hasNext()){
				Entry<String, String> entry = paramKeys.next();
				param[index++] = new NameValuePair(entry.getKey(), entry.getValue());
			}
			getMethod.setQueryString(param); 
		}
		if(headers != null){
			Iterator<Entry<String, String>> paramKeys = params.entrySet().iterator();
			while(paramKeys.hasNext()){
				Entry<String, String> entry = paramKeys.next(); 
				getMethod.addRequestHeader(entry.getKey(), entry.getValue()); 
			}
		}
		getMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		hc.executeMethod(getMethod);
		String responseString = getMethod.getResponseBodyAsString() ;
		return responseString;
	}
	
	public static String doPost(String url , Map<String, String> headers , Map<String, String> params) throws Exception{
		HttpClient hc = new HttpClient() ;
		PostMethod postMethod = new PostMethod(url);
		if(params != null){
			Iterator<Entry<String, String>> paramKeys = params.entrySet().iterator();
			while(paramKeys.hasNext()){
				Entry<String, String> entry = paramKeys.next();
				postMethod.addParameter(entry.getKey(), entry.getValue()); 
			}
		}
		if(headers != null){
			Iterator<Entry<String, String>> paramKeys = params.entrySet().iterator();
			while(paramKeys.hasNext()){
				Entry<String, String> entry = paramKeys.next(); 
				postMethod.addRequestHeader(entry.getKey(), entry.getValue()); 
			}
		}
		postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
		hc.executeMethod(postMethod);
		String responseString = postMethod.getResponseBodyAsString() ;
		return responseString;
	}

}
