<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>客服系统</title>

<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../js/layer/2.4/skin/layer.css" media="screen" />
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css"  />
<link rel="stylesheet" type="text/css" href="../css/admin-all.css"media="screen" /> 

<link rel="stylesheet" type="text/css" href="../css/mws.theme.css" media="screen" />


<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript" src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../plugins/flot/excanvas.min.js"></script>
<![endif]-->
<!-- <script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.resize.min.js"></script> -->
<script type="text/javascript" src="../plugins/colorpicker/colorpicker.js"></script>
<script type="text/javascript" src="../plugins/tipsy/jquery.tipsy.js"></script>
<script type="text/javascript" src="../plugins/sourcerer/Sourcerer-1.2.js"></script>
<script type="text/javascript" src="../plugins/jquery.placeholder.js"></script>
<script type="text/javascript" src="../plugins/jquery.validate.js"></script>
<script type="text/javascript" src="../plugins/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../plugins/spinner/ui.spinner.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>


<!-- 选项卡 -->
<link rel="stylesheet" type="text/css" href="../tag/css/style.css" />
<link rel="stylesheet" type="text/css" href="../tag/css/tabstyle.css" />
<script type="text/javascript" src="../tag/js/tab.js"></script>



<!-- 侧边树状图 -->
<link rel="stylesheet" type="text/css" href="../css/treecss/jquery.treemenu.css" />
<script type="text/javascript" src="../js/treejs/jquery.treemenu.js"></script>

<script type="text/javascript" src="../js/swfobject.js">
</script>

<!-- <script type="text/javascript">
var yhInfoj=${yhInfo};
var tel=${tel}
alert(yhInfoj);
</script> -->
	<style>
			*{
				margin: 0;
				padding: 0;
			}
			html,body{
				width: 100%;
				height:100%;
			}
			#overall{
				width: 100%;
				height:100%;
				min-width: 1000px;
				min-height: 600px;
			}
			
			/*导航*/
			#navi{
				width: 100%;
				height: 62px;
				line-height: 62px;
				background: url(../images/navimap/header-bg.png) repeat-x;
				color: #FFFFFF;
				font-size: 16px;
				position: absolute;
				top: 0px;
				left: 0px;
			}
			#line{
				width: 100%;
				height: 4px;
				background-color: #C5D52B;
				margin-top: 58px;
			}
			#title,
			#login,
			#icon{
				display: inline-block;
				width: 200px;
				height: 60px;
				line-height: 60px;
			}
			#title{
				position: absolute;
				top: 0px;
				left: 10%;
				width: 430px;
				font-size: 30px;
				color: #C5D52B;
			}
			#login{
				position: absolute;
				top: 0px;
				right: 20px;
			}
			#icon{
				position: absolute;
				top: 0px;
				left: 40px;
			}
			#icon img{
				width: 26px;
				height: 26px;
				/* vertical-align: middle; */
				margin-top:16px;
			}
			.login_user img,
			.login_out img{
				width: 20px;
				height: 20px;
				vertical-align: middle;
				margin-right: 4px;
			}
			.login_out{
				cursor: pointer;
			}
			.login_interval{
				margin: 0 10px;
			}
			#content{
				width: 100%;
				height: 100%;
				overflow: hidden;
			}
			#mainIframe{
				width: 100%;
				height: 100%;
			}
			
			/*左*/
			#bannerleftopen{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(../images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 30%;
				left: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-right: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-right-radius: 8px;
				border-bottom-right-radius: 8px;
			}
			#bannerleftopen img{
				display: block;
				margin: 28px auto;
			}
			
			#leftcontent{
				display: block;
				position: absolute;
				top: 90px;
				width: 280px;
				height: 420px;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				margin-left: 1%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
				font-size: 14px;
			}
			.main_left{
				width: 80%;
				height: 90%;
				margin: 30px auto;
			}
			.main_left p{
				width: 100%;
				height: 50px;
				line-height: 50px;
				text-align: left;
				border-bottom: 1px dashed #AAAAAA;
			}
			.main_left p label{
				display: inline-block;
				width: 50%;
			}
			.main_left p span.span_num{
				display: inline-block;
				width: 25%;
				height: 40px;
				text-align: center;
				border-bottom: 1px solid #AAAAAA;
			}
			.main_left p span.span_nuit{
				display: inline-block;
				width: 10%;
			}
			#bannerleftclose{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrowleft.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 40%;
				right: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-right: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-right-radius: 8px;
				border-bottom-right-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			
			.frame-bg-corner{
				position: absolute;
				width: 15px;
				height: 15px;
			}
			.frame-bg-lt {
			    top: 0;
			    left: 0px;
			    background: url("../images/navimap/frame-lt.png") no-repeat;
			}
			.frame-bg-lb {
			    bottom: 0;
			    left: 0px;
			    background: url("../images/navimap/frame-lb.png") no-repeat;
			}
			.frame-bg-rt {
			    top: 0;
			    right: 0px;
			    background: url("../images/navimap/frame-rt.png") no-repeat;
			}
			.frame-bg-rb {
			    bottom: 0;
			    right: 0px;
			    background: url("../images/navimap/frame-rb.png") no-repeat;
			}
			
			/*右上*/
			#bannerrightopenup{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 144px;
				right: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
			}
			#bannerrightopenup img{
				display: block;
				margin: 28px auto;
			}
			
			#rightupcontent{
				display: block;
				position: absolute;
				right: 1%;
				top: 70px;
				width: 400px;
				height: 280px;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
				font-size: 14px;
			}
			.main_rightup{
				width: 80%;
				height: 100%;
				margin: 0px auto;
				/*border: 1px solid #AAAAAA;*/
			}
			.main_rightup p{
				width: 100%;
				height: 50px;
				line-height: 50px;
				text-align: left;
				/*border-bottom: 1px dashed #AAAAAA;*/
			}
			.main_rightup h2{
				color:  #C5D52B;
				height: 50px;
				line-height: 50px;
				text-align: center;
				font-size:18px;
				font-weight: bold;
			}
			.main_rightup p:first-of-type{
				margin-top: 10px;
				/*border: none;*/
			}
			/*.main_rightup p:last-of-type{
				border: none;
			}*/
			.main_rightup p label{
				display: inline-block;
				width: 50%;
			}
			.main_rightup p span.span_num{
				display: inline-block;
				width: 25%;
				height: 40px;
				text-align: center;
				border-bottom: 1px solid #AAAAAA;
			}
			.main_rightup p span.span_nuit{
				margin-left: 30px;
			}
			#disnum{
				width: 210px;
				height: 50px;
				/*background-color: red;*/
				position: absolute;
				top: 70px;
				right: 86px;
			}
			.disimg{
				display: inline-block;
				width: 40px;
				height: 42px;
				border: 1px dashed #AAAAAA;
			}
			.disimg img{
				width: 40px;
				height: 42px;
			}
			.imgdot{
				width:30px;
				height: 50px;
				/*border: 1px dashed #AAAAAA;*/
			}
			.imgdot img{
				width: 18px;
				height: 18px;
			}
			#bannerrightcloseup{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrow.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 34%;
				left: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			
			
			
			/*右下*/
			#bannerrightopendown{
				display: none;
				width: 25px;
				height: 80px;
				/*background: url(images/dark-bg.png) no-repeat;
				background-size: 100% 100%;*/
				cursor: pointer;
				position: absolute;
				top: 480px;
				right: 0%;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
			}
			#bannerrightopendown img{
				display: block;
				margin: 28px auto;
			}
			
			#rightdowncontent{
				display: block;
				position: absolute;
				right: 1%;
				top: 380px;
				width: 500px;
				height: 90%;
				color: #fff;
				border: solid 1px #aaa;
				border-radius: 10px;
				text-align: center;
				max-height: 90%;
				/*background: url(images/body-bg.png) repeat;*/
			/*	background-size: 100% 100%;*/
				filter: alpha(opacity=80);
				opacity: 0.8;
				background-color: black;
			}
			.main_rightdown{
				width: 90%;
				height: 100%;
				margin: 0px auto;
				/*border: 1px solid #AAAAAA;*/
			}
			.main_rightdown p{
				width: 100%;
				height: 40px;
				line-height: 40px;
				text-align: left;
				font-size:14px;
				border-bottom: 1px dashed #AAAAAA;
			}
			.main_rightdown p:first-of-type{
				color:  #C5D52B;
				height: 50px;
				line-height: 50px;
				text-align: center;
				font-size:18px;
				font-weight: bold;
				border: none;
			}
			.alt_title{
				display: inline-block;
				width: 70%;
				
			}
			.alt_time{
				display: inline-block;
				width: 30%;
			}
			#bannerrightclosedown{
				width: 25px;
				height: 80px;
				background: url(../images/navimap/arrow.png) no-repeat;
				cursor: pointer;
				position: absolute;
				top: 40%;
				left: -26px;
				/*float: left;*/
				opacity: 0.8;
				background-color: black;
				border-left: 1px solid #AAAAAA;
				border-top: 1px solid #AAAAAA;
				border-bottom: 1px solid #AAAAAA;
				border-top-left-radius: 8px;
				border-bottom-left-radius: 8px;
				background-position-x: center;
				background-position-y: center;
			}
			


#demo_menu1 {
	display: none;
	width: 80px;
	height: 240px;
	background-color: rgba(43, 45, 49,1);
	opacity: 1;
	text-align: center;
	padding: 16px;
	border-radius: 10px;
	box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
	position: fixed;
	top: 48px;
	left: 10px;
	z-index: 998;
}
#demo_menu1 li{
	list-style-type: none;
}
#demo_menu1 li a {
	color: #bbb;
	line-height: 27px;
	text-decoration: none;
}

#demo_menu1 li a:hover {
	color: #fff;
}


		</style>
<!-- 来电即时信息 -->
<style>

* {
	margin: 0px;
	padding: 0px;
}

#demo_m {
	display: block;
	width: 46px;
	height: 40px;
	position: fixed;
	bottom: 30px;
	left: 160px;
	z-index: 999;
}

#demo_m ul {
	width: 34px;
	height: 20px;
	position: absolute;
	top: 20px;
}

#demo_m ul li {
	list-style: none;
	padding: 0px;
	margin: 0px;
	display: inline-block;
	width: 6px;
	height: 6px;
	border-radius: 4px;
	background-color: rgba(255, 255, 255, 0.7);
}

#demo_menu1 {
	display: none;
	width: 80px;
	height: 140px;
	background-color: rgba(43, 45, 49, 0.9);
	text-align: center;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
	position: fixed;
	bottom: 30px;
	left: 204px;
	z-index: 998;
}

#demo_menu1 li a {
	color: #bbb;
	line-height: 27px;
}

#demo_menu1 li a:hover {
	color: #fff;
}

#demo_menu1::before {
	content: "";
	display: block;
	position: absolute;
	width: 0px;
	height: 0px;
	border: 10px solid transparent;
	left: -20px;
	bottom: 16px;
	border-right-color: rgba(43, 45, 49, 0.8);
}

	
#demo_menu2 {
	width: 36px;
	height: 32px;
	position: fixed;
	top: 20%;
	right: 0px;
	background-color: #2B2D31;
	border-radius: 4px;
	z-index: 11;
}

#demo_menu2 img {
	display: block;
	width: 28px;
	height: 22px;
	margin: 5px auto;
}

#demo_menu3 {
	display: none; 
	width : 160px;
	height: 115%;
	border-radius:10px;
	background-color: #444;
	position: absolute;
	top: 62px;
	right: 0px;
	z-index: 12;
}

.tree {
	color: #46CFB0;
	width: 146px;
	margin: 10px auto;
}

.tree li, .tree li>a, .tree li>span {
	padding: 4pt;
	border-radius: 4px;
}

.tree li a {
	color: #46CFB0;
	text-decoration:none;
	line-height: 20pt;
	border-radius: 4px;
}

.tree li a:hover {
	background-color: #34BC9D;
	color: #fff;
}

.active {
	background-color: #34495E;
	color: white;
}

.active a {
	color: #fff;
}

.tree li a.active:hover {
	background-color: #34BC9D;
}
	
.xqname,.ldname,.dyname{
	background:url("../images/background/cir.png") no-repeat left center;
}

.xqname:hover,.ldname:hover,.dyname:hover{
	background:url("../images/background/cirf.png") no-repeat left center;	}


fieldset {
    width:350px;
	margin: 0px; 
	padding:6px; 
	border:1px solid  #3E403C; 
	text-align:left;
} 
legend {
	color: #3E403C;
	font-weight:800; 
	padding:3px 6px;	
} 

</style>


<script type="text/javascript" >

$(document).ready(function(){
lay();
})

</script>
<script type="text/javascript" >
function lay(){
 layer.open({
			  type: 1//此处以iframe举例
			  ,shade: false
			  ,title: '分机信息'
			  ,area: ['480px', '580px']
			  ,shade: 0
			 ,offset:"rb"
			  ,id: 'LAY_Notice'//防止重复弹出
			  ,maxmin: true
			  ,content: $("#dl").html()
			  ,min: function(layero){
				     setTimeout(function(){ 
				         layero.css({
				           left:'auto'
				           ,right: 0
				          ,bottom: 0
				       })},0);
				  } 
			/*   ,btn: ['继续弹出', '全部关闭'] */ //只是为了演示
			/*   ,yes: function(){
			    $(that).click(); //此处只是为了演示，实际使用可以剔除
			  }
			  ,btn2: function(){
			    layer.closeAll();
			  }
			  
			  ,zIndex: layer.zIndex //重点1
			  ,success: function(layero){
			    layer.setTop(layero); //重点2 */
			 /*  } */
		  });
	 
		  /* layer.closeAll(); //关闭所有层 */
}
</script>


 <script type="text/html" id="dl">
<div>
 <div >
<div style="margin-left: 20px;">
	<form name="form1" action="home.action">
					<input type="hidden" name="mobile" value=""> <br />
					<fieldset class="nowinfo">
					<legend align="top">即时信息</legend>
						<div align="left" style="height: 82px;">
							<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
								codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0"
								width="350" height="80" id="cti" align="middle">
								<param name="allowScriptAccess" value="sameDomain" />
								<param name="allowFullScreen" value="false" />
								<param name="movie"
									value="../cti/cti.swf?extno=${extno}&seatpass=''&ctiip=${ctiip}&ipport=2000&isshowcall=1&isautologin=1&ishidetel=0" />
								<param name="quality" value="high" />
								<param name="bgcolor" value="#ffffff" />
								<param name="wmode" value="transparent" />
								<embed
									src="../cti/cti.swf?extno=${extno}&seatpass=''&ctiip=${ctiip}&ipport=2000&isshowcall=1&isautologin=1&ishidetel=0"
									quality="high" bgcolor="#fff" width="350" height="80"
									name="1" align="middle" allowScriptAccess="sameDomain"
									allowFullScreen="false" type="application/x-shockwave-flash"
									pluginspage="http://www.adobe.com/go/getflashplayer_cn" />
							</object>
						</div>
					</fieldset>
					<br />
				</form>
</div>
<div style="margin-left: 20px;">
<fieldset class="moreinfo">
<legend>分机状态信息</legend>
<span id="inlineinfo"></span></fieldset> <br />
</div>
<div style="margin-left: 20px;">
<fieldset>
<legend>排队信息</legend>
排队数量：<span id="waitnum"></span> 自己分组数量：<span id="waitnumme"></span> </fieldset>
<br />
</div>
<div style="margin-left: 20px;">
<fieldset class="moreinfo">
<legend>外线状态信息</legend>
<span id="outlineinfo"></span></fieldset> <br />

 
<!-- <span id="outlineinfo"></span></fieldset> <br /> -->


 <span id="closetalk" style="display: none"><input type="button" value="挂断" onclick="javascript:callExternal('CloseTalk');" class="btnsmall2"></span></fieldset> <br />
 </div>
        </div>
      </div>     

</script>
 
 
 
 <script type="text/html" id="pswModel">
    <form id="pswForm" class="layui-form model-form" action="" method="PUT">

     
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="username" readonly="readonly" name="username" value="${UserName}" class="layui-input" maxlength="12"
                       lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="oldpassword" name="oldpassword" placeholder="请输入旧密码" type="password" class="layui-input" maxlength="12"
                       lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input style="width:200px" autocomplete="off" id="newpassword" name="newpassword" placeholder="请输入新密码" type="password" class="layui-input" maxlength="12"
                       lay-verify="required|pass" required/>
            </div>
        </div>
        
        <div class="layui-form-item model-form-footer" style="margin-left:130px">
            <button class="layui-btn layui-btn-primary" type="button" id="pswCancel">取消</button>
            <button class="layui-btn layui-btn-normal" id="pswSubmit" >修改</button>
        </div>
    </form>

</script>
<script type="text/html" id="YhModel">

<form id="addYhForm" class="layui-form model-form" action="" method="PUT">

    
       <div class="layui-form-item">
           <label class="layui-form-label">用户名</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="username" name="username" placeholder="请输入用户名" value="" class="layui-input" maxlength="12"
                      lay-verify="required" required/>
           </div>
       </div>

       <div class="layui-form-item">
           <label class="layui-form-label">密码</label>
           <div class="layui-input-block">
               <input style="width:200px" autocomplete="off" id="password" name="password" placeholder="请输入新密码" type="password" class="layui-input" maxlength="12"
                      lay-verify="required|pass" required/>
           </div>
       </div>
       
       <div class="layui-form-item model-form-footer" style="margin-left:130px">
           <button class="layui-btn layui-btn-primary" type="button" id="adYhCancel">取消</button>
           <button class="layui-btn layui-btn-normal" id="addYhSubmit" >添加</button>
       </div>
   </form>
</script>
<script type="text/javascript">


function tongjfx2(){// 
	    window.open("<%=basePath%>KfgdCon/gdtj.action","Conframe");
	} 
function kehzl(){// 
	    window.open("<%=basePath%>user/kehzl.action","Conframe");
	} 
function xinjgd(){// 
	    window.open("<%=basePath%>KfgdCon/findgd.action","Conframe");
	} 
function gongdsh(){// 
	    window.open("<%=basePath%>KfgdCon/SelGdSh.action","Conframe");
	} 
function gongdjk(){// 
	    window.open("<%=basePath%>KfgdCon/gdjk.action","Conframe");
	} 
function canssz(){// 
	    window.open("<%=basePath%>user/canssz.action","Conframe");
	} 
	/* 知识库 */
function qiytl(){// 
    window.open("<%=basePath%>ZskCon/getQytl.action?type=企业条例", "Conframe");
} 
function guojfg(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=国家法规", "Conframe");
} 
function hangyzs(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=行业知识", "Conframe");
} 
function xitsm(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=系统说明", "Conframe");
} 
function wentjd(){// 
	window.open("<%=basePath%>ZskCon/getQytl.action?type=问题解答", "Conframe");
} 
 	/* 员工定位 */
function shisdw(){// 
	window.open("<%=basePath%>user/shisdw.action","Conframe");
} 
function lisgj(){// 
	window.open("<%=basePath%>user/lisgj.action","Conframe");
} 



var int=self.setInterval("clock()",3600000);
function clock()
{
	$.ajax({
		url : "<%=basePath%>KfgdCon/selJjgq.action", 
		async : false,
		dataType : "json",
		data : {
			
		},
		success : function(data) {
			
			if(data.gqgd>0){
				alert("有"+data.gqgd+"条工单即将逾期，请尽快处理！")
			}
		
		}

	});
}


//新增用户
function xzyh(flag){
	if(flag=="1"){
		layer.msg("用户名已存在");
	}
	 layer.open({
	        type: 1,
	        title: "新增用户",
	        area: '400px',
	        offset: '120px',
	        content: $("#YhModel").html()
	    });
	 $("#addYhForm")[0].reset();
	    $("#adYhCancel").click(function () {
	        layer.closeAll();
	    });
	    
	    $("#addYhSubmit").click(function () {
	    	var username = $('#username').val();
			var password = $('#password').val();
			if(username==""||password==""){
				alert("用户名或密码不为空!");
				return false;
			}
				$.ajax({
					url : "<%=basePath%>user/addYh.action", 
					async : false,
					dataType : "json",
					data : {
						"username" : username,
						"password" : password,
					},
					success : function(data) {
	
						msg = data.msg
						if(msg=="1"){
							setTimeout(function () {
								layer.msg("添加成功");
		                    }, 2500);
							
						}else{
								setTimeout(function () {
									layer.msg("用户名已存在!");
			                    }, 2000);
								layer.closeAll();
								xzyh(1)
						}
					}

				});
	    });
}

//修改密码
function xgmm(flag) {
	if(flag=="1"){
		layer.msg("原密码输入错误");
	}
    layer.open({
        type: 1,
        title: "修改密码",
        area: '400px',
        offset: '120px',
        content: $("#pswModel").html()
    });
    $("#pswForm")[0].reset();
    $("#pswCancel").click(function () {
        layer.closeAll();
    });
    
    $("#pswSubmit").click(function () {
    	var username = $('#username').val();
		var oldpassword = $('#oldpassword').val();
		var newpassword = $('#newpassword').val();
		if(oldpassword==""||oldpassword==""){
			alert("密码不能为空!");
			return false;
		}
		var id=$('#id').val();
			$.ajax({
				url : "<%=basePath%>user/updapwd.action", 
				async : false,
				dataType : "json",
				data : {
					"oldpassword" : oldpassword,
					"newpassword" : newpassword,
					"username" : username,
					"id" :id,
				},
				success : function(data) {
					msg = data.msg
					if(msg=="1"){
						
						
						
						setTimeout(function () {
							layer.msg("修改成功");
	                    }, 2500);
						
					}else{
						
							
							setTimeout(function () {
								layer.msg("原密码输入错误");
		                    }, 2500);
							
							layer.closeAll();
							xgmm("1");
						
					}
				}

			});
    });
    
    
    
}
/* function callExternal(thetel)
{
  if(1==1)
  {
	  alert("111")
     swfobject.getObjectById('cti').callTel(thetel);//通过swfobject.js，调用flash中的呼叫函数
  }
  if(1==0)
  {
    document.cti.callTel(thetel);//普通代码，调用flash中的呼叫函数
  }
} */
</script>
<script type="text/javascript">
//JS操作Cookie函数
/* var msgtype="1"; */

function getCookie(c_name)
{
  if (document.cookie.length>0)
  {
     c_start=document.cookie.indexOf(c_name + "=");
     if (c_start!=-1)
     { 
        c_start=c_start + c_name.length+1; 
        c_end=document.cookie.indexOf(";",c_start);
        if (c_end==-1) c_end=document.cookie.length;
        return unescape(document.cookie.substring(c_start,c_end));
     } 
  }
  return "";
}

function setCookie(c_name,value,expiredays)
{
  var exdate=new Date();
  exdate.setDate(exdate.getDate()+expiredays);
  document.cookie=c_name+ "=" +escape(value)+";path=/"+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}

//时间转换函数

function MillisecondToDate(msd) {
    var time = parseFloat(msd) / 1000;
    if (null != time && "" != time) {
        if (time > 60 && time < 60 * 60) {
            time = "0:" + parseInt(time / 60.0) + ":" + parseInt((parseFloat(time / 60.0) -
                parseInt(time / 60.0)) * 60);
        }
        else if (time >= 60 * 60 && time < 60 * 60 * 24) {
            time = parseInt(time / 3600.0) + ":" + parseInt((parseFloat(time / 3600.0) -
                parseInt(time / 3600.0)) * 60) + ":" +
                parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
                parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60);
        }
        else if (time >= 60 * 60 * 24) {
            time = "大于24小时"
        }        
        else {
            time ="0:0:" + parseInt(time);
        }
    }
    return time;
}

</script>
 <script type="text/javascript"> 

//弹屏JS代码，函数名称不能修改

//弹屏JS代码，函数名称不能修改
function gosearch(thestr)
{
if(thestr!=""){ 
 if(thestr=="CTI连接中断")
 {        
 }
 else
 {  
	   
  var arrTmp = thestr.split("|");  // 分隔信息
 
  //数组中第1位表示是否是来电信息，只有是"1"才表示是来电信息，"2"表示其它信息
  //数组中第2位表示分机号
  //数组中第3位表示来电号码
  //数组中第4位表示来电流程
  //数组中第5位表示来电时间 
  //数组中第6位表示用户按键 
  //数组中第7位表示用户自己定义参数，可在IVR接口查询时返回
  //数组中第8位表示用户在IVR流程中输入的内容,多个参数之间用@分隔
  //数组中第9位表示此次通话的录音文件名
  //数组中第10位表示此次通话的IVR的名称
  //数组中第11位表示此次通话的外线通道号
  //数组中第12位表示此次通话的分机通道号  
  if(arrTmp[0]=="1")  //处理来电或弹屏信息
  {
    if(1==1)//弹屏
    {
        document.form1.mobile.value=thestr;
        document.form1.submit();
    }
     if(msgtype=="2") //处理排队及状态信息
     {
    	 document.getElementById("newcallinfo").innerHTML=thestr;//来电信息
         document.getElementById("ivrback").innerHTML=arrTmp[6];//自己定义参数
     }
    }
    if(arrTmp[0]=="2") //处理排队及状态信息
    {

        //示例："2|0-0@0$801$801$空闲$1$105536,1$802$802$空闲$0$105536@2$空闲[√]$$$$105536,3$空闲[√]$$$$105536"，
        //最前面的2是固定标志位，后面0-0分别是排队数量与自己分组内的排队数量，
        //座席的数据0$801$801$空闲$1$105536，用$分隔开来分别是通道号\分机\姓名\状态\是否登录\状态持续时间，后面是802分机的信息，
        //外线的数据2$空闲[√]$$$$105536，用$分隔开来分别是通道号\状态\呼叫类型\主叫号码\被叫\状态持续时间，后面是下一个外线的信息，
        //开发时建议先用|分隔成数组，再用@分隔成数组，再用","分隔成数组，最后再用$分隔成数组

         var infostr=arrTmp[1];
         var infoarr=infostr.split("@");// 分隔信息
         //数组中第1位表示排队数量信息
         //数组中第2位表示分机状态信息
         //数组中第3位表示外线状态信息
         //数组中第4位表示会议信息      
         
         var waitarr=infoarr[0].split("-");// 分隔排队信息
         document.getElementById("waitnum").innerHTML=waitarr[0];//显示排队数量，也可以根据需要在其它地方进行显示
         document.getElementById("waitnumme").innerHTML=waitarr[1]//自己分组内的排队数量
         
         //下面处理分机状态数据
         var isinlineinfo=getCookie("inlineinfo");//根据cookie是否显示分机状态

         var backinlinestr="<span style=\"text-align:left;\">";
         if(isinlineinfo=="none")
         {
               backinlinestr=backinlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('inlineinfo','block',205);\">显示分机状态</a>";    
         }
         else
         {
               backinlinestr=backinlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('inlineinfo','none',205);\">隐藏分机状态</a>";      
         }
         
         backinlinestr=backinlinestr+"</span>";   
         backinlinestr=backinlinestr+"<table  border=\"0\" style=\"display:"+isinlineinfo+"\" cellpadding=\"4\" cellspacing=\"1\" margin=\"0\" bgcolor=\"#B7D9FE\" width=\"320\">";
         backinlinestr=backinlinestr+"<tr bgcolor=\"#EEEEEE\">";
         backinlinestr=backinlinestr+"<td width=\"15%\">分机</td>";
         backinlinestr=backinlinestr+"<td width=\"20%\">姓名</td>";
         backinlinestr=backinlinestr+"<td width=\"25%\">状态</td>";
         backinlinestr=backinlinestr+"<td width=\"25%\">登录</td>";
         backinlinestr=backinlinestr+"<td width=\"15%\">持续</td>";      
         backinlinestr=backinlinestr+"</tr>";  
            
         var inlineinfoarr=infoarr[1].split(",");//所有分机状态信息
         for(var i=0;i<inlineinfoarr.length;i++)
         {
             var nowinlineinfoarr=inlineinfoarr[i].split("$");
             if(nowinlineinfoarr.length>=4)
             {
             backinlinestr=backinlinestr+"<tr bgcolor=\"#F8F8F8\">";
             backinlinestr=backinlinestr+"<td><a href=\"javascript:callExternal('Switch"+nowinlineinfoarr[1]+"');\" title=\"转分机\">"+nowinlineinfoarr[1]+"</a></td>";
             backinlinestr=backinlinestr+"<td><a href=\"javascript:gochat('"+nowinlineinfoarr[1]+"');\" title=\"发消息\">"+nowinlineinfoarr[2]+"</a></td>";
             
             if(nowinlineinfoarr[3]=="置忙" || nowinlineinfoarr[3]=="摘机" || nowinlineinfoarr[3]=="振铃")
             {
                backinlinestr=backinlinestr+"<td><font color=\"red\">"+nowinlineinfoarr[3]+"</font></td>";
             }
             else
             {
                backinlinestr=backinlinestr+"<td><font color=\"green\">"+nowinlineinfoarr[3]+"</font></td>";
             }
             if(${extno}==nowinlineinfoarr[1])
             {
                 if(nowinlineinfoarr[3]=="摘机")
                 {
                    document.getElementById("closetalk").style.display="";//显示结束通话按钮
                 }else
                 {
                    document.getElementById("closetalk").style.display="none";//隐藏结束通话按钮
                 }
             }
      
                
             if(nowinlineinfoarr[4]=="1")
             {
                backinlinestr=backinlinestr+"<td><font color=\"green\">是</font></td>";
             }
             else
             {
                backinlinestr=backinlinestr+"<td></td>";
             }
             backinlinestr=backinlinestr+"<td>"+MillisecondToDate(nowinlineinfoarr[5])+"</td>";
             backinlinestr=backinlinestr+"</tr>";   
             }
         }
         backinlinestr=backinlinestr+"</table>";  
         document.getElementById("inlineinfo").innerHTML=backinlinestr;

         //下面处理外线状态数据
         var isoutlineinfo=getCookie("outlineinfo");//根据cookie是否显示外线状态

         var backoutlinestr="<span style=\"text-align:left;\">";
         if(isoutlineinfo=="none")
         {
               backoutlinestr=backoutlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('outlineinfo','block',205);\">显示外线状态</a>";    
         }
         else
         {
               backoutlinestr=backoutlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('outlineinfo','none',205);\">隐藏外线状态</a>";      
         }
         
         backinlinestr=backinlinestr+"</span>";       
         backoutlinestr=backoutlinestr+"<table  border=\"0\" style=\"display:"+isoutlineinfo+"\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#B7D9FE\" margin=\"0\" width=\"420\">";
         backoutlinestr=backoutlinestr+"<tr bgcolor=\"#EEEEEE\">";
         backoutlinestr=backoutlinestr+"<td width=\"5%\">ID</td>";
         backoutlinestr=backoutlinestr+"<td width=\"18%\">状态</td>";
         backoutlinestr=backoutlinestr+"<td width=\"15%\">呼叫类型</td>";
         backoutlinestr=backoutlinestr+"<td width=\"20%\">主叫</td>";
         backoutlinestr=backoutlinestr+"<td width=\"10%\">被叫</td>";  
         backoutlinestr=backoutlinestr+"<td width=\"10%\">持续</td>";  
         backoutlinestr=backoutlinestr+"<td width=\"15%\">优先</td>";            
         backoutlinestr=backoutlinestr+"</tr>";  

         var outlineinfoarr=infoarr[2].split(",");//所有外线状态信息
         for(var i=0;i<outlineinfoarr.length;i++)
         {
          var nowoutlineinfoarr=outlineinfoarr[i].split("$");
          if(nowoutlineinfoarr.length>=6)
          {
             backoutlinestr=backoutlinestr+"<tr bgcolor=\"#F8F8F8\">";
             backoutlinestr=backoutlinestr+"<td>"+nowoutlineinfoarr[0]+"</td>";
             if(nowoutlineinfoarr[1].indexOf("空闲")>-1)
             {
                  backoutlinestr=backoutlinestr+"<td><font color=\"green\">"+nowoutlineinfoarr[1]+"</font></td>";
             }
             else
             {
                  backoutlinestr=backoutlinestr+"<td><font color=\"red\">"+nowoutlineinfoarr[1]+"</font></td>";
             }
             backoutlinestr=backoutlinestr+"<td>"+nowoutlineinfoarr[2]+"</td>";
             backoutlinestr=backoutlinestr+"<td>"+nowoutlineinfoarr[3]+" "+nowoutlineinfoarr[7]+"</td>";
             backoutlinestr=backoutlinestr+"<td>"+nowoutlineinfoarr[4]+"</td>";  
             backoutlinestr=backoutlinestr+"<td>"+MillisecondToDate(nowoutlineinfoarr[5])+"</td>";
             if(nowoutlineinfoarr[6]=="0")
             {
                  backoutlinestr=backoutlinestr+"<td>否 <a href=\"javascript:callExternal('PriorityYes|"+nowoutlineinfoarr[0]+"');\";>设置</a></td>"; 
             }  
             else
             {
                  backoutlinestr=backoutlinestr+"<td>是 <a href=\"javascript:callExternal('PriorityNo|"+nowoutlineinfoarr[0]+"');\";>取消</a></td>";           
             }                                                           
             backoutlinestr=backoutlinestr+"</tr>";  
          }
         }
         backoutlinestr=backoutlinestr+"</table>";  
         document.getElementById("outlineinfo").innerHTML=backoutlinestr;
   } 
    if(arrTmp[0]=="3") //处理通话信息
    {
       //请参考相关手册文档
    }
  
    if(arrTmp[0]=="4") //座席之间相互之间发的送的信息
    {
       //4|发送人|接收人|消息内容
       var chatwin=getchatwin(arrTmp[1]);
       if(chatwin==null || chatwin.closed)
       {
       <%--    //窗口不存在或已关闭
          var chatwin=window.open("<%=chaturl1%>?myextno="+arrTmp[2]+"&toextno="+arrTmp[1]+"&msg="+thestr,"Chat"+arrTmp[1]);
          addchatwin(arrTmp[1],chatwin);  --%>
       }
       else
       {
          //窗口存在
          chatwin.recemsg(thestr);
       }  
  }
}
}
} 
 function callExternal(thetel)
{
	
  if(1==1)
  {
	  document.cti.callTel(thetel);//普通代码，调用flash中的呼叫函数
     swfobject.getObjectById('cti').callTel(thetel);//通过swfobject.js，调用flash中的呼叫函数
  }
  if(1==0)
  {
    document.cti.callTel(thetel);//普通代码，调用flash中的呼叫函数
  }
} 

function callExternal(thetel)
{
if(1==1)
{
   swfobject.getObjectById('cti').callTel(thetel);//通过swfobject.js，调用flash中的呼叫函数
}
if(1==0)
{
  document.cti.callTel(thetel);//普通代码，调用flash中的呼叫函数
}
} 
</script>


<style>
	*{
		margin: 0px;
		padding: 0px;
	}
	#demo_m{
		display:block;
		width:46px;
		height:40px;
		position:fixed;
		bottom:30px;
		left:160px;
		z-index:999;
	}
	
	#demo_m ul{
		width: 34px;
		height: 20px;
		position: absolute;
		top:20px;
	}
	#demo_m ul li{
		list-style:none;
		padding:0px;
		margin:0px;
		display:inline-block;
		width:6px;
		height:6px;
		border-radius:4px;
		background-color:rgba(255,255,255,0.7);
	}
	
	
	#demo_menu1{
		display:none;
		width:80px;
		height:140px;
		background-color:rgba(43,45,49,0.9);
		text-align:center;
		padding:10px;
		border-radius:10px;
		box-shadow:4px 4px 4px 4px rgba(0,0,0,0.1);
		position:fixed;
		bottom:30px;
		left:204px;
		z-index:999;
	}
	
	#demo_menu1::before{
		content: "";
  		display: block;
  		position: absolute;
  		width: 0px;
  		height: 0px;
  		border: 10px solid transparent;
  		left: -20px;
  		bottom:16px;
  		border-right-color: rgba(43,45,49,0.8);
	}

	#demo_menu2 li ul{
		display:none;
	}
	
	#demo_menu2 li ul li:hover{
		color:#C5D52B;
	}

</style>
<script type="text/javascript">
function doit(){
	$('#Conframel').contents().find(".ac_kf li a").tab();
}
</script>
<body onload="doit()">

</head>
	 <!--   模块连接 -->
      	<div>
      		<div id="demo_m">
      			<ul>
      				<li></li>
      				<li></li>
      				<li></li>
      			</ul>
      		</div>
			

			<div id="demo_menu2">
				<img src="../images/background/menu.png" />
			</div>
	
			<div id="demo_menu3">
				<ul class="tree">
	
				</ul>
			</div>
			
		</div>
	
	
			<div id="demo_menu3">
				<ul class="tree">
	
				</ul>
			</div>

			
		</div>
<body>

	<div id="mws-header" class="clearfix" style="width:100%;" >
    	<div id="mws-logo-container" style="width:60%;">
        	<div id="mws-logo-wrap" style="width:100%;float:right;">
            	<!-- <img src="../images/logo.png" alt="mws admin" style="width:300px;height:34px;float:right;margin-top:10px;" /> -->
            	<p style="width:450px;height:34px;float:left;font-size:30px;color:#C5D52B;line-height:60px"> ZYIS-H 客服服务管理系统</p>
			</div>
        </div>
      
        <!-- 登录头像 -->
        <div id="mws-user-tools" class="clearfix">
            <div id="mws-user-info" class="mws-inset">
            	<div id="mws-user-photo">
                	<img src="../example/profile.jpg" alt="User Photo" />
                </div>
                <div id="mws-user-functions">
                    <div id="mws-username">
                        Hello,${UserName}
                    </div>
                    <ul>
                  
                        <li><a href="toLogin.action">登录</a></li>
                       
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
    

    
   <!-- 下面内容 start-->
   <div id="mws-wrapper">
       <!--  必要的标记，不要删除 -->
           <div id="mws-sidebar-stitch"></div>
           <div id="mws-sidebar-bg"></div>

           <!-- 左边侧栏包装器 -->
           <div id="mws-sidebar">
           	
               <!--  搜索框-->
               <div id="mws-searchbox" class="mws-inset">
                   <form action="https://www.baidu.com/">
                       <input type="text" class="mws-search-input" />
                       <input type="submit" class="mws-search-submit" />
                   </form>
               </div>
       
                 <iframe scrolling="no" width="100%"   name="Conframel" id="Conframel" src="<%=basePath%>user/left.action" frameborder="0" onload="this.height=0;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>1700?fdh:900)"></iframe>
           		 
           </div>
          <!-- 左边侧栏包装器  End -->

          <!--  右边主容器 start  -->
    
		 <div id="mws-container" class="clearfix">
		       <div class="Conframe" style="height:90%;overflow:hidden;"> 
		    	 <div id="page-tab">
					<button class="tab-btn" id="page-prev"></button>
					<nav id="page-tab-content">
						<div id="menu-list">                </div>
					</nav>
					<button class="tab-btn" id="page-next"></button>
					
				</div>
				
		        <iframe  name="Conframe" id="Conframe" style="width:99%"  src="<%=basePath%>user/kehzl.action" ></iframe>
		     <div id="overall">
<!--右侧栏下-->
		<!-- 	<div id="bannerrightopendown"><img src="../images/navimap/arrowleft.png" /></div>
			<div id="rightdowncontent">
				<div id="bannerrightclosedown"></div>
				<div class="frame-bg-corner frame-bg-lt"></div>
				<div class="frame-bg-corner frame-bg-lb"></div>
				<div class="frame-bg-corner frame-bg-rt"></div>
				<div class="frame-bg-corner frame-bg-rb"></div>
				
				<div class="main_rightdown">
					 <div>
        <div style="position:fixed;bottom:95px; top :135px;right:20px;z-index:9999;">
         	<form name="form1" action="home.action">
         	<fieldset class="moreinfo">
<legend>分机状态信息</legend>
<span id="inlineinfo"></span></fieldset> <br />
<fieldset class="moreinfo">
<legend>外线状态信息</legend>
<span id="outlineinfo"></span></fieldset> <br />
<fieldset class="moreinfo">
 <fieldset>
<legend>排队信息</legend>
排队数量：<span id="waitnum"></span> 自己分组数量：<span id="waitnumme"></span> </fieldset>
<br />
<span id="outlineinfo"></span></fieldset> <br />

 <legend>电话软拨号简约风格</legend>
  拨打号：<input type="text" name="telnob" value="" size="20"> <br /> 
  <input type="button" value="呼叫" onclick="javascript:callExternal('9'+document.form1.telnob.value);" class="btnsmall">
 <span id="closetalk" style="display: none"><input type="button" value="挂断" onclick="javascript:callExternal('CloseTalk');" class="btnsmall2"></span></fieldset> <br />
  
  <fieldset>  
  <legend>呼叫转移</legend>
  转移号：<input type="text" name="telnoc" value="" size="20"> <br />
  <input type="button" value="呼叫转移" onclick="javascript:callExternal('SeatCallDivert|'+document.form1.telnoc.value);" class="btnsmall">
  </fieldset> <br />
  <legend>会议信息</legend>
<span id="conferenceinfo"></span></fieldset> <br />
				<input type="button" value="置忙" onclick="callExternal('StatusBusy');" class="btnsmall">
				<input type="button" value="置闲" onclick="callExternal('StatusFree');" class="btnsmall">
				<input type="button" value="保持通话" onclick="callExternal('SeatHoldIng');" class="btnsmall">
				<input type="button" value="恢复通话" onclick="callExternal('SeatHoldOK');" class="btnsmall">
				<input type="button" value="挂断" onclick="callExternal('CloseTalk');" class="btnsmall"><br />
				</form>
           </div>
        </div>
				</div>
			</div> -->
		</div>	
		     </div> 
		 </div>

  </div>
  
 
  <script type="text/javascript">

	function doit(){
		$('#Conframel').contents().find(".taglist").tab();
	}
		

	var list =[]; 
	/* var list = ${YhList}; */
	/* var list = [
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "01",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "01",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "文化活动中心",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "01",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "01",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "文化活动中心",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "01",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "02",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "文化活动中心",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "01",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "01",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "天鹅堡",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "02",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "01",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "天鹅堡",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
		{bj: "00",zdtime:0,bz: "1层服务大厅",dddtime: 0,ddtime: 0,dgdtime: 151.57,dw: "02",dyh: "01",dzdtime: 11.43,fpbh: "1",fpdz: "04",gdtime: "83.42",
			hh: "101",id: 208,jf: "01",jj: "01",kg: "01",ldh: "01",lxdh: "1522561364",mj: 120.5,ms: "01",sdwd: "26",snwd: "27",syje: -757929.5,
			time: "2019-03-09 20:55:52",xqm: "天鹅堡",yf: 6,yhbh: "16000001",yhxm: "1层服务大厅",yydl: 1315.94},
	];
	 */
	//侧面树图
	 var xqlilst = [];
	 for(var i = 0 ; i < list.length ; i ++){
		 if(xqlilst.indexOf(list[i].xqm) == -1){
			 xqlilst.push(list[i].xqm);
		 }
	 }
	 for(var j = 0; j < xqlilst.length; j++) {
			$(".tree").append("<li class='xq xqli"+j+"'><a class='xqname' href='#about'>&nbsp;&nbsp;"+xqlilst[j]+"</a></li>");
	}
	

	 var ldlist = [];
	 var ldl = [];
	 for(var x = 0 ; x < xqlilst.length ; x ++){
		 for(var i = 0 ; i < list.length ; i ++){
			 if( xqlilst[x] == list[i].xqm && ldl.indexOf(list[i].ldh) == -1){
				 ldl.push(list[i].ldh);
			 }
		 }
		 ldlist.push(ldl);
		 ldl = [];
	 }
	 
	 for(var j = 0; j < ldlist.length; j++) {
		 $(".xqli"+j).append("<ul></ul>");
		 for(var i = 0; i < ldlist[j].length; i++){
			 $(".xqli"+j).children("ul").append("<li class='ld'><a class='ldname' href='#'>&nbsp;&nbsp;&nbsp;"+ldlist[j][i]+"</a></li>");
		 }
	 } 
	
	 var dylist = [];
	 var ldlic = $(".ld");
	 $(".ld").each(function(i){
		$(this).addClass("ldli"+i);
		 
	 });
	 for(var y = 0 ; y < ldlic.length ; y ++){
		 var xqlddy = [];
		 var aldhtml = $(".ldli"+y).children("a.ldname").html();
		 aldhtml = aldhtml.replace(/&nbsp;/ig, "");
		 var axqhtml = $(".ldli"+y).parent().parent().children("a.xqname").html();
		 axqhtml = axqhtml.replace(/&nbsp;/ig, "");
		 for(var i = 0 ; i < list.length ;i ++){
			 if(axqhtml == list[i].xqm && aldhtml == list[i].ldh && xqlddy.indexOf(list[i].dyh) == -1){
				 xqlddy.push(list[i].dyh);
			 }
		 }
		 if(xqlddy.length > 0){
			 $(".ldli"+y).append("<ul></ul>"); 
			 for(var a = 0 ; a < xqlddy.length ;a ++){
				 $(".ldli"+y).children("ul").append("<li class='dy'><a class='dyname' href='#job1'>&nbsp;&nbsp;&nbsp;&nbsp;"+xqlddy[a]+"</a></li>");
			 }
		 }
		
	 } 
	
	
	 
	
	$("#demo_menu2").mouseenter(function() {
		$("#demo_menu3").fadeIn(500);
	});
	
	$("#demo_menu3").mouseleave(function(){
		$("#demo_menu3").fadeOut(500);
	});
      
	$(".tree").treemenu({
		delay: 300
	}).openActive();
	
      

$("#demo_m").mouseenter(function() {
		$("#demo_m ul").css("transform", "rotate(90deg)");
		$("#demo_m ul li").css("background-color", "#C5D52B");
		$("#demo_menu1").show();
	}).mouseleave(function() {
		$("#demo_m ul").css("transform", "rotate(360deg)");
		$("#demo_m ul li").css("background-color","rgba(255,255,255,0.7)");
		$("#demo_menu1").hide();
	});

	$("#demo_menu1").mouseover(function() {
		$("#demo_m ul").css("transform", "rotate(90deg)");
		$("#demo_m ul li").css("background-color", "#C5D52B");
		$(this).show();
	}).mouseleave(function() {
		$("#demo_m ul").css("transform", "rotate(360deg)");
		$("#demo_m ul li").css("background-color","rgba(255,255,255,0.7)");
		$(this).hide();
	});

	var xq;
	var ld;
	var dy;
	
	
	/* 楼栋 */
	$("a.xqname").click(function(){
		window.open("<%=basePath%>user/szt.action","Conframe");
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		xq = $(this).html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	/* 楼栋 */
	$("a.ldname").click(function(){
		window.open("<%=basePath%>user/szt.action","Conframe");
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		ld = $(this).html();
		ld = ld.replace(/&nbsp;/ig, "");
		xq = $(this).parents("li.xq").children("a.xqname").html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	/* 单元 */
	$("a.dyname").click(function(){
		window.open("<%=basePath%>user/szt.action","Conframe");
		$('#Conframel').contents().find(".ac_kf li a").css("cssText","color:#fff !important;");
		
		dy = $(this).html();
		dy = dy.replace(/&nbsp;/ig, "");
		ld = $(this).parents("li.ld").children("a.ldname").html();
		ld = ld.replace(/&nbsp;/ig, "");
		xq = $(this).parents("li.xq").children("a.xqname").html();
		xq = xq.replace(/&nbsp;/ig, "");
		
	});	 
	
	 

	$(function(){
		$("#bannerleftopen").click(function(){
			$(this).hide();
			$("#leftcontent").show();
		})
		$("#bannerleftclose").click(function(){
			$("#leftcontent").hide();
			$("#bannerleftopen").show()
		})
		
		$("#bannerrightopenup").click(function(){
			$(this).hide();
			$("#rightupcontent").show();
		})
		$("#bannerrightcloseup").click(function(){
			$("#rightupcontent").hide();
			$("#bannerrightopenup").show()
		})
		
		$("#bannerrightopendown").click(function(){
			$(this).hide();
			$("#rightdowncontent").show();
		})
		$("#bannerrightclosedown").click(function(){
			$("#rightdowncontent").hide();
			$("#bannerrightopendown").show()
		})
		
		
		
	 	 $("#icon").mouseenter(function() {
			$("#demo_menu1").show();
		}).mouseleave(function() {
			/* $("#demo_menu1").hide(); */
		});
	
		$("#demo_menu1").mouseover(function() {
			$(this).show();
		}).mouseleave(function() {
			$(this).hide();
		});
	})    
</script>
                           
</body>


</html>