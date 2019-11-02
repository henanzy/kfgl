package com.hnzy.hot.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hnzy.hot.dao.YhxxDao;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.YhxxService;
import com.hnzy.hot.util.ExcelUtilS;
@Service
public class YhxxServiceImpl implements YhxxService {
    @Autowired
	private YhxxDao yhxxDao;

	@Override
	public void updateYhxx(YhInfo yhInfo) {
		// TODO Auto-generated method stub
		yhxxDao.updateYhxx(yhInfo);
	}


	@Override
	public List<Map<String, String>> findYhxx(String xqName, String buildNO, String cellNO,String houseNO) {
		// TODO Auto-generated method stub
		List<Map<String, String>> dd=yhxxDao.findYhxx(xqName, buildNO, cellNO,houseNO);

		return yhxxDao.findYhxx(xqName, buildNO, cellNO,houseNO);
	}


	@Override
	public void addYhxx(YhInfo yhInfo) {
		// TODO Auto-generated method stub
		yhxxDao.addYhxx(yhInfo);
	}


	@Override
	public List<String> findLd(String xqName) {
		// TODO Auto-generated method stub
		return yhxxDao.findLd(xqName);
	}


	@Override
	public List<String> findDy(String xqName, String buildNO) {
		// TODO Auto-generated method stub
		return yhxxDao.findDy(xqName, buildNO);
	}


	@Override
	public List<String> findxqName() {
		// TODO Auto-generated method stub
		return yhxxDao.findxqName();
	}


	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		yhxxDao.delete(id);
	}


	@Override
	public void importExcelInfo(InputStream in, MultipartFile file, Integer adminId) throws Exception {
		// TODO Auto-generated method stub

		List<List<Object>> listob = ExcelUtilS.getBankListByExcel(in,file.getOriginalFilename());
	    //遍历listob数据，把数据放到List中
	    for (int i = 0; i < listob.size(); i++) {
	        List<Object> ob = listob.get(i);
	        YhInfo salarymanage = new YhInfo();
	       //  通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
	       //判断小区是否为空
	        if(ob.get(0)==null&&ob.get(0)!=""){
	        	salarymanage.setXqName("");
	        
	        }else{
	        	salarymanage.setXqName(String.valueOf(ob.get(0)));
	        }
	        //判断用户名是否为空
	        if(ob.get(1)==null&&ob.get(1)!=""){
	        	   salarymanage.setYhName("");
	        }else{
	        	   salarymanage.setYhName(String.valueOf(ob.get(1)));
	        }
	        //判断卡号为空
	        if(ob.get(2)==null&&ob.get(2)!=""){
	        	   salarymanage.setIdNum("");
	        }else{
	        	   salarymanage.setIdNum(((String) ob.get(2)));
	        }
	        //判断楼栋为空
	        if(ob.get(3)==null&&ob.get(3)!="" ){
	        	  salarymanage.setBuildNo("");;
	        
	        }else{
	            salarymanage.setBuildNo(((String) ob.get(3)));
	        }
	        //判单元为空
	        if(ob.get(4)==null&&ob.get(4)!=""){
	        	  salarymanage.setCellNo("");
	        }else{
	        	  salarymanage.setCellNo(String.valueOf(ob.get(4)));
	        }
	        //判户号为空
	        if(ob.get(5)==null&&ob.get(5)!=""){
	        	  salarymanage.setHouseNo("");
	        }else{
	        	  salarymanage.setHouseNo(String.valueOf(ob.get(5)));
	        }
	     
	       //判断电话号码是否为空
	        if(ob.get(6)==null&&ob.get(6)!=""){
	        	 salarymanage.setTelephone("");
	        }else{
	        	 salarymanage.setTelephone(String.valueOf(ob.get(6)));
	        }
	      //判断缴费
	        if(ob.get(7)==null&&ob.get(7)!=""){
	        	 salarymanage.setSfjf("");
	        }else{
	        	 salarymanage.setSfjf(String.valueOf(ob.get(7)));
	        }
	        //判断建筑面积是否为空
	        if(ob.get(8)==null&&ob.get(8)!=""){
	        	salarymanage.setBuileArea(0.00);
	           
	        }else{
	        	 salarymanage.setBuileArea(Double.valueOf(String.valueOf(ob.get(8))));
	        }
	        
	        //判断供热面积是否为空
	        if(ob.get(9)==null&&ob.get(9)!=""){
	          
	            salarymanage.setHeatArea(0.00);
	        }else{
	            salarymanage.setHeatArea(Double.valueOf(String.valueOf(ob.get(9))));
	        }
	       //判断备注是否为空
	        if(ob.get(10)==null&&ob.get(10)!=""){
	        	  salarymanage.setBz("");
	        }else{
	        	  salarymanage.setBz(String.valueOf(ob.get(10)));
	        }
//	        if(ob.get(11)==null&&ob.get(11)!=""){
//	        	  salarymanage.sethESName("");
//	        }else{
//	        	  salarymanage.sethESName(String.valueOf(ob.get(11)));
//	        }
//	        
	        yhxxDao.addYhxx(salarymanage);
//	        salaryList.add(salarymanage);
	    }
	    
//	    for(int i=0;i<i+50;i++){
//	    	 //批量插入客服表
////		    yhInfoDao.InsertKfxx(salaryList);
//	    	yhInfoDao.InsertkfYhxx(yhInfo);
//		    i=i+50;
//	    }
	}


	@Override
	public void qdelete() {
		// TODO Auto-generated method stub
		yhxxDao.qdelete();
	}


	@Override
	public List<String> findHh(String xqName, String buildNO, String cellNO) {
		// TODO Auto-generated method stub
		return yhxxDao.findHh(xqName, buildNO, cellNO);
	}

	

}
