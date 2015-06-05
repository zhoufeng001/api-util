package api;

import java.util.List;

import api.pojo.Api;

/**
 * Api存储器
 * @author is_zhoufeng
 */
public interface ApiStore {

	Api getByName(String name);
	
	List<Api> getAll();
	
	void deleteByName(String name);
	
	void save(Api api); 
	
}
