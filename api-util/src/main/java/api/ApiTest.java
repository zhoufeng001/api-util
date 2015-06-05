package api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import api.pojo.Api;

public class ApiTest {
	
	@Test
	public void testAdd(){
		ClasspathApiStore.setApiStoreDir("F:/apis");
		ApiStore apiStroe = ClasspathApiStore.getInstance();
		Api api1 = new Api() ;
		api1.setGroup("用户"); 
		api1.setMethod("post");
		api1.setName("用户注册");
		api1.setUrl("http://127.0.0.1/login.htm"); 
		Map<String, String> headers = new HashMap<String,String>();
		headers.put("token", "12345678") ;
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
		System.out.println(apis);
	}
	
	@Test
	public void testGetByName(){
		ClasspathApiStore.setApiStoreDir("F:/apis");
		ApiStore apiStroe = ClasspathApiStore.getInstance();
		Api api = apiStroe.getByName("用户注册"); 
		System.out.println(api);
	}
	
}
