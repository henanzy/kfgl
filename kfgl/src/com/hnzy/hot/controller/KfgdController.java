package com.hnzy.hot.controller;
import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.datasource.DataSourceContextHolder;
import com.hnzy.datasource.DataSourceType;
import com.hnzy.hot.pojo.Call;
import com.hnzy.hot.pojo.Kfgd;
import com.hnzy.hot.service.CellService;
import com.hnzy.hot.service.KfgdService;
import com.hnzy.hot.util.JSONSerializer;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("KfgdCon")
public class KfgdController {
	@Autowired
   private KfgdService kfgdService;
	
	@Autowired
	private CellService cellService;
	
	CellController cellController=new CellController();
	String jsonStr = null;
	String xinwordList;
	//新建工单
	@RequestMapping("/xinjgd")
	public String xinjgd(HttpServletRequest request){
//		request.setAttribute("SelTjName",kfgdService.selectTjName());
		return "Kefu/xinjgd";
	}
	//工单审核
	@RequestMapping("/gongdsh")
	public String gongdsh(HttpServletRequest request){
//		request.setAttribute("SelTjName",kfgdService.selectTjName());
		return "Kefu/gongdsh";
	}

//	查找新增工单
	@RequestMapping(value="findgd",method = RequestMethod.GET)
	public String findgd(HttpServletRequest request,HttpServletResponse response) throws IOException{
	
		List<Kfgd> gfList=kfgdService.selGd();
		xinwordList=JSONSerializer.serialize(gfList);
//		jsonobject.put("xinwordList", xinwordList);			
		request.setAttribute("xinwordList", xinwordList);
		request.setAttribute("SelTjName",kfgdService.selectTjName());
		
		
		return "Kefu/xinjgd";	
	}
	
	@RequestMapping("selGdxxCx")
	@ResponseBody
	public JSONObject sel(String xqm,String ldh,String dyh,String SelGd,String SelTjName ) throws UnsupportedEncodingException{
		JSONObject json=new JSONObject();
		if(xqm!=null&&"".equals(xqm)==false){
			xqm=  new String(xqm.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		if(ldh!=null&&"".equals(ldh)==false){
			ldh=  new String(ldh.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		if(dyh!=null&&"".equals(dyh)==false){
			dyh=  new String(dyh.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		if(SelGd!=null&&"".equals(SelGd)==false){
			SelGd=  new String(SelGd.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		if(SelTjName!=null&&"".equals(SelTjName)==false){
			SelTjName=  new String(SelTjName.getBytes("ISO-8859-1"),"utf-8")+"";
		}
		Kfgd kfgd=new Kfgd();
		kfgd.setXqName(xqm);
		kfgd.setBuildNo(ldh);
		kfgd.setCellNo(dyh);
		kfgd.setState(SelGd);
		kfgd.setTjName(SelTjName);
		List<Kfgd> kfgdList=kfgdService.selectGd(kfgd);
		json.put("kfgdList", kfgdList);
		return json;
	}
	
	//新增工单
	@RequestMapping(value="addGd",method = RequestMethod.POST)
	public String addGd(Kfgd kfgd){
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		String tjTime=df.format(new Date());// new Date()为获取当前系统时间
		kfgd.setGdNum("Gd"+tjTime);
		kfgd.setState("未审核");
		kfgdService.insertGd(kfgd);
		return "redirect:findgd.action";
	}
	//搜索工单信息
	@RequestMapping("searGdxx")
	@ResponseBody
	public JSONObject searGdxx(String state,String tjName) throws UnsupportedEncodingException{
		List<Kfgd> kfglList=kfgdService.searGdxx(state, tjName);
		JSONObject json=new JSONObject();
		json.put("kfglList", kfglList);
		return json;
	}
	
	//搜索工单信息
	@RequestMapping("searGdlx")
	@ResponseBody
	public JSONObject searGdlx(String state,String tjName) throws UnsupportedEncodingException{
		List<Kfgd> kfglList=kfgdService.searGdlx(state, tjName);
		JSONObject json=new JSONObject();
		json.put("kfglList", kfglList);
		return json;
	}
	
	
	
	//客户资料新增工单
	@ResponseBody
	@RequestMapping(value="KzaddGd",method =RequestMethod.POST)
	public JSONObject KzaddGd(String xqName,String buildNo,String cellNo,String houseNo,String telephone,String visCon,String tjName,String tjTime){
		Kfgd kfgd=new Kfgd();
		JSONObject json=new JSONObject();
//		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
//		String tjTime=df.format(new Date());// new Date()为获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		String tjTime1=df.format(new Date());// new Date()为获取当前系统时间
		kfgd.setGdNum("Gd"+tjTime1);
		kfgd.setState("未审核");
		kfgd.setXqName(xqName);
		kfgd.setBuildNo(buildNo);
		kfgd.setCellNo(cellNo);
		kfgd.setHouseNo(houseNo);
		kfgd.setTjName(tjName);
		kfgd.setTjTime(tjTime);
		kfgd.setTelephone(telephone);
		kfgd.setVisCon(visCon);
		kfgdService.insertGd(kfgd);
		json.put("suc",1);
		return json;
		
	}
	//工单审核
	@RequestMapping(value="SelGdSh",method =RequestMethod.GET)
	public String SelGdSh(HttpServletRequest request){
		List<Kfgd> gfList=kfgdService.selGdSh();
		xinwordList=JSONSerializer.serialize(gfList);
		request.setAttribute("xinwordList",xinwordList);
		request.setAttribute("SelTjName",kfgdService.selectTjName());
		return "Kefu/gongdsh";
	}
	//删除工单
	@ResponseBody
	@RequestMapping("deleteGd")
	public JSONObject deleteGd(String gdNum){
		JSONObject json=new JSONObject();
		int del=kfgdService.deleteGd(gdNum);
		json.put("del",del);
		return json;
		
	}
	//工单审核
	@RequestMapping(value="updateSh",method =RequestMethod.POST)
    public String updateSh(Kfgd kfgd){
		System.out.println(kfgd.getGdState());
		kfgdService.updateGd(kfgd);
		return "redirect:SelGdSh.action";
    }
	//修改工单
	@RequestMapping(value="updateGd",method =RequestMethod.POST)
    public String updateGd(Kfgd kfgd){
		String state=kfgd.getState();
		if(state.equals("回退修改")){
			state="未审核";
			kfgd.setState(state);
		}		
		kfgdService.updateGd(kfgd);
		return "redirect:findgd.action";
    }
	//更新工单审核
	@RequestMapping(value="updateGdSh",method =RequestMethod.POST)
    public String updateGdSh(Kfgd kfgd){
		System.out.println(kfgd.getGdState());
		kfgdService.UpdategdSh(kfgd);
		return "redirect:SelGdSh.action";
    }
	@RequestMapping("gdjk")
	public String gdjk(HttpServletRequest request,HttpServletResponse response) throws IOException{
	
		List<Kfgd> gfList=kfgdService.selGdjk();
		
		xinwordList=JSONSerializer.serialize(gfList);
//		jsonobject.put("xinwordList", xinwordList);			
		request.setAttribute("xinwordList", xinwordList);
		request.setAttribute("SelTjName",kfgdService.selectTjName());
		return "Kefu/gongdjk";	
	}
	
	@RequestMapping("gdtj")
	public String gdtj(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		List<Kfgd> gfList=kfgdService.selGdjk();
		xinwordList=JSONSerializer.serialize(gfList);
//		jsonobject.put("xinwordList", xinwordList);			
		request.setAttribute("xinwordList", xinwordList);
		Map <String,Integer>map =new HashMap<String,Integer>();
		map.put("未审核", kfgdService.selGdtj("未审核"));
		map.put("审核通过", kfgdService.selGdtj("审核通过"));
		map.put("回退修改", kfgdService.selGdtj("回退修改"));
		map.put("作废", kfgdService.selGdtj("作废"));
		map.put("已接单", kfgdService.selGdtj("已接单"));
		map.put("已完成", kfgdService.selGdtj("已完成"));
		map.put("已回访", kfgdService.selGdtj("已回访"));
		Map <String,Integer>map1 =new HashMap<String,Integer>();
		map1.put("其它工单", kfgdService.selFYqgd());
		map1.put("逾期工单", kfgdService.selGdtj("逾期工单"));
		String TjMap=JSONSerializer.serialize(map);
		String TjMap1=JSONSerializer.serialize(map1);
		request.setAttribute("TjMap", TjMap);
		request.setAttribute("TjMap1", TjMap1);
		List<Integer>djCount=new ArrayList<Integer>();
		List<Integer>wcCount=new ArrayList<Integer>();
		List<Integer>callCount=new ArrayList<Integer>();
		
		for(int i=0;i<7;i++){
			
			djCount.add(kfgdService.selDjgd(i));
			wcCount.add(kfgdService.selWcgd(i));
			DataSourceContextHolder.setDbType(DataSourceType.ds);
			callCount.add(cellService.getCallCount(i));
			DataSourceContextHolder.setDbType(DataSourceType.dse);
		}
		DataSourceContextHolder.setDbType(DataSourceType.ds);
		List<Call> findCell=cellService.getCall();
		DataSourceContextHolder.setDbType(DataSourceType.dse);
		String djCountJson=JSONSerializer.serialize(djCount);
		String wcCountJson=JSONSerializer.serialize(wcCount);
		String callCountJson=JSONSerializer.serialize(callCount);
		
		String findCellJson=JSONSerializer.serialize(findCell);
		request.setAttribute("djCountJson", djCountJson);
		request.setAttribute("wcCountJson", wcCountJson);
		request.setAttribute("callCountJson", callCountJson);
		request.setAttribute("findCallJson", findCellJson);
		
		return "Kefu/tongjfx2";	
	}
	
	@RequestMapping("insertCs")
	@ResponseBody
	public JSONObject insertCs ( Integer sj ,HttpServletRequest request){
	
		JSONObject json=new JSONObject();
		//根据手机号搜索
		kfgdService.insertCs(sj);
		json.put("msg", "提交成功");
		 
		return json;
	}
	
	@RequestMapping("selCsb")
	@ResponseBody
	public JSONObject selCsb (HttpServletRequest request){
	
		JSONObject json=new JSONObject();
		//根据手机号搜索
		int ysj= kfgdService.selCsb();
		json.put("ysj", ysj);		 
		return json;
	}
	
	@RequestMapping("selJjgq")
	@ResponseBody
	public JSONObject selJjgq (HttpServletRequest request){
	
		JSONObject json=new JSONObject();
		//根据手机号搜索
		int gqgd= kfgdService.selJjgq();
		json.put("gqgd", gqgd);		 
		return json;
	}
	
	@RequestMapping("geiYinpin")
	@ResponseBody
	public JSONObject geiYinpin (HttpServletRequest request,String url){
	
		JSONObject json=new JSONObject();
		String qurl=url.replaceAll("[??]", "/");
		try {
			//System.out.println(url);
			Desktop.getDesktop().open(new File("D:/YinZiCallCenter/Record/"+qurl));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return json;
	}
	
	@RequestMapping("selGdByNum")
	@ResponseBody
	public JSONObject selGdByNum (HttpServletRequest request,String num){
	
		JSONObject json=new JSONObject();
		Kfgd gd = kfgdService.selGdByNum(num);
		json.put("shr", gd.getAuditors());
		json.put("shsj", gd.getAuditTime());
		json.put("shyj", gd.getAuditOpin());
		return json;
	}
	
}
