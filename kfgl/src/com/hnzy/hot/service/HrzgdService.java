package com.hnzy.hot.service;

import java.util.List;

import com.hnzy.hot.pojo.Hrzgd;

public interface HrzgdService {
	public List<Hrzgd> selGd();
	//添加工单
	public void insertGd(Hrzgd Hrzgd);
	//修改工单
	public void updateGd(Hrzgd Hrzgd);
	
	//工单审核页面
	public List<Hrzgd> selGdSh();
	//更新工单，工单审核
	public void UpdategdSh(Hrzgd Hrzgd);
	//查找工单监控
	public List<Hrzgd>selGdjk();
	//删除工单
	public int deleteGd(String gdNum);
	public int selGdtj(String state);

	//根据电话查找工单
	public List<Hrzgd> SelGdBytel(String tel);
	
	public int selDjgd(Integer day);
	
	public int selWcgd(Integer day);
	
	public int selFYqgd();
	
	public void setyqgd();
	
	public void insertCs(int sj);
	
	public int selCsb();
	
	public int selJjgq();
	
	public Hrzgd selGdByNum(String num);
	public List<Hrzgd> searGdxx(String state,String tjName);
	
	public List<Hrzgd> searGdlx(String state,String tjName);
	//遍历登记人
	public List<Hrzgd> selectTjName();
	public List<Hrzgd> selectGd(Hrzgd Hrzgd);

}
