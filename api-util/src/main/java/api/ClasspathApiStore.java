package api;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import api.pojo.Api;

import com.alibaba.fastjson.JSON;

/**
 * 磁盘存储器
 * @author is_zhoufeng
 */
public class ClasspathApiStore implements ApiStore{

	private static final Logger log = LoggerFactory.getLogger(ClasspathApiStore.class); 

	/**
	 * API存储目录
	 */
	private static String API_STORE_DIR ;

	private ClasspathApiStore(){
		reload();
	};

	private static ClasspathApiStore instance ;

	private static List<Api> apis = new ArrayList<Api>() ;

	public static ClasspathApiStore getInstance(){
		if(instance == null){
			synchronized (ClasspathApiStore.class) {
				if(instance == null){
					instance = new ClasspathApiStore();
				}
			}
		}
		return instance ;
	}

	public static void setApiStoreDir(String dir){
		ClasspathApiStore.API_STORE_DIR = dir ;
	}

	public static String getApiStoreDir(){
		return ClasspathApiStore.API_STORE_DIR ;  
	}

	@Override
	public Api getByName(String name) {
		for (Api api : apis) { 
			if(api.getName().equals(name)){
				return api ;
			}
		}
		return null ;
	}

	@Override
	public List<Api> getAll() {
		return apis;
	}

	@Override
	public void deleteByName(String name) {
		File dir = new File(API_STORE_DIR);
		if(!dir.exists()){
			dir.mkdirs();
		}
		File[] apiFiles = dir.listFiles();
		if(apiFiles == null){
			return ;
		}
		for (File file : apiFiles) {
			if(file.getName().equals(name)){
				file.delete() ;
				reload();
				break ;  
			}
		}
	}
	
	@Override
	public void save(Api api) {
		File dir = new File(API_STORE_DIR);
		if(!dir.exists()){
			dir.mkdirs();
		}
		File newApi = new File(dir , api.getName());
		String content = apiToJson(api);
		FileOutputStream os = null ;
		try {
			 os = new FileOutputStream(newApi) ; 
			 IOUtils.write(content, os , Charset.forName("utf-8"));
			 reload();
		} catch (Exception e) {
			log.error(e.getMessage() ,e); 
		} finally{
			if(os != null){
				try {
					os.close();
				} catch (IOException e) {
					log.error(e.getMessage(),e);  
				}
			}
		}
	}

	private void reload(){
		File dir = new File(API_STORE_DIR);
		if(!dir.exists()){
			dir.mkdirs();
		}
		File[] apiFiles = dir.listFiles();
		if(apiFiles == null){
			return ;
		}
		List<Api> newApis = new ArrayList<Api>() ;
		for (File file : apiFiles) {
			FileInputStream is = null ;
			try {
				is = new FileInputStream(file);
				String content = IOUtils.toString(is, Charset.forName("utf-8"));
				newApis.add(jsonToApi(content)) ;
			} catch (Exception e) {   
				log.error(e.getMessage() ,e); 
			}finally{
				if(is != null){
					try {
						is.close();
					} catch (IOException e) {
						log.error(e.getMessage(),e);  
					}
				}
			}
		}
		
		//根据group排序
		Collections.sort(newApis,new Comparator<Api>() {
			@Override
			public int compare(Api o1, Api o2) {
				int i = o1.getGroup().compareTo(o2.getGroup()) ;
				if(i != 0){
					return i ;
				}
				return o1.getName().compareTo(o2.getName()); 
			}
		});
		
		apis = newApis ;
	}

	private Api jsonToApi(String json){
		try {
			return JSON.parseObject(json, Api.class);   
		} catch (Exception e) {
			log.error(e.getMessage() ,e);  
		}
		return null ;
	}

	private String apiToJson(Api api){  
		return JSON.toJSONString(api) ;
	}
	
}
