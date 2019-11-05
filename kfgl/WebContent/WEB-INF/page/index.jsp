<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>


<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css" media="screen" />

<!-- Demo and Plugin Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/demo.css" media="screen" />

<link rel="stylesheet" type="text/css" href="../plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jimgareaselect/css/imgareaselect-default.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/fullcalendar/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="../plugins/tipsy/tipsy.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../plugins/spinner/spinner.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/jui/jquery.ui.css" media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="../css/mws.theme.css" media="screen" />

<!-- JavaScript Plugins -->

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
<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript" src="../plugins/flot/jquery.flot.resize.min.js"></script>
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

<style type="text/css">
	#bgt{
		background: url(../images/loginbj.jpg);
		width:100%;
		height:100%;
		background-repeat:no-repeat;
		background-size:cover; 
		/* -webkit-filter:blur(1px);
		-moz-filter:blur(1px);
		-o-filter:blur(1px);
		-ms-filter:blur(1px);
		filter:blur(1px); */
		position:absolute;
		left:0;
		top:0;
	}
	#login_name{
		width:500px;
		position:absolute;
		top:-140px;
		left:-42px;
	}
	#login_name p{
		font-family:Arial,Verdana,Sans-serif;
		font-size:34px;
		letter-spacing:4px;
	}
	

	
.sigma-content{
    width:800px;
	position:absolute;
	top:-200px;
	left:-270px;
    text-align: center;
  	background-color: #fff; 
  	padding:34px;
  	padding-bottom:4px;
}
.sigma-middle-line:before{
    content: '';
    display: block;
    height: 2px;
    width: 100%;
    background-color: #999; /*颜色需与主题大背景色一致*/ 
    position: relative;
    top: 24px;/*调节线高*/
    left: 0;
}
.sigma-line-text{
    display: inline-block;
    background: #fff; 
    padding: 0 18px 0 18px;
    position: relative;
    font-weight: 500;
    font-family:Arial,Verdana,Sans-serif;
	font-size:34px;
	letter-spacing:4px;
}
.sigma-line-sub{
	/* font-family:Arial,Verdana,Sans-serif; */
	font-size:16px;
	letter-spacing:1px;
}
	
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("div#mws-login .mws-login-back").mouseover(function(event) {
			$(this).find("a").animate({'left':0})
		}).mouseout(function(event) {
			$(this).find("a").animate({'left':70})
		});
	});
	
	function login(){
		var msg;
		var userName=$("#userName").val();
		var passWord=$("#passWord").val();
		var fjh=$("#fjh").val();
		if(userName==null||userName==""||passWord==null||passWord==""){
			alert("请输入用户名和密码")
			return
		}
		if(fjh==null||fjh==""){
			alert("请输入分机号")
			return
		}
		$.ajax({
			url : "<%=basePath%>user/login.action", 
			async : false,
			dataType : "json",
			data : {
				"username" : userName,
				"password" : passWord,
			},
			success : function(data) {
				msg = data.msg;
				 
				  
				if (msg == "0") {
					$("#myform").submit();
				}
				if (msg == "1") {
					alert("账号或密码错误")
					return false;
				} 
			}

		});
	}
</script>


<body>
	<div id="bgt"><img width="120px" src="../images/ewm.png"></div>
	
	<div id="mws-login">
		<div class="sigma-content">
		    <div class="sigma-middle-line">
		        <span class="sigma-line-text">ZYIS-H 智慧供热平台</span>
		    </div>
		    <p class="sigma-line-sub">Intelligent heating platform</p>
		</div>
    	<h1>登录</h1>
        <div class="mws-login-lock"><img src="../css/icons/24/locked-2.png" alt="" /></div>
    	<div id="mws-login-form">
        	<form class="mws-form" id="myform" action="home.action" method="post">
        	     <div style="padding:1px;margin:0px; " class="mws-form-row">
                	<div class="mws-form-item large">
                    	<input type="text" id="fjh"  name="fjh"  class="mws-login-username mws-textinput" placeholder="请输入分机号" />
                    </div>
                </div>
                <div  style="padding:1px;margin:0px; " class="mws-form-row">
                	<div class="mws-form-item large">
                    	<input type="text" id="userName" class="mws-login-username mws-textinput" placeholder="username" />
                    </div>
                </div>
                <div style="padding:1px;margin:0px; " class="mws-form-row">
                	<div class="mws-form-item large">
                    	<input type="password" id="passWord"  class="mws-login-password mws-textinput" placeholder="password" />
                    </div>
                </div>
                <div class="mws-form-row">
                	<input type="button" onclick="login()" value="Login" class="mws-button green mws-login-button" />
                </div>
            </form>
        </div>
    </div>


</body>

</html>