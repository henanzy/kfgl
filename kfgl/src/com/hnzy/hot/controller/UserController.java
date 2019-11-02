package com.hnzy.hot.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnzy.datasource.DataSourceContextHolder;
import com.hnzy.datasource.DataSourceType;
import com.hnzy.hot.pojo.Call;
import com.hnzy.hot.pojo.User;
import com.hnzy.hot.pojo.YhInfo;
import com.hnzy.hot.service.CellService;
import com.hnzy.hot.service.KfgdService;
import com.hnzy.hot.service.UserService;
import com.hnzy.hot.service.YhInfoService;
import com.hnzy.hot.util.JSONSerializer;
import com.hnzy.hot.util.MD5Util;
import com.hnzy.hot.util.StringUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private YhInfoService yhInfoService;
	@Autowired
	private KfgdService kfgdService;
	@Autowired
	private UserService userServer;
	@Autowired
	private CellService callService;
	public List<YhInfo> YhInfoList;

	private String weburl;
	private String ctiip;
	private String ipport;
	private String seatpass;
	private String isautologin;
	private String isshowcall;
	private String ishidetel;
	private String extno;

	// 跳转到登录页面
	@RequestMapping("/toLogin")
	public String tologin() {
		return "index";
	}

	// 来电弹屏和首页
	@RequestMapping("/home")
	public String home(String mobile, HttpServletRequest request, HttpSession session, String UserName, String fjh) {

		if (mobile != null) {
			// System.out.println(mobile);
			String[] mobiles = mobile.split("\\|");
			String tel = mobiles[2];
			if (tel.substring(0, 1).equals("0")) {
				tel = tel.substring(1);
			}
			// 根据手机号搜索
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("tel", tel);
			YhInfoList = yhInfoService.findYhByTel(map);
			if (YhInfoList != null) {
				// 根据电话查找用户信息
				String yhInfo = JSONSerializer.serialize(YhInfoList);
				// 根据电话查找来电记录
				DataSourceContextHolder.setDbType(DataSourceType.ds);
				List<Call> cellList = callService.selCell(tel);

				String findCallByTel = JSONSerializer.serialize(cellList);

				// 根据电话查找工单
				DataSourceContextHolder.setDbType(DataSourceType.dse);
				String selTelByGd = JSONSerializer.serialize(kfgdService.SelGdBytel(tel));
				session.setAttribute("yhInfo", yhInfo);
				session.setAttribute("tel", tel);
				session.setAttribute("selTelByGd", selTelByGd);
				session.setAttribute("findCallByTel", findCallByTel);

			}
		} else {
			// 加反斜线就表示在默认包目录，不加则表示在与当前类同路径去查找该属性文件
			String Cti_PATH_NAME = "/tc.properties";
			// 日志文件
			InputStream in = getClass().getResourceAsStream(Cti_PATH_NAME);
			Properties props = new Properties();

			try {
				props.load(in);
				seatpass = props.getProperty("tc.seatpass");
				ctiip = props.getProperty("tc.ctiip");
				ipport = props.getProperty("tc.ipport");

				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (fjh == null) {
				fjh = (String) session.getAttribute("extno");
			}
			
			session.setAttribute("yhInfo", "1");
			session.setAttribute("tel", "1");
			session.setAttribute("selTelByGd", "1");
			session.setAttribute("findCallByTel", "1");

		}
		// 加反斜线就表示在默认包目录，不加则表示在与当前类同路径去查找该属性文件
		String Cti_PATH_NAME = "/tc.properties";
		// 日志文件
		InputStream in = getClass().getResourceAsStream(Cti_PATH_NAME);
		Properties props = new Properties();

		try {
			props.load(in);
			seatpass = props.getProperty("tc.seatpass");
			ctiip = props.getProperty("tc.ctiip");
			ipport = props.getProperty("tc.ipport");

			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (fjh == null) {
			fjh = (String) session.getAttribute("extno");
			if(fjh==null||fjh==""){
				fjh ="801";
			}
		}
		session.setAttribute("extno", fjh);
		request.setAttribute("extno", fjh);
		request.setAttribute("seatpass", seatpass);
		request.setAttribute("ctiip", ctiip);
		request.setAttribute("ipport", ipport);
		
		// return "navi";
		return "home";
	}

	// 根据电话查找工单
	@RequestMapping("SelLdtpByTel")
	@ResponseBody
	public JSONObject SelLdtpByTel(String tel, String XqName, String BuildNo, String CellNO, String hh,
			HttpServletRequest request, HttpSession session) {
		JSONObject json = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tel", tel);
		map.put("XqName", getUtf8(XqName));
		map.put("BuildNo", getUtf8(BuildNo));
		map.put("CellNO", getUtf8(CellNO));
		map.put("hh", getUtf8(hh));
		// 根据手机号搜索
		YhInfoList = yhInfoService.findYhByTel(map);
		if (YhInfoList != null) {
			// 根据电话查找用户信息
			String yhInfo = JSONSerializer.serialize(YhInfoList);
			String selTelByGd = JSONSerializer.serialize(kfgdService.SelGdBytel(tel));
			// 根据电话查找来电记录
			DataSourceContextHolder.setDbType(DataSourceType.ds);
			String findCallByTel = JSONSerializer.serialize(callService.selCell(tel));
			// 根据电话查找工单
			DataSourceContextHolder.setDbType(DataSourceType.dse);
			session.setAttribute("tel", tel);
			json.put("yhInfo", yhInfo);
			json.put("tel", tel);
			json.put("selTelByGd", selTelByGd);
			json.put("findCallByTel", findCallByTel);
		}
		return json;
	}

	// 根据来电手机号搜索
	@RequestMapping("SelTel")
	public String SelTel(HttpServletRequest request, String tel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tel", tel);
		YhInfoList = yhInfoService.findYhByTel(map);
		String yhInfo = JSONSerializer.serialize(YhInfoList);
		request.setAttribute("yhInfo", yhInfo);
		return "home";
	}

	@RequestMapping("/left")
	public String left() {
		return "left";
	}

	/*
	 * @RequestMapping("/index") public String index(){ return "index"; }
	 */
	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	// 缁熻鍒嗘瀽
	@RequestMapping("/tongjfx2")
	public String tongjfx2() {
		return "Kefu/tongjfx2";
	}

	// 客服资料
	@RequestMapping("/kehzl")
	public String kehzl(HttpSession session, HttpServletRequest request) {
		if ("".equals(session.getAttribute("tel")) || session.getAttribute("tel") == null) {
			session.setAttribute("yhInfo", "1");
			session.setAttribute("tel", "1");
			session.setAttribute("selTelByGd", "1");
			session.setAttribute("findCallByTel", "1");
		} else if (!"".equals(session.getAttribute("tel")) || session.getAttribute("tel") != null) {
			// 根据手机号搜索
			String tel = (String) session.getAttribute("tel");
			if (tel.length() == 11) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("tel", tel);
				YhInfoList = yhInfoService.findYhByTel(map);
				if (YhInfoList != null) {
					// 根据电话查找用户信息
					String yhInfo = JSONSerializer.serialize(YhInfoList);
					String selTelByGd = JSONSerializer.serialize(kfgdService.SelGdBytel(tel));
					// 根据电话查找来电记录
					DataSourceContextHolder.setDbType(DataSourceType.ds);
					String findCallByTel = JSONSerializer.serialize(callService.selCell(tel));
					// 根据电话查找工单
					DataSourceContextHolder.setDbType(DataSourceType.dse);
					request.setAttribute("tel", tel);
					request.setAttribute("yhInfo", yhInfo);
					request.setAttribute("selTelByGd", selTelByGd);
					request.setAttribute("findCallByTel", findCallByTel);
				}
			}
		}
		return "Kefu/kehzl";
	}

	// 宸ュ崟瀹℃牳
	@RequestMapping("/gongdsh")
	public String gongdsh() {
		return "Kefu/gongdsh";
	}

	// 宸ュ崟鐩戞帶
	@RequestMapping("/gongdjk")
	public String gongdjk() {
		return "Kefu/gongdjk";
	}

	// 鍙傛暟璁剧疆
	@RequestMapping("/canssz")
	public String canssz() {
		return "Kefu/canssz";
	}

	// 鎹㈢儹绔欒繍琛岀鐞�
	@RequestMapping("/yunxgl2")
	public String yunxgl2() {
		return "huanre/yunxgl2";
	}

	@ResponseBody
	@RequestMapping("/login")
	public JSONObject login(HttpSession session, String username, String password, HttpServletRequest request)
			throws UnsupportedEncodingException {
		JSONObject jsonObject = new JSONObject();
		if (StringUtil.isNoEmpty(username) && StringUtil.isNoEmpty(password)) {
			username = new String(username.getBytes("ISO-8859-1"), "utf-8") + "";
			password = new String(password.getBytes("ISO-8859-1"), "utf-8") + "";
			password = MD5Util.string2MD5(password);
			User info = userServer.findUserByNameAndMD5(username, password);
			if (info != null) {

				request.getSession().setAttribute("admins", info);
				request.getSession().setAttribute("UserName", info.getUserName());
				request.getSession().setAttribute("PassWord", info.getPassword());
				request.getSession().setAttribute("ID", info.getId());

				jsonObject.put("msg", "0");

			} else {

				jsonObject.put("msg", "1");
			}

		}
		return jsonObject;
	}

	@RequestMapping("updapwd")
	@ResponseBody
	public String updapwd(HttpSession session, HttpServletRequest request, String oldpassword, String newpassword,
			String username) throws UnsupportedEncodingException {
		// JSONObject jsonObject=new JSONObject();
		username = new String(username.getBytes("ISO-8859-1"), "utf-8");

		String password11 = MD5Util.string2MD5(oldpassword);
		String password12 = MD5Util.string2MD5(newpassword);
		String msg = "";
		Integer ID = (Integer) session.getAttribute("ID");
		// System.out.println(ID);
		// System.out.println(password11);
		// System.out.println(userServer.findUserPass(ID));
		if (password11.equals(userServer.findUserPass(ID))) {
			User user = new User();
			user.setId(ID);
			user.setUserName(username);
			user.setPassword(password12);
			userServer.update(user);
			msg = "0";
		} else {
			msg = "1";
		}

		return msg;
	}

	/* 企业条例 */
	@RequestMapping("/qiytl")
	public String qiytl() {
		return "zhishiku/qiytl";
	}

	/* 企业条例新增文章 */
	@RequestMapping("/qiytlwz")
	public String qiytlwz() {
		return "zhishiku/qiytlwz";
	}

	// 新增登录用户
	@ResponseBody
	@RequestMapping("addYh")
	public JSONObject addYh(HttpServletRequest request, String username, String password)
			throws UnsupportedEncodingException {
		username = new String(username.getBytes("ISO-8859-1"), "utf-8");
		JSONObject json = new JSONObject();
		// 根据用户名字查找用户是否存在
		User user = userServer.findByName(username);
		if (user != null) {
			// 用户名称已存在
			json.put("msg", "0");
		} else {
			password = MD5Util.string2MD5(password);
			userServer.InsUsePass(username, password);
			json.put("msg", "1");
		}

		return json;

	}

	/* 企业条例国家法规 */
	@RequestMapping("/guojfg")
	public String guojfg() {
		return "zhishiku/guojfg";
	}

	/* 企业条例行业知识 */
	@RequestMapping("/hangyzs")
	public String hangyzs() {
		return "zhishiku/hangyzs";
	}

	/* 企业条例行业知识 */
	@RequestMapping("/xitsm")
	public String xitsm() {
		return "zhishiku/xitsm";
	}

	/* 企业条例行业知识 */
	@RequestMapping("/wentjd")
	public String wentjd() {
		return "zhishiku/wentjd";
	}

	/* 员工定位 */
	@RequestMapping("/shisdw")
	public String shisdw() {
		return "dingwei/shisdw";
	}

	/* 历史轨迹 */
	@RequestMapping("/lisgj")
	public String lisgj() {
		return "dingwei/lisgj";
	}

	/* 主页导航 */
	@RequestMapping("/navi")
	public String navi() {
		return "navi";
	}

	private String getUtf8(String str) {
		if (str != null) {
			try {
				str = new String(str.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return str;
	}
}