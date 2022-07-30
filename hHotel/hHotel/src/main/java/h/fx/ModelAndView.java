package h.fx;

import java.util.HashMap;
import java.util.Map;

// 항상 같은 타입으로 리턴하기 위한 규격
public class ModelAndView {
	private String viewName; // view의 위치
	private Map<String, Object> model = new HashMap<>();
	
	public ModelAndView() {
		
	}
	
	public ModelAndView(String viewName) {
		setViewName(viewName);
	}
	
	// key value 한 쌍만 넘기면 될때 사용
	public ModelAndView(String viewName, String key, Object value) {
		setViewName(viewName); // this.viewName = viewName과 같다
		addObject(key, value);
	}
	
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public Map<String, Object> getModel() {
		return model;
	}
	
	public void addObject(String key, Object value) {
		model.put(key, value);
	}
	
	
}
