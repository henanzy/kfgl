package com.hnzy.hot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.hnzy.hot.pojo.Hrzgd;
@Component
public interface HrzgdDao {
	//获取所有的工单 
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
	
	public int selFYqgd();//非逾期工单
	
	public void setyqgd(int sj);
	
	public void insertCs(int sj);
	
	public int selCsb();
	
	public int selJjgq(int sj);
	
	public Hrzgd selGdByNum( String num);
	
	public List<Hrzgd> searGdxx(@Param("state")String state,@Param("tjName")String tjName);
	public List<Hrzgd> searGdlx(@Param("state")String state,@Param("tjName")String tjName);
	//遍历登记人
	public List<Hrzgd> selectTjName();
	
	public List<Hrzgd> selectGd(Hrzgd Hrzgd);
	
	

}
