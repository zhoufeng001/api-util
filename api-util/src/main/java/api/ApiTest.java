package api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.alibaba.fastjson.JSON;

import api.pojo.Api;

public class ApiTest {
	
	@Test
	public void testAdd(){
		ClasspathApiStore.setApiStoreDir("F:/apis");
		ApiStore apiStroe = ClasspathApiStore.getInstance();
		Api api1 = new Api() ;
		api1.setGroup("动态"); 
		api1.setMethod("get"); 
		api1.setName("获取动态数量");
		api1.setUrl("http://127.0.0.1/feedsCount.htm"); 
		Map<String, String> headers = new HashMap<String,String>();
		headers.put("token", "12345678") ;
		headers.put("xx", "abc") ;
		api1.setHeaders(headers);
		Map<String, String> params = new HashMap<String,String>();
		params.put("name", "is_zhoufeng") ;
		params.put("password", "12345678") ;
		api1.setParams(params);
		apiStroe.save(api1); 
	}
    
	@Test
	public void testGetAll(){
		ClasspathApiStore.setApiStoreDir("F:/apis");
		ApiStore apiStroe = ClasspathApiStore.getInstance();
		List<Api> apis = apiStroe.getAll();
		String jsonString = JSON.toJSONString(apis);
		jsonString = JsonFormatTool.formatJson(jsonString, "\t"); 
		System.out.println(jsonString);
	}
	
	@Test
	public void testGetByName(){
		ClasspathApiStore.setApiStoreDir("F:/apis");
		ApiStore apiStroe = ClasspathApiStore.getInstance();
		Api api = apiStroe.getByName("用户注册"); 
		System.out.println(api);
	}
	
}
