package api.pojo;

import java.util.Map;

/**
 * Api 对象
 * @author is_zhoufeng
 */
public class Api {

	/**
	 * API所在分组
	 */
	private String group ;
	
	
	/**
	 * API名称
	 */
	private String name ;
	
	
	/**
	 * 请求Method
	 */
	private String method ;
	
	/**
	 * 请求URL
	 */
	private String url ;
	
	/**
	 * 请求头
	 */
	private Map<String, String> headers ;
	
	/**
	 * 请求参数
	 */
	private Map<String, String> params ;
	
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getMethod() {
		return method;
	}



	public void setMethod(String method) {
		this.method = method;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public Map<String, String> getHeaders() {
		return headers;
	}



	public void setHeaders(Map<String, String> headers) {
		this.headers = headers;
	}



	public Map<String, String> getParams() {
		return params;
	}



	public void setParams(Map<String, String> params) {
		this.params = params;
	}


	@Override
	public String toString() {
		return "Api [group=" + group + ", name=" + name + ", method=" + method
				+ ", url=" + url + ", headers=" + headers + ", params="
				+ params + "]";
	}

}

