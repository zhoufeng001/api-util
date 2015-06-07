package api.pojo;

public class ApiListVo {
	
	private String value ;
	
	private String group ;
	
	private String text ;

	public ApiListVo() {}

	public ApiListVo(String value, String group, String text) {
		this.value = value;
		this.group = group;
		this.text = text;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	

}
