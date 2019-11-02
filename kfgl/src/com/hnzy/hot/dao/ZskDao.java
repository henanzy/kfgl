package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

public interface ZskDao {
				
    public List<Map<String, Object>> selAll(String zsktype);
	
	public Map<String, Object> selZskById(String id);
	
	public void addZsk(Map<String, Object> map);
	
	public void deleteZsk(String id);
	
	public void updateZsk(Map<String, Object> map);
	
}
