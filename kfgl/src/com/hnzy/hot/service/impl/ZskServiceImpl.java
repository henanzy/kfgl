package com.hnzy.hot.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.ZskDao;
import com.hnzy.hot.service.ZskService;


@Service
public class ZskServiceImpl implements ZskService{

	@Autowired
	private ZskDao zskDao;

	@Override
	public List<Map<String, Object>> selAll(String zsktype) {
		// TODO Auto-generated method stub
		return zskDao.selAll(zsktype);
	}

	@Override
	public Map<String, Object> selZskById(String id) {
		// TODO Auto-generated method stub
		return zskDao.selZskById(id);
	}

	@Override
	public void addZsk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		zskDao.addZsk(map);
	}

	@Override
	public void deleteZsk(String id) {
		// TODO Auto-generated method stub
		zskDao.deleteZsk(id);
	}

	@Override
	public void updateZsk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		zskDao.updateZsk(map);
	}

	

	
}
