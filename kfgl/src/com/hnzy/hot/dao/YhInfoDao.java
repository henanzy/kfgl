package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import com.hnzy.hot.pojo.YhInfo;

public interface YhInfoDao {
	//根据手机号查找用户
	public List<YhInfo> fidnYhByTel(Map<String, Object> map);
	 public List<Map<String, Object>> findXq();
		
		public List<String> findLd(Map<String, Object> map);
		
		public List<String> findDy(Map<String, Object> map);
		
		public List<String> findHh(Map<String, Object> map);
}
