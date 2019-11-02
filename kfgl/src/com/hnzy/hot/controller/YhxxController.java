package com.hnzy.hot.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.YhxxService;
import com.hnzy.hot.util.JSONSerializer;

@Controller
@RequestMapping("YhxxCon")
public class YhxxController {
	
	@Autowired
	private YhxxService yhxxService;

	
	//导入
	   @RequestMapping("read")
	     public String impotr(HttpServletRequest request, Model model) throws Exception {
	     int adminId = 1;
	     //获取上传的文件
	     MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
	     MultipartFile file = multipart.getFile("Importfile");
	     InputStream in = file.getInputStream();
	     if(file.getSize()>0){
	     //数据导入
	    	 yhxxService.importExcelInfo(in,file,adminId);
	     in.close();
	     	return "Excelsuccess";
	     }else{
	    	 return "faile";
	     }
	   }
	   
	   
	//用户信息
	@RequestMapping("/yhxx" )
	public String yhxx(HttpServletRequest request){
		String yhxx=JSONSerializer.serialize(yhxxService.findYhxx("", "", "",""));
		request.setAttribute("yhxx",yhxx);
		return "Kefu/yhxx";
	}
	
	//用户信息
	@RequestMapping("/searyhxx" )
	@ResponseBody
	public JSONObject searyhxx(HttpServletRequest request,String xqm,String ldh,String dyh,String houseNO){
		JSONObject json=new JSONObject();
		List<Map<String, String>> yhxx=yhxxService.findYhxx(xqm, ldh, dyh,houseNO);
		json.put("yhxx",yhxx);
		return json;
	}
	//添加
	@RequestMapping("addYhxx")
	public String addYhxx(YhInfo yhInfo){
		yhxxService.addYhxx(yhInfo);
		return "redirect:yhxx.action";
	}
	//修改
	@RequestMapping("updateYhxx")
	public String updateYhxx(YhInfo yhInfo){
		yhxxService.updateYhxx(yhInfo);
		return "redirect:yhxx.action";
	}
	//删除
	@RequestMapping("delete")
	@ResponseBody
	public String delete(Integer id){
		yhxxService.delete(id);
		return "redirect:yhxx.action";
	}
	//全删
	@RequestMapping("qdelete")
	@ResponseBody
	public String yhxxDao(){
		yhxxService.qdelete();
		return "redirect:yhxx.action";
	}
	 //小区
		@ResponseBody
		@RequestMapping("findXqm")
		public JSONObject findXqm(HttpSession session){
			JSONObject json=new JSONObject();
			/*json.put("UserName",session.getAttribute("UserName"));*/
			json.put("findXqm",yhxxService.findxqName());
			return json;
			
		}
		
		//查询楼栋
			@RequestMapping("findLd")
			@ResponseBody
			public JSONObject findLd( String xqm) throws UnsupportedEncodingException{
				JSONObject json=new JSONObject();
				xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
				json.put("Ld", yhxxService.findLd(xqm));
				return json;
			}
			
			
          //查找单元
			@RequestMapping("findDy")
			@ResponseBody
			public JSONObject findDy(String xqm,String ldh) throws UnsupportedEncodingException{
				JSONObject json=new JSONObject();
				xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
				json.put("Dy", yhxxService.findDy(xqm, ldh));
				return json;
			}
			 //查找单元
			@RequestMapping("findHh")
			@ResponseBody
			public JSONObject findHh(String xqm,String ldh,String dy) throws UnsupportedEncodingException{
				JSONObject json=new JSONObject();
				xqm=new String(xqm.getBytes("ISO-8859-1"),"utf-8");
				json.put("Hh", yhxxService.findHh(xqm, ldh, dy));
				return json;
			}
}
