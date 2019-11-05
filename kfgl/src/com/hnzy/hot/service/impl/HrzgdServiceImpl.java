package com.hnzy.hot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnzy.hot.dao.HrzgdDao;
import com.hnzy.hot.pojo.Hrzgd;
import com.hnzy.hot.service.HrzgdService;

@Service
public class HrzgdServiceImpl implements HrzgdService{

	@Autowired
	private HrzgdDao hrzgdDao;
	@Override
	public List<Hrzgd> selGd() {
		// TODO Auto-generated method stub
		return hrzgdDao.selGd();
	}
	@Override
	public void insertGd(Hrzgd Hrzgd) {
		// TODO Auto-generated method stub
		hrzgdDao.insertGd(Hrzgd);
	}
	@Override
	public void updateGd(Hrzgd Hrzgd) {
		// TODO Auto-generated method stub
		hrzgdDao.updateGd(Hrzgd);
	}
	@Override
	public List<Hrzgd> selGdSh() {
		// TODO Auto-generated method stub
		return hrzgdDao.selGdSh();
	}
	@Override
	public void UpdategdSh(Hrzgd Hrzgd) {
		// TODO Auto-generated method stub
		hrzgdDao.UpdategdSh(Hrzgd);
	}
	@Override

	public int selGdtj(String state) {
		// TODO Auto-generated method stub
		return hrzgdDao.selGdtj(state);
	}

	public List<Hrzgd> SelGdBytel(String tel) {
		// TODO Auto-generated method stub

		return hrzgdDao.SelGdBytel(tel);

	}
	@Override
	public int selDjgd(Integer day) {
		// TODO Auto-generated method stub
		return hrzgdDao.selDjgd(day);
	}
	@Override
	public int selWcgd(Integer day) {
		// TODO Auto-generated method stub
		return hrzgdDao.selWcgd(day);
	}
	@Override
	public int selFYqgd(){
		// TODO Auto-generated method stub
		return hrzgdDao.selFYqgd();
	}
	@Override
	public void setyqgd() {
		// TODO Auto-generated method stub
		hrzgdDao.setyqgd( hrzgdDao.selCsb());
	}
	@Override
	public void insertCs(int sj) {
		// TODO Auto-generated method stub
		hrzgdDao.insertCs(sj);
	}
	@Override
	public int selCsb() {
		// TODO Auto-generated method stub
		return hrzgdDao.selCsb();
	}
	@Override
	public int selJjgq() {
		// TODO Auto-generated method stub
		return hrzgdDao.selJjgq( hrzgdDao.selCsb()-2);
	}
	@Override
	public List<Hrzgd> selGdjk() {
		// TODO Auto-generated method stub
		return hrzgdDao.selGdjk();
	}
	@Override

	public Hrzgd selGdByNum(String num) {
		// TODO Auto-generated method stub
		return hrzgdDao.selGdByNum(num);
	}

	public int deleteGd(String gdNum) {
		// TODO Auto-generated method stub
		int del=hrzgdDao.deleteGd(gdNum);
		return del;

	}
	@Override
	public List<Hrzgd> searGdxx(String state, String tjName) {
		// TODO Auto-generated method stub
		return hrzgdDao.searGdxx(state, tjName);
	}
	@Override
	public List<Hrzgd> searGdlx(String state, String tjName) {
		// TODO Auto-generated method stub
		return hrzgdDao.searGdlx(state, tjName);
	}
	@Override
	public List<Hrzgd> selectTjName() {
		// TODO Auto-generated method stub
		return hrzgdDao.selectTjName();
	}
	@Override
	public List<Hrzgd> selectGd(Hrzgd Hrzgd) {
		// TODO Auto-generated method stub
		return hrzgdDao.selectGd(Hrzgd);
	}
}
