package com.hnzy.hot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.hnzy.hot.pojo.Call;
import com.hnzy.hot.service.CellService;

@Controller
@RequestMapping("CellCon")
public class CellController {

	@Autowired
	private CellService cellService;
	
	//获取电话信息
	@RequestMapping("findCell")
	@ResponseBody
	public JSONObject fintCell(String tel){
		JSONObject json=new JSONObject();
		List<Call> findCell=cellService.selCell(tel);
		json.put("selCell",findCell);
		return json;
	}
}
