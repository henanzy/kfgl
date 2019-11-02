package com.hnzy.hot.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hnzy.hot.service.ZskService;
import com.hnzy.hot.util.JSONSerializer;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("ZskCon")
public class ZskController {

	@Autowired
	private ZskService zskService;

	@RequestMapping(value = "getQytl")
	public String getQytl(HttpServletRequest request, HttpServletResponse response, String type,
			RedirectAttributes attr) throws UnsupportedEncodingException {
		String ty = "";
		if (type != null && "".equals(type) == false) {
			ty = new String(type.getBytes("ISO-8859-1"), "utf-8") + "";
		}

		if (ty.equals("") || ty == null) {
			ty = (String) attr.getFlashAttributes().get("type");
		}

		// TODO Auto-generated catch block

		List<Map<String, Object>> zskList = zskService.selAll(ty);

		request.setAttribute("zskList", JSONSerializer.serialize(zskList));
		String url = "";
		if (ty.equals("企业条例")) {
			url = "zhishiku/qiytl";
		}
		if (ty.equals("国家法规")) {
			url = "zhishiku/guojfg";
		}
		if (ty.equals("行业知识")) {
			url = "zhishiku/hangyzs";
		}
		if (ty.equals("系统说明")) {
			url = "zhishiku/xitsm";
		}
		if (ty.equals("问题解答")) {
			url = "zhishiku/wentjd";
		}
		if (ty.equals("热力咨询")) {
			url = "zhishiku/rlzx";
		}
		if (ty.equals("公司公告")) {
			url = "zhishiku/gsgg";
		}
		return url;
	}

	@RequestMapping(value = "insertZsk")
	public String insertZsk(HttpServletRequest request, HttpServletResponse response) {

		return "zhishiku/qiytlwz";
	}

	@RequestMapping(value = "addZsk")
	public String addZsk(HttpServletRequest request, HttpServletResponse response, String title, String contents,
			String tm, String author, String zsktype, RedirectAttributes attr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("author", author);
		map.put("zsktype", zsktype);
		map.put("tm", tm);
		zskService.addZsk(map);

		attr.addAttribute("type", zsktype);
		return "redirect:getQytl.action";
	}

	@RequestMapping(value = "updateZsk")
	public String updateZsk(HttpServletRequest request, HttpServletResponse response, String id, String title,
			String contents, String tm, String author, String zsktype, RedirectAttributes attr) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("title", title);
		map.put("contents", contents);
		map.put("author", author);
		map.put("zsktype", zsktype);
		map.put("tm", tm);
		zskService.updateZsk(map);
		attr.addAttribute("type", zsktype);
		return "redirect:getQytl.action";
	}

	@RequestMapping(value = "deleteZsk")
	@ResponseBody
	public String deleteZsk(HttpServletRequest request, HttpServletResponse response, String id, String type,
			RedirectAttributes attr) {

		attr.addAttribute("type", type);
		zskService.deleteZsk(id);

		return "redirect:getQytl.action";
	}

	@RequestMapping("/fileUp")
	@ResponseBody
	public JSONObject fileUp(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam("img") List<MultipartFile> list) throws IOException {
		String path = this.getClass().getClassLoader().getResource("/").getPath();

		path = "D:/hnzy/apache-tomcat-7.0.92/webapps/img";
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
		
		String fileName = "";
		
		try {
			int i=0;
			for (MultipartFile item : list) {
				Date date = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss") ; 
				String JFRQ = dateFormat.format(date);
				fileName = JFRQ+ item.getName()+i;
				
				item.transferTo(new File(path + "/" + fileName + ".jpg"));
				i++;
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		JSONObject json = new JSONObject();
		String ip =req.getScheme()+ "://"+req.getServerName()+ ":" + req.getServerPort()+"/";
		String imgUrl = ip+"img/" + fileName + ".jpg";//http://192.144.169.217:8090/
       
		json.put("errno", 0);

		json.put("url", imgUrl);

		resp.setContentType("text/html;charset=utf-8");

		return json;
	}

	

}
