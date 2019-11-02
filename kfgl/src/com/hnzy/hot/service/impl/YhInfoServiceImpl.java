package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.datasource.DataSourceContextHolder;
import com.hnzy.datasource.DataSourceType;
import com.hnzy.hot.dao.YhInfoDao;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.YhInfoService;

@Service
public class YhInfoServiceImpl implements YhInfoService {

	@Autowired
	private YhInfoDao yhInfoDao;
	
	//根据手机号查找用户
	public List<YhInfo> findYhByTel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		DataSourceContextHolder.setDbType(DataSourceType.dse);
		return yhInfoDao.fidnYhByTel(map);
	}
	
	@Override
	public List<Map<String, Object>> findXq() {
		// TODO Auto-generated method stub
		return yhInfoDao.findXq();
	}

	@Override
	public List<String> findLd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhInfoDao.findLd(map);
	}

	@Override
	public List<String> findDy(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhInfoDao.findDy(map);
	}

	@Override
	public List<String> findHh(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return yhInfoDao.findHh(map);
	}
}
