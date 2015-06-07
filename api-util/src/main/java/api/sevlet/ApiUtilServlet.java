package api.sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import api.ApiStore;
import api.ClasspathApiStore;
import api.HttpClientUtil;
import api.JsonFormatTool;
import api.pojo.Api;
import api.pojo.ApiListVo;

import com.alibaba.fastjson.JSON;

public class ApiUtilServlet extends HttpServlet{

	private static final Logger log = LoggerFactory.getLogger(ApiUtilServlet.class); 

	private ApiStore apiStore ;
	/**
	 * 
	 */
	private static final long serialVersionUID = -2498707957564180997L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(apiStore == null){
			apiStore = ClasspathApiStore.getInstance();
		}
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8"); 
		PrintWriter out = null ;
		try {
			out = response.getWriter();
			String method = request.getParameter("method");
			if("getAllTemplates".equalsIgnoreCase(method)){
				List<Api> apis = apiStore.getAll();
				List<ApiListVo> apiList = new ArrayList<ApiListVo>() ;
				if(apis != null && apis.size() > 0){
					for (Api api : apis) {
						apiList.add(new ApiListVo(api.getName(), api.getGroup(), api.getName())); 
					}
				}
				out.write(JSON.toJSONString(apiList));
			}else if("getTemplateByName".equals(method)){
				String apiName = request.getParameter("name");
				Api api = apiStore.getByName(apiName);
				out.write(JSON.toJSONString(api) );
			}else if("saveTemplate".equals(method)){
				String apiJson = request.getParameter("apiJson");
				ApiVo api = JSON.parseObject(apiJson, ApiVo.class);
				api.parse();     
				apiStore.save(api);
				out.write("成功"); 
			}else if("deleteTemplate".equals(method)){
				String apiName = request.getParameter("name");
				apiStore.deleteByName(apiName); 
				out.write("成功");  
			}else if("doRequest".equals(method)){
				String apiJson = request.getParameter("apiJson");
				ApiVo api = JSON.parseObject(apiJson, ApiVo.class);
				api.parse();   
				String result = null ;
				try {
					result = HttpClientUtil.doRequest(api);
				} catch (Exception e) {
					log.error(e.getMessage() ,e); 
					result = e.getMessage(); 
				}
				out.write(JsonFormatTool.formatJson(result,"\t"));  
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}finally{
			if(out != null){
				out.close();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp); 
	}

	public static class ApiVo extends Api{
		
		private KeyValue[] headerKeyValues ;
		private KeyValue[] paramsKeyValues ;
		public KeyValue[] getHeaderKeyValues() {
			return headerKeyValues;
		}
		public void setHeaderKeyValues(KeyValue[] headerKeyValues) {
			this.headerKeyValues = headerKeyValues;
		}
		public KeyValue[] getParamsKeyValues() {
			return paramsKeyValues;
		}
		public void setParamsKeyValues(KeyValue[] paramsKeyValues) {
			this.paramsKeyValues = paramsKeyValues;
		}
		
		public void parse(){
			if(headerKeyValues != null && headerKeyValues.length > 0){
				if(getHeaders() == null){
					setHeaders(new HashMap<String, String>()); 
				}
				for (KeyValue keyValue : headerKeyValues) {
					getHeaders().put(keyValue.getKey(), keyValue.getValue()) ;
				}
			}
			if(paramsKeyValues != null && paramsKeyValues.length > 0){
				if(getParams() == null){
					setParams(new HashMap<String, String>());
				}
				for (KeyValue keyValue : paramsKeyValues) {
					getParams().put(keyValue.getKey(), keyValue.getValue());
 				}
			}
		}
		
	}
	
	private static class KeyValue{
		private String key ;
		private String value ;
		public String getKey() {
			return key;
		}
		public void setKey(String key) {
			this.key = key;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
	}
	

}
