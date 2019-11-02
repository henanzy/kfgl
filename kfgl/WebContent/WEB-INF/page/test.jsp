<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--

   ''下面代码为连接因子呼叫中心系统的Web客户端,实际应用时请根据情况进行调整
   ''呼叫中心系统手册网址 http://www.yinzisoft.com/help/callcenter/index.htm
   ''视频演示 http://www.yinzisoft.com/help/callcentervideo/index.htm
   ''也可以委托我们来开发,我们会根据情况酌情收费
   ''联系方式：手机联系:139-178-98099   QQ: 7005900

   ''上海因子软件有限公司
   ''网址：http://www.yinzisoft.com
   ''电话：139-178-98099(上海)
   ''QQ：  7005900
   ''微信：yinzisoft
   ''联系人：吴工

-->

<!--
    注释说明:本示例编程语言为asp,如要更换成其它语言需要将部分代码进行相应转换,如<% %>之间的代码,其它html与js代码可以直接复制使用
    本页面的接口功能全面，如觉得复杂请看简易版： 1_1.asp 
-->
<!--#INCLUDE FILE="config.asp"-->
<!--#INCLUDE FILE="md5.asp"-->
<%
  
  '读取cti参数,实际应用时可跳过此步直接给参数赋值
  weburlreg=""   '弹屏网址
  ctiipreg=""    'CTI服务器地址 
  ipportreg=""   'CTI服务器端口
  
  if sysconfig="1" then 
   
        on error resume next  
        Dim WshShell
        set WshShell=Server.CreateObject("WScript.Shell")
        weburlreg=WshShell.RegRead("HKLM\SOFTWARE\YinZiSoft\Cti\weburl")       '弹屏网址
        ctiipreg=WshShell.RegRead("HKLM\SOFTWARE\YinZiSoft\Cti\ctiip")         'CTI服务器地址
        ipportreg=WshShell.RegRead("HKLM\SOFTWARE\YinZiSoft\Cti\ipport")       'CTI服务器端口
        swfparamreg=WshShell.RegRead("HKLM\SOFTWARE\YinZiSoft\Cti\swfparam")   'swf相关参数
        set WshShell=nothing
        if err.number<>0 then
		      response.write "读取注册表出错：" &err.description
	          response.end
        end if
        
  end if

  if sysconfig="2" then

      	on error resume next  
      	set fso=server.CreateObject("Scripting.FileSystemObject")
      	if sysrun=1 then
             filepath=server.mappath("../cti.reg")
      	end if
        if sysrun=2 then
            filepath=NetBox.mappath("../cti.reg")
      	end if  
      	if fso.FileExists(filepath) then   ''文件存在
            set temp=fso.opentextfile(filepath,1)
            do while not temp.AtEndOfStream
                 tempstr=temp.ReadLine
                 
                 if mid(tempstr,2,6)="weburl" then
                       weburlreg=mid(tempstr,11,len(tempstr)-11)
                 end if   
       
                 if mid(tempstr,2,5)="ctiip" then
                       ctiipreg=mid(tempstr,10,len(tempstr)-10)
                 end if
                 
                 if mid(tempstr,2,6)="ipport" then
                       ipportreg=mid(tempstr,11,len(tempstr)-11)
                 end if  
                 
                 if mid(tempstr,2,8)="swfparam" then
                       swfparamreg=mid(tempstr,13,len(tempstr)-11)
                 end if  
                                                 
            loop
            temp.close
            set temp=nothing
        else
		  	         response.write "配置文件cti.reg不存生" 
	                 response.end  
        end if    
        set fso=nothing 
        if err.number<>0 then
		  	         response.write "读取配置文件cti.reg出错：" &err.description 
	                 response.end
        end if
        
  end if
  if trim(request("weburlreg"))<>"" then
     weburlreg=trim(request("weburlreg"))
  else      
     if weburlreg="" then
        weburlreg="2.asp"   '使用系统自带的弹屏网址
     end if
  end if   
  
  extno=trim(request("extno"))    '分机号  
  if extno="" then
         extno="801"
  end if
  
  seatpass=trim(request("seatpass"))  '密码
  if seatpass="" then
         seatpass="111111"
  end if
  passoption=trim(request("passoption"))
  if passoption="1" then
         ''已是md5加密过了
  else
         seatpass=md5(seatpass)    '使用md5加密后进行传递
  end if


  ctiip=trim(request("ctiip"))    '呼叫中心服务器的IP地址 
  if ctiip="" then
         ctiip=ctiipreg
  end if
 
  ipport=trim(request("ipport"))  '呼叫中心服务器监听的端口
  if ipport="" then
         ipport=ipportreg
  end if
   
  logintype=trim(request("logintype"))  '登录方式  1=Flash控件  2=WebSocket
  if logintype="" then
      logintype="1"
  end if
  msgtype=trim(request("msgtype"))  '来电选项
  if msgtype="" then
      msgtype="1"
  end if
  
  isautologin="1"          '是否启用自动登录，即与呼叫中心服务器断开了会自动重新登录
  isshowcall="1"           '是否显示对外呼叫相关控件，“1”为显示，其它值不显示
  ishidetel="0"            '是否要隐藏来电码，“0”不隐藏，“1”为隐藏
  isshownopickup="0"       '是否显示当天未接电话列表 
  
  if len(swfparamreg)>=4 then
        isautologin=mid(swfparamreg,1,1)
        isshowcall=mid(swfparamreg,2,1)
        ishidetel=mid(swfparamreg,3,1) 
        isshownopickup=mid(swfparamreg,4,1)                   
  end if      
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>座席客户端 -- 因子软件</title>
<style>
body{
text-align:left;
margin:0 10px;
padding:0;
font:normal 12px 宋体,arial,verdana,sans-serif;
color:#000;
}
div, form, img, ul, ol, li, dl, dt, dd {margin: 0; padding: 0; border: 0px none; }

table td{font:normal 12px 宋体,arial,verdana,sans-serif;}

a:link {
	color: blue;
}
a:visited {
	color: blue;
}

a:hover {
	color: blue;
}

#waitnum, #waitnumme{color:red;}

fieldset {
    width:200px;
	margin: 0px; 
	padding:10px; 
	border:1px solid #B7D9FE; 
	text-align:left;
} 
legend {
	color:#06c;
	font-weight:800; 
	padding:3px 6px;	
} 

.dialinfo{width:300px;}
.login{width:350px;}
.nowinfo{width:350px;}
.moreinfo{width:550px;}

.btnsmall{border-style: none;
	border-color: inherit;
	border-width: medium;
	margin-right:10px;	vertical-align:bottom;	display:inline-block;	outline:none;	height:20px;	line-height:20px;	background-color:#1272CE;	color:#fff;	font-weight:bold;	text-align:center;	cursor:pointer;	font-size:13px;
}

.btnsmall2{border-style: none;
	border-color: inherit;
	border-width: medium;
	margin-right:10px;	vertical-align:bottom;	display:inline-block;	outline:none;	height:20px;	line-height:20px;	background-color:#CC3300;	color:#fff;	font-weight:bold;	text-align:center;	cursor:pointer;	font-size:13px;
}


.telno{background:url('diala.jpg') no-repeat;text-align:center;}

 
</style>

<script type="text/javascript" src="swfobject.js"></script>
<script type="text/javascript">

//通过swfobject.js来加载cti.swf 还是 通过普通代码来加载cti.swf，请根据实际情况选择一种
//考虑到浏览器兼容方面的原因，建议使用swfobject.js来加载cti.swf

//用swfobject来引用flash
		
var flashvars = { 
      extno: "<%=extno%>", 
      seatpass: "<%=seatpass%>", 
      ctiip: "<%=ctiip%>", 
      ipport: "<%=ipport%>", 
      isshowcall: "<%=isshowcall%>", 
      isautologin: "<%=isautologin%>" ,
      ishidetel: "<%=ishidetel%>"                         
    }; 
    var params = { 
      menu: "false" 
    }; 
    var attributes = { 
      id: "cti", 
      name: "cti" 
    }; 

<% 
   if logintype=1 then
%>

//如要通过普通代码来加载cti.swf请注释掉下面一行的代码，请在html代码部分做一个切换选择
swfobject.embedSWF("cti.swf", "callcenter", "350", "80", "9.0.0", "cti.swf", flashvars, params, attributes); 
  		
<%
   else    
%>
//下面WebSocket的方式
var ws;
function ConnectionCTI() {
try {
ws = new WebSocket("ws://<%=ctiip%>:<%=ipport%>/chat");//连接服务器
ws.onopen = function(event){SendData('<%=extno%><%=seatpass%>');};
ws.onmessage = function(event){websocketmsg(event.data);};
ws.onclose = function(event){websocketmsg('CTI连接中断');};
ws.onerror = function(event){websocketmsg('CTI连接中断');};
}catch (ex) {
alert(ex.message);
}
};
 
function SendData(themsg) {
try{
ws.send(themsg);
}catch(ex){
alert(ex.message);
}
};
 
function seestate(){
alert(ws.readyState);
}

function websocketmsg(msgstr)
{
   
   if(msgstr=="CTI连接中断")
   {
      //显示到消息框中
      document.getElementById("callcenter").innerHTML=msgstr;
      gosearch(msgstr);
   }
   else
   {
        var arrTmp = msgstr.split("|");  // 分隔信息
        if(arrTmp.length>1)
        {
            gosearch(msgstr);
        }
        else
        {
           //显示到消息框中
           document.getElementById("callcenter").innerHTML=msgstr;
        }   
   }   
}
<% 
   end if
%>     
</script>
		
<script type="text/javascript">
//JS操作Cookie函数
var msgtype="<%=msgtype%>";

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
function gologin()
{
      document.form1.target="";
      document.form1.action="1.asp";      
      document.form1.submit();
      document.form1.target="_blank";
      document.form1.action='<%=weburlreg%>';       
}
</script>

<script type="text/javascript">
var chatwinHashTable = new Object();   // 座席交谈窗口对象
//添加
function addchatwin(key,value)
{
       // 判断key是否存在
       if(key in chatwinHashTable)
       {
           delete(chatwinHashTable[key]);//如存在先删除再添加
           chatwinHashTable[key]=value;           
       }
       else
       {
           chatwinHashTable[key]=value;
       }
}

//删除
function delchatwin(key)
{
    delete(chatwinHashTable[key]);
}

//取值
function getchatwin(key)
{
   if(key in chatwinHashTable)
   {
      return chatwinHashTable[key];
   }
   else
   {
     return null;
   }   
    
}
</script>

<script type="text/javascript">
//弹屏JS代码，函数名称不能修改
function gosearch(thestr)
{
  if(thestr!=""){ 
   if(thestr=="CTI连接中断")
   {
      document.getElementById("outlineinfo").innerHTML="CTI连接中断";   
      document.getElementById("inlineinfo").innerHTML="CTI连接中断";   
      document.getElementById("conferenceinfo").innerHTML="CTI连接中断";       
      document.getElementById("waitnum").innerHTML="";
      document.getElementById("waitnumme").innerHTML="";         
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
    //数组中第13位表示号码归属地   
            
    if(arrTmp[0]=="1")  //处理来电或弹屏信息
    {
      if(msgtype=="1")//弹屏
      {
          document.form1.mobile.value=thestr;
          document.form1.submit();
      }
      if(msgtype=="2")//当前页面刷新，也可以通过AJax来获取其它信息来显示在本页面上
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
            backinlinestr=backinlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('inlineinfo','block',365);\">显示分机状态</a>";    
      }
      else
      {
            backinlinestr=backinlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('inlineinfo','none',365);\">隐藏分机状态</a>";      
      }
      
      backinlinestr=backinlinestr+"</span>";   
      backinlinestr=backinlinestr+"<table  border=\"0\" style=\"display:"+isinlineinfo+"\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#B7D9FE\" width=\"520\">";
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
          
          if("<%=extno%>"==nowinlineinfoarr[1])
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
            backoutlinestr=backoutlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('outlineinfo','block',365);\">显示外线状态</a>";    
      }
      else
      {
            backoutlinestr=backoutlinestr+"<a href=\"#\" onclick=\"javascript:setCookie('outlineinfo','none',365);\">隐藏外线状态</a>";      
      }
      
      backinlinestr=backinlinestr+"</span>";       
      backoutlinestr=backoutlinestr+"<table  border=\"0\" style=\"display:"+isoutlineinfo+"\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#B7D9FE\" width=\"520\">";
      backoutlinestr=backoutlinestr+"<tr bgcolor=\"#EEEEEE\">";
      backoutlinestr=backoutlinestr+"<td width=\"5%\">ID</td>";
      backoutlinestr=backoutlinestr+"<td width=\"15%\">状态</td>";
      backoutlinestr=backoutlinestr+"<td width=\"20%\">呼叫类型</td>";
      backoutlinestr=backoutlinestr+"<td width=\"25%\">主叫</td>";
      backoutlinestr=backoutlinestr+"<td width=\"10%\">被叫</td>";  
      backoutlinestr=backoutlinestr+"<td width=\"15%\">持续</td>";  
      backoutlinestr=backoutlinestr+"<td width=\"10%\">优先</td>";            
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
      
      //下面处理会议信息
      var conferencestr="<table  border=\"0\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#B7D9FE\" width=\"520\">";
      conferencestr=conferencestr+"<tr bgcolor=\"#EEEEEE\">";
      conferencestr=conferencestr+"<td width=\"10%\">会议ID</td>";
      conferencestr=conferencestr+"<td width=\"40%\">会议名称</td>";
      conferencestr=conferencestr+"<td width=\"30%\">创建时间</td>";
      conferencestr=conferencestr+"<td width=\"10%\">人数</td>";  
      conferencestr=conferencestr+"<td width=\"10%\">操作</td>";              
      conferencestr=conferencestr+"</tr>";
      
      var conferencearr=infoarr[3].split(",");//所有会议信息
      for(var i=0;i<conferencearr.length;i++)
      {
       var nowconferencearr=conferencearr[i].split("$");
       if(nowconferencearr.length>=5)
       {
          conferencestr=conferencestr+"<tr bgcolor=\"#F8F8F8\">";
          conferencestr=conferencestr+"<td>"+nowconferencearr[0]+"</td>";
          conferencestr=conferencestr+"<td>"+nowconferencearr[1]+"</td>";
          conferencestr=conferencestr+"<td>"+nowconferencearr[2]+"</td>";
          conferencestr=conferencestr+"<td>"+nowconferencearr[3]+"</td>";   
          conferencestr=conferencestr+"<td><a href=\"javascript:callExternal('closeConference|"+nowconferencearr[0]+"')\">关闭</a></td>";                                                      
          conferencestr=conferencestr+"</tr>";  
          
          //取此会议所有成员信息
          if(nowconferencearr[3]!="")
          {
              conferencestr=conferencestr+"<tr>";  
              conferencestr=conferencestr+"<td bgcolor=\"#EEEEEE\"></td>";
              conferencestr=conferencestr+"<td colspan=\"4\">";  
                          
              conferencestr=conferencestr+"<table  border=\"0\" cellpadding=\"4\" cellspacing=\"1\" bgcolor=\"#B7D9FE\" width=\"100%\"align=\"center\">";   
              conferencestr=conferencestr+"<tr bgcolor=\"#EEEEEE\">";
              conferencestr=conferencestr+"<td width=\"15%\">通道号</td>";
              conferencestr=conferencestr+"<td width=\"40%\">电话号码</td>";
              conferencestr=conferencestr+"<td width=\"15%\">状态</td>";
              conferencestr=conferencestr+"<td width=\"30%\">操作</td>"; 
              conferencestr=conferencestr+"</tr>";
                                            
              var memberarr=nowconferencearr[4].split("^");
              for(var j=0;j<memberarr.length;j++)
              {
                 var nowmemberarr=memberarr[j].split("*");//当前成员
                 conferencestr=conferencestr+"<tr bgcolor=\"#F8F8F8\">";
                 conferencestr=conferencestr+"<td>"+nowmemberarr[0]+"</td>";
                 conferencestr=conferencestr+"<td>"+nowmemberarr[1]+"</td>";
                 if(nowmemberarr[2]=="1")
                 {
                      conferencestr=conferencestr+"<td>可言</td>";     
                      conferencestr=conferencestr+"<td><a href=\"javascript:callExternal('updateConferenceMember|"+nowmemberarr[0]+"');\";>禁止发言</a> <a href=\"javascript:callExternal('exitConference|"+nowmemberarr[0]+"');\">退出</a></td>";                                    
                 }
                 if(nowmemberarr[2]=="2")
                 {
                      conferencestr=conferencestr+"<td>禁言</td>";     
                      conferencestr=conferencestr+"<td><a href=\"javascript:callExternal('updateConferenceMember|"+nowmemberarr[0]+"');\">开通发言</a> <a href=\"javascript:callExternal('exitConference|"+nowmemberarr[0]+"');\">退出</a></td>";                                    
                 }                                             
                 conferencestr=conferencestr+"</tr>";                  

              }              
              conferencestr=conferencestr+"</table>"; 
              conferencestr=conferencestr+"</td>";         
              conferencestr=conferencestr+"</tr>";  
          }   
       }
      }      
      conferencestr=conferencestr+"</table>";  
      
      
      document.getElementById("conferenceinfo").innerHTML=conferencestr;
     

      
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
          //窗口不存在或已关闭
          var chatwin=window.open("<%=chaturl1%>?myextno="+arrTmp[2]+"&toextno="+arrTmp[1]+"&msg="+thestr,"Chat"+arrTmp[1]);
          addchatwin(arrTmp[1],chatwin); 
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

//外拨呼叫JS函数、与呼叫中心服务器交互函数
//此函数一定要放在cti.swf所在页面中
//-----关于调用--------//
//本页面中直接调用：如callExternal("913917898099")

//如是框架结构，分上、左、右、下，框架名分别为:topf,leftf,rightf,bottomf，在topf框架用再用ifrmae引用本页面，ifrmae名为ctif
//那么在其它框架页引用方法： top.frames["topf"].frames["ctif"].callExternal("913917898099");
//如是框架页中点击打开的新窗口引用方法：window.opener.parent.frames["topf"].frames["ctif"].callExternal("913917898099") 或 window.opener.frames["topf"].frames["ctif"].callExternal("913917898099"); 

<% 
   if logintype=1 then
%>

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

<%
   else
%>
//下面WebSocket的方式
function callExternal(thetel)
{
    SendData(thetel);
}
<%   
   end if
%>

function addtelnum(thenum)
{
  if(thenum=="-1")
  {
     document.form1.telnoa.value=document.form1.telnoa.value.substring(0,document.form1.telnoa.value.length-1);
  }else{
     document.form1.telnoa.value=document.form1.telnoa.value+thenum;
  }
}

//座席之间相互发送消息
function gochat(toextno)
{
   if(toextno==<%=extno%>)
   {
      alert("自己不能给自己发消息！");
   }
   else
   {
      var chatwin=window.open("<%=chaturl2%>?myextno=<%=extno%>&toextno="+toextno,"Chat"+toextno);
      addchatwin(toextno,chatwin);
   }
}

//提交单个任务群呼
function gotask()
{
      document.form1.target="_blank";
      document.form1.action="gotaskrec.asp";      
      document.form1.submit();
      document.form1.target="";
      document.form1.action='<%=weburlreg%>';   
}

function exitgo()
{

      //callExternal('X');
      //this.location.reload();
      //setTimeout("exitgo()",6000);
      
}

//测试代码
//setTimeout("exitgo()",6000);

</script>


</head>

<body>

<br />
<%
    '如需要隐藏下面的swf文件，可以swf宽度与高度全设置为0，但不能div设置成隐藏
%> <fieldset class="nowinfo">
<legend>即时信息</legend>
<%  
   ''通过swfobject.js来加载cti.swf 还是 通过普通代码来加载cti.swf，请根据实际情况选择一种
   ''考虑到浏览器兼容方面的原因，建议使用swfobject.js来加载cti.swf
   if 1=1 then   ''通过swfobject.js来加载cti.swf
%>   
<div id="callcenter" align="left" style="height:82px;">
</div>
<%
   end if
%>
<% 
   if 1=0 then   ''通过普通代码来加载cti.swf
%>   
<div align="left" style="height:82px;">
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="350" height="80" id="cti" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="allowFullScreen" value="false" />
<param name="movie" value="cti.swf?extno=<%=extno%>&seatpass=<%=seatpass%>&ctiip=<%=ctiip%>&ipport=<%=ipport%>&isshowcall=1&isautologin=1&ishidetel=0" />
<param name="quality" value="high" />
<param name="bgcolor" value="#ffffff" />
<param name="wmode" value="transparent" />
<embed src="cti.swf?extno=<%=extno%>&seatpass=<%=seatpass%>&ctiip=<%=ctiip%>&ipport=<%=ipport%>&isshowcall=1&isautologin=1&ishidetel=0" quality="high" bgcolor="#ffffff" width="350" height="80" name="1" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer_cn" /></object>
</div>
<%
   end if
%> 
</fieldset> <br />
<br />
<input type="button" value="置忙" onclick="javascript:callExternal('StatusBusy');" class="btnsmall"><input type="button" value="置闲" onclick="javascript:callExternal('StatusFree');" class="btnsmall"><input type="button" value="保持通话" onclick="javascript:callExternal('SeatHoldIng');" class="btnsmall"><input type="button" value="恢复通话" onclick="javascript:callExternal('SeatHoldOK');" class="btnsmall">
<input type="button" value="挂断" onclick="javascript:callExternal('CloseTalk');" class="btnsmall"><br />
<%
   if msgtype=2 then
%> <fieldset>
<legend>来电信息</legend>
<span id="newcallinfo"></span></fieldset> <br />
<%
   end if
%> <fieldset>
<legend>排队信息</legend>
排队数量：<span id="waitnum"></span> 自己分组数量：<span id="waitnumme"></span> </fieldset>
<br />
<% 
   if isshownopickup="1" then
%> <fieldset>
<legend>未接电话</legend>
<iframe src="../search/nopickup.asp?extno=<%=extno%>" name="nopickup" frameborder="0" border="0" width="200" height="150" align="middle"></iframe>    
</fieldset>
<br />
<%
   end if
%>   
<fieldset class="moreinfo">
<legend>分机状态信息</legend>
<span id="inlineinfo"></span></fieldset> <br />
<fieldset class="moreinfo">
<legend>外线状态信息</legend>
<span id="outlineinfo"></span></fieldset> <br />
<fieldset class="moreinfo">
<legend>会议信息</legend>
<span id="conferenceinfo"></span></fieldset> <br />
<fieldset class="moreinfo">
<legend>座席放音信息</legend>
<table cellPadding="4" cellSpacing="1" width="520" bgColor="#b7d9fe" border="0">
  <tr bgColor="#eeeeee">
    <td width="10%">序号</td>
    <td width="30%">名称</td>
    <td width="30%">文件</td>
    <td width="30%">操作</td>    
  </tr>
  <%
  on error resume next             
  set fso=server.CreateObject("Scripting.FileSystemObject")
  if sysrun=1 then
       filepath=server.mappath("../SeatPlay.txt")
  end if
  if sysrun=2 then
       filepath=NetBox.mappath("../SeatPlay.txt")
  end if  
  if fso.FileExists(filepath) then   ''文件存在
      filei=0
      set temp=fso.opentextfile(filepath,1)
      do while not temp.AtEndOfStream

         tempplay=temp.ReadLine
         if trim(tempplay)="" or left(tempplay,2)="//" then  ''是空白 或 注释内容跳过
         else
            filei=filei+1    
            tempplayarr=split(tempplay,",")
%>  <tr bgColor="#f8f8f8">
    <td><%=filei%></td>
    <td><%=tempplayarr(0)%></td>
    <td><%=tempplayarr(1)%></td>
    <td>    <a title="开始播放<%=tempplayarr(0)%>" href="javascript:callExternal('SeatPlay|<%=tempplayarr(1)%>');">播放</a>  <a title="暂停播放<%=tempplayarr(0)%>" href="javascript:callExternal('PausePlay');">暂停</a>  <a title="继续播放<%=tempplayarr(0)%>" href="javascript:callExternal('RestPlay');">继续</a>  <a title="停止播放<%=tempplayarr(0)%>" href="javascript:callExternal('StopPlay');">停止</a></td>    
  </tr>
  <%  
         end if     
      loop
      temp.close
      set temp=nothing
  end if    
  set fso=nothing
%>
  
</table>
</fieldset> <br />
<fieldset class="moreinfo">
<legend>座席IVR信息</legend>
<table cellPadding="4" cellSpacing="1" width="520" bgColor="#b7d9fe" border="0">
  <tr bgColor="#eeeeee">
    <td width="30%">IVR名称</td>
    <td width="35%">节点名称</td>
    <td width="35%">节点序号</td>
  </tr>
  <%
  on error resume next             
  set fso=server.CreateObject("Scripting.FileSystemObject")
  if sysrun=1 then
       filepath=server.mappath("../SeatIVR.txt")
  end if
  if sysrun=2 then
       filepath=NetBox.mappath("../SeatIVR.txt")
  end if  
  if fso.FileExists(filepath) then   ''文件存在
      set temp=fso.opentextfile(filepath,1)
      do while not temp.AtEndOfStream

         tempivr=trim(temp.ReadLine)
         if tempivr="" or left(tempivr,2)="//" then  ''是注释内容跳过
         else
            tempivrarr=split(tempivr,",")
%>
  <tr bgColor="#f8f8f8">
    <td><%=trim(tempivrarr(0))%></td>
    <td>
    <a title="转IVR" href="javascript:callExternal('SeatIVR|<%=trim(tempivrarr(0))%>|<%=trim(tempivrarr(2))%>|<%=trim(tempivrarr(3))%>');">
    <%=trim(tempivrarr(1))%></a></td>
    <td><%=trim(tempivrarr(2))%></td>
  </tr>
  <%  
         end if           
      loop
      temp.close
      set temp=nothing
  end if    
  set fso=nothing
%>
</table>
</fieldset> <br />
<%
   if msgtype=2 then
%> <fieldset>
<legend>IVR返回信息</legend>
<span id="ivrback"></span></fieldset> <br />
<%
   end if
%>
<form name="form1" method="post" target="_blank" action="<%=weburlreg%>">
  <input type="hidden" name="mobile" value=""><input type="hidden" name="weburlreg" value="<%=trim(request("weburlreg"))%>"><fieldset class="dialinfo">
  <legend>电话软拨号键盘风格</legend>
  <table border="0" cellpadding="0" cellspacing="0" width="300">
    <tr>
      <td width="100%" height="33" class="telno">
      <input style="background-color:transparent;border:0px;text-align:right;color:#FFFFFF;font:normal 16px,arial;font-weight:bold;width:280px;" name="telnoa" value="" size="20"></td>
    </tr>
    <tr>
      <td width="100%"><map name="DiaoMap">
      <area href="javascript:addtelnum('1')" onFocus="this.blur();" shape="rect" coords="1, 9, 98, 61">
      <area href="javascript:addtelnum('2')" onFocus="this.blur();" shape="rect" coords="103, 9, 198, 63">
      <area href="javascript:addtelnum('3')" onFocus="this.blur();" shape="rect" coords="201, 10, 297, 62">
      <area href="javascript:addtelnum('4')" onFocus="this.blur();" shape="rect" coords="0, 68, 97, 122">
      <area href="javascript:addtelnum('5')" onFocus="this.blur();" shape="rect" coords="103, 70, 196, 121">
      <area href="javascript:addtelnum('6')" onFocus="this.blur();" shape="rect" coords="201, 69, 297, 120">
      <area href="javascript:addtelnum('7')" onFocus="this.blur();" shape="rect" coords="2, 128, 99, 183">
      <area href="javascript:addtelnum('8')" onFocus="this.blur();" shape="rect" coords="102, 128, 196, 181">
      <area href="javascript:addtelnum('9')" onFocus="this.blur();" shape="rect" coords="203, 129, 297, 182">
      <area href="javascript:addtelnum('0')" onFocus="this.blur();" shape="rect" coords="104, 189, 196, 237">
      <area href="javascript:callExternal('9'+document.form1.telnoa.value);" onFocus="this.blur();" shape="rect" coords="101, 244, 196, 298">
      <area href="javascript:addtelnum('-1')" onFocus="this.blur();" shape="rect" coords="203, 245, 298, 300">
      </map>
      <img border="0" src="dialb.jpg" usemap="#DiaoMap" width="300" height="303"></td>
    </tr>
  </table>
  </fieldset> <br />
  
  <fieldset>
  <legend>电话软拨号简约风格</legend>
  拨打号：<input type="text" name="telnob" value="" size="20"> <br /> 
  <input type="button" value="呼叫" onclick="javascript:callExternal('9'+document.form1.telnob.value);" class="btnsmall">
 <span id="closetalk" style="display: none"><input type="button" value="挂断" onclick="javascript:callExternal('CloseTalk');" class="btnsmall2"></span></fieldset> <br />
  
  <fieldset>  
  <legend>呼叫转移</legend>
  转移号：<input type="text" name="telnoc" value="" size="20"> <br />
  <input type="button" value="呼叫转移" onclick="javascript:callExternal('SeatCallDivert|'+document.form1.telnoc.value);" class="btnsmall">
  </fieldset> <br />
  
  <fieldset>   
  <legend>三方通话</legend>
  拨打第三方号：<input type="text" name="telnod" value="" size="20"> <br />
  <input type="button" value="呼叫" onclick="javascript:callExternal('9meet'+document.form1.telnod.value);" class="btnsmall">
  <input type="button" value="断原线" onclick="javascript:callExternal('Close1');" class="btnsmall"><input type="button" value="断现线" onclick="javascript:callExternal('Close2');" class="btnsmall">
  </fieldset> <br />      
 
  <fieldset>   
  <legend>流水任务群呼</legend>
  群呼号码：<textarea rows="4" name="teltxt" cols="20"></textarea> <br />
  选择类型：<select size="1" name="calltype">
      <option value="1">语音文件
      </option>
      <option value="2">TTS
      </option>
      <option value="3">IVR
      </option>      
      </select> <br />  
  任务内容：<input type="text" name="tasktxt" value="IVR,0" size="20"> <br />  
  <input type="button" value="提交任务" onclick="javascript:gotask();" class="btnsmall">
  </fieldset> <br />   
   
  <fieldset class="login">
  <legend>座席登录</legend>
  <table width="340" border="0" cellpadding="3" cellspacing="1" bgcolor="#8CBDEF">
    <tr>
      <td height="25" colspan="2">
      <div align="center">
        <strong><font color="#FFFFFF">座席登录</font></strong></div>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="42%" height="25">呼叫中心服务器IP地址</td>
      <td width="58%" height="25">
      <input type="text" name="ctiip" value="<%=ctiip%>" size="20"> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25">呼叫中心服务器监听端口</td>
      <td height="25">
      <input type="text" name="ipport" value="<%=ipport%>" size="20"> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25">分机号</td>
      <td height="25">
      <input type="text" name="extno" value="<%=extno%>" size="20">　</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25">密码</td>
      <td height="25">
      <input type="password" name="seatpass" value="<%=trim(request("seatpass"))%>" size="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25">登录方式</td>
      <td height="25"><select size="1" name="logintype">
      <option value="1" <% if logintype="1" then %>selected<% end if %>>Flash控件
      </option>
      <option value="2" <% if logintype="2" then %>selected<% end if %>>WebSocket
      </option>
      </select> </td>
    </tr>      
    <tr bgcolor="#FFFFFF">
      <td height="25">来电选项</td>
      <td height="25"><select size="1" name="msgtype">
      <option value="1" <% if msgtype="1" then %>selected<% end if %>>弹出新窗口
      </option>
      <option value="2" <% if msgtype="2" then %>selected<% end if %>>在本页面刷新
      </option>
      </select> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="25">　</td>
      <td height="25">
      <input type="button" value="重新登录" onclick="javascript:gologin();" class="btnsmall">
      <input type="button" value="退出" onclick="javascript:callExternal('X');" class="btnsmall"></td>
    </tr>
  </table>
  </fieldset>
  </form>


<%
   if logintype=2 then
%>
<script type="text/javascript">
window.onload = function(){ConnectionCTI();}
  </script>
<% 
   end if
%>
   
   
   
   
   
   
   
     <div >
      <div >
   <div style="margin-left: 15px;">
	<form name="form1" action="home.action">
					<input type="hidden" name="mobile" value=""> <br />
					<fieldset class="nowinfo">
					<!-- 	<legend align="top">即时信息</legend> -->
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
<div style="margin-left: 15px;">
<fieldset class="moreinfo">
<legend>分机状态信息</legend>
<span id="inlineinfo"></span></fieldset> <br />
</div>
<div style="margin-left: 15px;">
<fieldset>
<legend>排队信息</legend>
排队数量：<span id="waitnum"></span> 自己分组数量：<span id="waitnumme"></span> </fieldset>
<br />
</div>
<div style="margin-left: 15px;">
<fieldset class="moreinfo">
<legend>外线状态信息</legend>
<span id="outlineinfo"></span></fieldset> <br />

 
<!-- <span id="outlineinfo"></span></fieldset> <br /> -->


 <span id="closetalk" style="display: none"><input type="button" value="挂断" onclick="javascript:callExternal('CloseTalk');" class="btnsmall2"></span></fieldset> <br />
 </div>
        </div>
      </div>     
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  </body>
<script type="text/javascript">
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
</html>
</body>
</html>