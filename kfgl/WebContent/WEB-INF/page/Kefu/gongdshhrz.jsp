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
<script type="text/javascript" src="../plugins/flot/jquery.flot.min.js"></script>
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
 var xinwordListj = ${xinwordList};
	
 /*var myDate = new Date() */

/* $('#auditors1').val(UserName); 
$('#auditors2').val(UserName); 
$('#auditors3').val(UserName);  */
/* 
$('#auditTime1').val(myDate.toLocaleString()); 
$('#auditTime2').val(myDate.toLocaleString()); 
$('#auditTime3').val(myDate.toLocaleString()); 
 */
</script>

 <script type="text/javascript">
 
 var type="<%=request.getSession().getAttribute("type")%>";
</script>
 <script type="text/javascript" src="../js/gongdshhrz.js"></script>
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
	#xin_search_btn,#dayin{
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
	.sh_succeed,.sh_back,.sh_void{
		border:none;
		background-color:rgb(60,61,61);
		width:60px;
		height:24px;
		color:#fff;
		border-radius:4px;
	}
	.sh_back,.sh_void{
		border:none;
		background-color:rgb(60,61,61);
		margin-left:5px;
		width:50px;
		height:24px;
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

<style>

	/* 审核，回退，作废弹出框 */
	#shword_succeed,
	#shword_back,
	#shword_void{
		display:none;
		position: fixed;
		left: 0;
	    top:0;
	    right:0;
	    bottom:0;
	    z-index: 100; 
		background-color:rgba(0,0,0,0.6);
	}
	
	/* 审核，回退，作废弹出框关闭按钮 */
	#shword_succeed .close,
	#shword_back .close,
	#shword_void .close{
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
	#shword_succeed .close::before,
	#shword_back .close::before, 
	#shword_void .close::before {
	    content: "\2716";
	}
	
	/* 审核，回退，作废弹出框input框设置 */
	#shword_succeed .mws-form-row .succeed_word_input,
	#shword_back .mws-form-row .back_word_input,
	#shword_void .mws-form-row .void_word_input {
		width:300px;
	}
	
	/* 审核，回退，作废弹出框label */
	#shword_succeed .mws-form-row label,
	#shword_back .mws-form-row label,
	#shword_void .mws-form-row label{
		width:90px;
	}
	
	/* 审核，回退，作废弹出框确认按钮 */
	#shword_succeed #word_succeed_btn,
	#shword_back #word_back_btn,
	#shword_void #word_void_btn{
		position:relative;
		top:4px;
		left:44%;
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
     url: "<%=basePath%>YhxxCon/findXqm.action",
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
			url : "<%=basePath%>YhxxCon/findLd.action", 
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
			url : "<%=basePath%>YhxxCon/findDy.action", 
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
<div id="increasedis" class="clearfix" style="overflow-x: hidden;">
	<div class="mws-panel grid_8 "
			style="width: 98%; padding-left: 12px; margin: 0px 0px 30px 0px; min-width:500px">
			<div class="mws-panel-header">
				<span class="mws-i-24 i-table-1"  style="float:left">工单审核</span>
					        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<span id="gdlxSpan" style="font-size:15px;color:#FFFFFF;float:left;margin-left: 15px; "></span>
						&emsp;&emsp;<span id="gdSpan" style="font-size:15px; float:left;margin-left: 15px;color:#FFFFFF;" ></span>
			</div>
			<div class="increase">
				<p>
				<%-- <c:if test="${type=='qyyh'}"> --%>
				 &nbsp;&nbsp;&nbsp;工单状态： <select style="width:150px" id="SelGd">
						<!-- <option value="全部">全部</option> -->
						<option value="未审核">未审核</option>
						<option value="逾期工单">逾期工单</option>
						
						<!-- <option value="审核通过">审核通过</option> -->
						<option value="回退修改">回退修改</option>
						<!-- <option value="作废">作废</option> -->
					<!-- 	<option value="已接单">已接单</option>
						<option value="已完成">已完成</option> -->
						<option value="已回访">已回访</option>
					</select>
				 登记人：<%-- <input value="${UserName}" size="5px" id="tjName"> --%>
				    <select id="SelTjName">
				  <c:if test="${!empty SelTjName }">
			   <option value="">--选择登记人--</option>
				<c:forEach items="${SelTjName}" var="selTjName">
					<option>${selTjName.tjName}</option>
				</c:forEach>
			     </c:if>
				    </select>
				     
					<input id="xin_search_btn" type="submit" value="搜索" />
					
				<input id="dayin" type="submit" value="导出" />
			
			
				</p>
			</div>
				<div id="xincreate_table_body" class="mws-panel-body"
				style="overflow: auto !important; height: 450px;">
				<table class="mws-table">
					<thead>
						<tr>
							<th class="table-th-css">工单编号<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">换热站</th>
							<th class="table-th-css">来访内容</th>
							<th class="table-th-css">登记人<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">登记时间<span class="span-up"></span> <span class="span-down"></span></th>
							<th class="table-th-css">工单状态<span class="span-up"></span> <span class="span-down"></span></th>
							<%-- <c:if test="${type=='qyyh'}"> --%>
							<th class="table-th-css">处理</th>
						<%-- 	</c:if> --%>
						</tr>
					</thead>
					<tbody id="shword_body">
						
						
					</tbody>
					</table>
			</div>
		</div>
		
		
		<div id="shword_succeed">
			<div class="mws-panel grid_4"
				style="width: 500px; min-width: 500px; margin: 6px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">审核通过</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 810px;">
					<form class="mws-form" action="updateGdSh.action"  method="post">
					
					<input name="state" value="审核通过" type="hidden">
						<div class="mws-form-inline">
							
							<div class="mws-form-row">
								<label>&emsp;&emsp;工单编号：</label>

								<div class="mws-form-item large">
									<input type="text" name="gdNum" id="gdNum" class="mws-textinput succeed_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							<div class="mws-form-row">
								<label>&emsp;&emsp;换热站：</label>

								<div class="mws-form-item large">
									<input type="text" name="hrz" id="hrz" class="mws-textinput succeed_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							

							<div class="mws-form-row">
								<label> &emsp;&emsp;来访内容：</label>
								<div class="mws-form-item large">
									<textarea
										style="width: 300px; height: 70px; font-size: 14px; color: rgba(65, 65, 55, 0.8);"
										class="mws-textinput succeed_word_input" readonly="readonly" name="visCon">
									</textarea>

								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput succeed_word_input" readonly="readonly"
										name="tjName" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput succeed_word_input" readonly="readonly"
										name="tjTime" value="" />
								</div>
							</div>
							
							<div class="mws-form-row">
								<label> &emsp;&emsp;审核人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput succeed_word_input" readonly="readonly"
										id="auditors1" name="auditors" value="${UserName}" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核意见：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput succeed_word_input"
										name="auditOpin" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput succeed_word_input" readonly="readonly"
										id="auditTime1" name="audittime" value="" />
								</div>
							</div>

						</div>
						<input type="submit" id="word_succeed_btn"
							class="mws-button black" value="审核通过" />
					</form>
				</div>
			</div>
		</div>
		
		<div id="shword_back">
			<div class="mws-panel grid_4"
				style="width: 500px; min-width: 500px; margin: 6px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">回退订单</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 810px;">
					<form class="mws-form" action="updateGdSh.action"  method="post">
					<input name="state" value="回退修改" type="hidden">
						<div class="mws-form-inline">
							
							<div class="mws-form-row">
								<label>&emsp;&emsp;工单编号：</label>

								<div class="mws-form-item large">
									<input type="text" name="gdNum" id="gdNum" class="mws-textinput back_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							<div class="mws-form-row">
								<label>&emsp;&emsp;换热站：</label>

								<div class="mws-form-item large">
									<input type="text" name="hrz" id="hrz" class="mws-textinput back_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							

							<div class="mws-form-row">
								<label> &emsp;&emsp;来访内容：</label>
								<div class="mws-form-item large">
									<textarea
										style="width: 300px; height: 70px; font-size: 14px; color: rgba(65, 65, 55, 0.8);"
										class="mws-textinput back_word_input" name="visCon" readonly="readonly">
									</textarea>
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput back_word_input" readonly="readonly"
										name="tjName" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput back_word_input" readonly="readonly"
										name="tjTime" value="" />
								</div>
							</div>
							
							<div class="mws-form-row">
								<label> &emsp;&emsp;审核人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput back_word_input" readonly="readonly"
										id="auditors2" name="auditors" value="${UserName}" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核意见：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput back_word_input"
										name="auditOpin" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput back_word_input" readonly="readonly"
										id="auditTime2" name="audittime" value="" />
								</div>
							</div>

						</div>
						<input type="submit" id="word_back_btn"
							class="mws-button black" value="回退订单" />
					</form>
				</div>
			</div>
		</div>
		
		<div id="shword_void">
			<div class="mws-panel grid_4"
				style="width: 500px; min-width: 500px; margin: 6px 30%;">
				<div class="mws-panel-header">
					<span class="mws-i-24 i-pencil">作废订单</span> <span class="close"></span>
				</div>
				<div class="mws-panel-body" style="height: 810px;">
					<form class="mws-form" action="updateGdSh.action"  method="post">
					<input name="state" value="作废" type="hidden">
						<div class="mws-form-inline">
							
							<div class="mws-form-row">
								<label>&emsp;&emsp;工单编号：</label>

								<div class="mws-form-item large">
									<input type="text" name="gdNum" id="gdNum" class="mws-textinput void_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							
							<div class="mws-form-row">
								<label>&emsp;&emsp;换热站：</label>

								<div class="mws-form-item large">
									<input type="text" name="hrz" id="hrz" class="mws-textinput void_word_input" readonly="readonly" value="" autofocus="autofocus" />
								</div>
							</div>
							

							<div class="mws-form-row">
								<label> &emsp;&emsp;来访内容：</label>
								<div class="mws-form-item large">
									<textarea
										style="width: 300px; height: 70px; font-size: 14px; color: rgba(65, 65, 55, 0.8);"
										class="mws-textinput void_word_input" name="visCon" readonly="readonly">
									</textarea>
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput void_word_input" readonly="readonly"
										name="tjName" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;登记时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput void_word_input" readonly="readonly"
										name="tjTime" value="" />
								</div>
							</div>
							
							<div class="mws-form-row">
								<label> &emsp;&emsp;审核人：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput void_word_input" readonly="readonly"
										id="auditors3" name="auditors" value="${UserName}" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核意见：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput void_word_input"
										name="auditOpin" value="" />
								</div>
							</div>

							<div class="mws-form-row">
								<label> &emsp;&emsp;审核时间：</label>
								<div class="mws-form-item large">
									<input type="text" class="mws-textinput void_word_input" readonly="readonly"
										id="auditTime3" name="audittime" value="" />
								</div>
							</div>

						</div>
						<input type="submit" id="word_void_btn"
							class="mws-button black" value="作废订单" />
					</form>
				</div>
			</div>
		</div>
		
	</div>
<script type="text/javascript">

$.ajax({
    type: "post",
    url: "<%=basePath%>HrzgdCon/searGdxx.action",
    dataType: "json",
    data : {
			"state" : "",
			"tjName" : "",
		},
    success: function(data){
  	var sel=data.kfglList;
  	var html="";
    for(var i = 0;i<sel.length;i++){  //循环LIST
        var veh = sel[i].state;//获取LIST里面的对象
        var count=sel[i].count;
        html+=veh+":"+count+"  ";
    }
    document.getElementById("gdSpan").innerText =html;
    }
	});
$.ajax({
    type: "post",
    url: "searGdlx.action",
    dataType: "json",
    data : {
			"state" : $("#SelGd option:selected").val(),
			"tjName" : $("#tjName").val(),
		},
    success: function(data){
  	var sel=data.kfglList;
  	var html="";
    for(var i = 0;i<sel.length;i++){  //循环LIST
        var veh = sel[i].gdlb;//获取LIST里面的对象
        var count=sel[i].count;
        html+=veh+": "+count+"            ";
    }
    document.getElementById("gdlxSpan").innerText =html;
    }
	});
</script>
</body>
</html>