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
<title>Insert title here</title>
<!-- Required Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../css/fonts/ptsans/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/fluid.css"
	media="screen" />

<link rel="stylesheet" type="text/css" href="../css/mws.style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="../css/icons/icons.css"
	media="screen" />

<!-- Demo and Plugin Stylesheets -->
<link rel="stylesheet" type="text/css" href="../css/demo.css"
	media="screen" />

<link rel="stylesheet" type="text/css"
	href="../plugins/colorpicker/colorpicker.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/jimgareaselect/css/imgareaselect-default.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/fullcalendar/fullcalendar.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/fullcalendar/fullcalendar.print.css" media="print" />
<link rel="stylesheet" type="text/css" href="../plugins/tipsy/tipsy.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/sourcerer/Sourcerer-1.2.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="../plugins/spinner/spinner.css" media="screen" />
<link rel="stylesheet" type="text/css" href="../css/jui/jquery.ui.css"
	media="screen" />

<!-- Theme Stylesheet -->
<link rel="stylesheet" type="text/css" href="../css/mws.theme.css"
	media="screen" />

<!-- JavaScript Plugins -->

<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

<script type="text/javascript"
	src="../plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
<script type="text/javascript"
	src="../plugins/jquery.dualListBox-1.3.min.js"></script>
<script type="text/javascript" src="../plugins/jgrowl/jquery.jgrowl.js"></script>
<script type="text/javascript" src="../plugins/jquery.filestyle.js"></script>
<script type="text/javascript"
	src="../plugins/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.dataTables.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../plugins/flot/excanvas.min.js"></script>
<![endif]-->
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>

<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="../js/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../js/layui/layui.js"></script>
<script type="text/javascript" src="../js/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="../js/layui/css/layui.css" media="screen" />
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.stack.min.js"></script>
<script type="text/javascript"
	src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript"
	src="../plugins/colorpicker/colorpicker.js"></script>
<script type="text/javascript" src="../plugins/tipsy/jquery.tipsy.js"></script>
<script type="text/javascript"
	src="../plugins/sourcerer/Sourcerer-1.2.js"></script>
<script type="text/javascript" src="../plugins/jquery.placeholder.js"></script>
<script type="text/javascript" src="../plugins/jquery.validate.js"></script>
<script type="text/javascript" src="../plugins/jquery.mousewheel.js"></script>
<script type="text/javascript" src="../plugins/spinner/ui.spinner.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>

<script type="text/javascript" src="../js/mws.js"></script>
<script type="text/javascript" src="../js/demo.js"></script>
<script type="text/javascript" src="../js/themer.js"></script>
 <script type="text/javascript">
var xinwordListj = ${yhxx};

function shower(num){
	$.ajax({
		url : "<%=basePath%>KfgdCon/selGdByNum.action", 
		async : false,
		dataType : "json",
		data : {
			"num":num,
		},
		success : function(data) {
			 layer.open({
			        type: 1,
			        title: "审核意见",
			        area: '500px',
			        offset: '220px',
			        content: $("#show").html()
			    });
			 $("#shr").val(data.shr);	
			 $("#shsj").val(data.shsj);
			 $("#shyj").val(data.shyj);
		
		}

	});
}
</script>
<script type="text/html" id="show">
    

     
        <div class="layui-form-item">
            <label class="layui-form-label">审核人</label>
            <div class="layui-input-block">
                <input style="width:200px" id="shr" autocomplete="off" class="layui-input" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">审核时间</label>
            <div class="layui-input-block">
                <input style="width:200px" id="shsj" autocomplete="off"  class="layui-input" 
                       />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">审核意见</label>
            <div class="layui-input-block">
                <textarea style="width:300px;height:100px"  rows="3" cols="15" id="shyj" autocomplete="off"  class="layui-input" 
                       />
            </div>
        </div>
        
       
    
</script>
<style>

	/* 固定表头 */
	.table-th-css {
		position: relative !important;
		top: 0;
	}
	
	/*修改按钮 */
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_show,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_change,
	#xincreate_table_body .mws-table tbody .gradeX .xinjgd_del{
		border:none;
		background-color:rgb(60,61,61);
		height:24px;
		margin-right:6px;
		margin-top:2px;
		color:#fff;
		font-size: 12px;
		border-radius:4px;
	}
	
	/* 新增搜索DIV */
	.increase{
		display:block;
		width:99.8%;
		height:40px;
		background-color:#ccc;
		margin:0px auto;
		font-size:12px;
	}
	
	.increase p{
		height:40px;
	}
	
	.increase p select{
		width:120px;
		height:24px;
		border:none;
		border-radius:6px;
		margin-left:20px;
		padding-left:6px;
	}
	
	/* 新增搜索按钮 */
	#increase_btn,
	#xin_search_btn,#dayin,#qdelete{
		margin-top:8px;
		margin-left:10px;
		border:none;
		background-color:rgb(60,61,61);
		width:50px;
		height:24px;
		margin-right:6px;
		color:#fff;
		border-radius:4px;
	}
	.btn{
		margin-top:8px;
		margin-left:10px;
		border:none;
		background-color:rgb(60,61,61);
		width:50px;
		height:24px;
		margin-right:6px;
		color:#fff;
		border-radius:4px;
	}
	/* 新增修改弹出框 */
	#increase_word,
	#change_word{
		display:none;
		position: fixed;
		left: 0;
	    top:0;
	    right:0;
	    bottom:0;
	    z-index: 100; 
		background-color:rgba(0,0,0,0.6);
	}
	
	/* 新增修改弹出框关闭按钮 */
	#increase_word .close,
	#change_word .close{
		display:block;
		background-color:rgb(193,213,43);
		width:24px;
		height:24px;
		color: #fff;
    	border-radius: 13px;
		position:absolute;
		top:14px;
		right:20px;
		line-height: 24px;
   		text-align: center;
   		font-size: 18px;
	}
	#increase_word .close::before,
	#change_word .close::before {
	    content: "\2716";
	}
	
	/* 新增修改弹出框input */
	#increase_word .mws-form-row .increase_word_input,
	#change_word .mws-form-row .change_word_input {
		width:300px;
	}
	
	/* 新增修改弹出框label */
	#increase_word .mws-form-row label,
	#change_word .mws-form-row label{
		width:100px;
	}
	
	/* 新增修改弹出框确认按钮 */
	#increase_word #word_increase_btn,
	#change_word #word_change_btn{
		position:relative;
		top:10px;
		left:47%;
	}
	
	
	/* thead排序按钮 */
	.span-up{
        border-style: solid;
        border-width: 0px 5px 5px 5px;
        border-color: transparent transparent black transparent;
        width: 0px;
        height: 0px;
        display: block;
        position: absolute;
        top: 14px;
       	right: 6px;
    }
    
    .span-down{
        border-style: solid;
        border-width: 5px 5px 0px 5px;
        border-color: black transparent transparent transparent;
        width: 0px;
        height: 0px;
        display: block;
        position: absolute;
        top: 20px;
        right: 6px;
    }
	th, td {
	white-space: nowrap;
}
</style>

 <script type="text/javascript">
 
 var type="<%=request.getSession().getAttribute("type")%>";
 $(document).ready(
function() {
 var html ;
 $.ajax({
     type: "post",
     url: "findXqm.action",
     dataType: "json",
     success: function(data){
      
       for(var i=0;i<data.findXqm.length;i++){
    	   html +='<option value="'+data.findXqm[i].XqName+'">'+data.findXqm[i].XqName+'</option>';
       }
       $('#xq').append(html);
      
    }
 });
 $("#xq").change(function(){
	
	 $.ajax({
			url : "findLd.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
			},
			success : function(data) {
			
				$("#ldh option:gt(0)").remove();
				$("#dyh option:gt(0)").remove();
				var ld=data.Ld;
				for(var i=0; i<ld.length; i++){
					
					$("#ldh").append("<option value='"+ld[i].BuildNO+"'>"+ld[i].BuildNO+"</option>");
				}	
			}

		});
	});
 
 $("#ldh").change(function(){
	 $.ajax({
			url : "findDy.action", 
			async : false,
			dataType : "json",
			data : {
				"xqm" : $("#xq").val(),
				"ldh" : $("#ldh").val(),
			},
			success : function(data) {
				$("#dyh option:gt(0)").remove();
				var dy=data.Dy;
				for(var i=0; i<dy.length; i++){
					
					$("#dyh").append("<option value='"+dy[i].CellNO+"'>"+dy[i].CellNO+"</option>");
				}	
			}

		});
		
		
	});
			});
 </script>

</head>
<body>
	 
<form  action="read.action" method="post" enctype="multipart/form-data"  > 
          				
              		    <input style="width:15px;" name="Importfile" type="file"  /> 
             			
                      <input type="submit" class="btn" value="导入" class="btn btn-primary btn-sm" />
                </form>
	<div id="increasedis" class="clearfix" style="overflow-x: hidden;">
	

		<div class="mws-panel grid_8 "
			style="width: 98%; padding-left: 12px; margin: 0px 0px 30px 0px; min-width:500px">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1" style="float:left">新建工单</span>
				        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span id="gdlxSpan" style="font-size:15px;color:#FFFFFF;float:left;margin-left: 15px; "></span>
						&emsp;&emsp;<span id="gdSpan" style="font-size:15px; float:left;margin-left: 15px;color:#FFFFFF;" ></span>
					
			</div>
			<div class="increase">
				<p>
				<input id="increase_btn" type="submit" value="新增" />
				
					
					<span style="font-size:20px;margin-left:20px;"> | </span>
					<span>选择公司：
         <select id="ssgs" name="ssgs">
         </select>
         </span>
        <span>选择小区：
						<select id="xq">
							<option value="">--小区名称--</option>
						</select>
					</span>
					<span>楼栋号：
						<select id="ldh">
							<option value="">--选择楼栋号--</option>
						</select>
					</span>
					<span>单元号：
						<select id="dyh">
							<option value="" >--选择单元号--</option>
						</select>
					</span>
					<span>户号：
						<input id="hh"  style="width:55px;height: 18px" type="text" value="" />
					</span>
					<input id="xin_search_btn" type="submit" value="搜索" />
					<input class="btn" id="dayin" type="submit" value="导出" />
					<input class="btn" id="qdelete" type="submit" value="全删" />
					
					
					<!-- <div  style="float:left; ">
                 
                </div> -->
					<div>
					
              <!--     <form  action="read.action" method="post" enctype="multipart/form-data"  >
          				  <div style="float:left; font-size:10px" > 
              		    <input name="Importfile" type="file"  /> 
             			</div>
                      <input type="submit" value="导入"  class="btn btn-primary btn-sm" />
                </form> -->
                </div>
				
			</div>
				<div id="xincreate_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 700px;">
				<table class="mws-table">
					<thead>
						<tr>
							     <th>小区名称</th>
									<th>用户卡号</th>
									<th>阀门地址</th>
									<th>楼栋号</th>
									<th>单元号</th>
									<th>户号</th>
									<th>用户姓名</th>
									<th>电话号码</th>
									<th>建筑面积</th>
									<th>供热面积</th>
									<th>缴费状态</th>
									<th>备注</th>
									<th>处理</th>
						</tr>
					</thead>
					<tbody id="xinword_body">
						
				
					</tbody>
				</table>
			</div>
		</div>

		<div id="increase_word">
			<div class="mws-panel grid_4"
				style="width: 500px; min-width: 500px; margin: 100px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">新增用户</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 730px;">
					<form class="mws-form" action="addYhxx.action" method="post">
						<div class="mws-form-inline">
						<div class="mws-form-row">
								<label>&emsp;&emsp;小区名称：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="xqName" value="" autofocus="autofocus" />
								</div>
							</div>
							<div class="mws-form-row">
								<label>&emsp;&emsp;用户卡号：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="idNum" value="" autofocus="autofocus" />
								</div>
							</div>
							<div class="mws-form-row">
								<label>&emsp;&emsp;阀门地址：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										name="valAd" value="" autofocus="autofocus" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;楼栋号：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name="buildNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;单元号：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name="cellNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;户号：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name="houseNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;用户姓名：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name="yhName" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;电话号码：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name=telephone value="" />
								</div>
							</div>


							<div class="mws-form-row">
								<label> &emsp;&emsp;建筑面积：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										name="buileArea" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;供热面积：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										 name="heatArea" value="" />
								</div>
							</div>
							<div class="mws-form-row">
								<label> &emsp;&emsp;缴费状态：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input"
										 name="sfjf" value="" />
								</div>
							</div>
							<div class="mws-form-row">
								<label> &emsp;&emsp;备注：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput increase_word_input" 
										 name="bz" value="" />
								</div>
							</div>
						</div>
						<input type="submit" id="word_increase_btn"
							class="mws-button black" value="新增" />
					</form>
				</div>
			</div>
		</div>
		
		
		<div id="change_word">
			<div class="mws-panel grid_4"
				style="width: 500px; min-width: 500px; margin: 100px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">修改信息</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 730px;">
					<form class="mws-form" action="updateYhxx.action"  method="post">
						<div class="mws-form-inline">
						
							<div class="mws-form-row">
								<label>&emsp;&emsp;小区名称：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="xqName" value="" autofocus="autofocus" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;用户卡号：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="idNum" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;阀门地址：</label>

								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="valAd" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;楼栋号：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="buildNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label>&emsp;&emsp;单元号：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="cellNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;户号：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="houseNo" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;用户姓名：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="yhName" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;电话号码：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input" 
										name="telephone" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;建筑面积：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input" 
										name="buileArea" value="" />
								</div>
							</div>
								<div class="mws-form-row">
								<label> &emsp;&emsp;供热面积：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input" 
										name="heatArea" value="" />
								</div>
							</div>
							<div class="mws-form-row">
								<label> &emsp;&emsp;缴费状态：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input"
										name="sfjf" value="" />
								</div>
							</div>
  							<div class="mws-form-row">
								<label> &emsp;&emsp;备注：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput change_word_input" 
										name="bz" value="" />
								</div>
							</div>
							
						  
							 <input type="hidden" class="mws-textinput change_word_input"
							name="id" value="" /> 
							
						</div>
						<input type="submit" id="word_change_btn"
							class="mws-button black" value="修改" />
					</form>
				</div>
			</div>
		</div>
		
		
	</div>

</body>
<script type="text/javascript">
var ssgs="<%=request.getSession().getAttribute("gs")%>";
var strs= new Array(); //定义一数组 
  strs=ssgs.split(","); //字符分割 
for (i=0;i<strs.length ;i++ ) 
{ 
	var s=strs[i];
	
	 $("#ssgs").append("<option value='"+s+"'>"+s+"</option>");

}
</script>
<script type="text/javascript" src="../js/yhxx.js"></script>
</html>