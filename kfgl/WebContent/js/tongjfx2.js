
window.onload = function(){
	
	
	/*近7日电话呼入量*/ 
	
	var iphoneNum = [];
	for(var i=0;i<djCountJson.length;i++){
		iphoneNum[i]=callCountJson[i];
	}
	
/*	var dataIphone = [
		[7,iphoneNum[6]],
		[6,iphoneNum[5]],
		[5,iphoneNum[4]],
		[4,iphoneNum[3]],
		[3,iphoneNum[2]],
		[2,iphoneNum[1]],
		[1,iphoneNum[0]],
		[0,null]
	];*/
	var dataIphone = [
	          		[7,iphoneNum[0]],
	          		[6,iphoneNum[1]],
	          		[5,iphoneNum[2]],
	          		[4,iphoneNum[3]],
	          		[3,iphoneNum[4]],
	          		[2,iphoneNum[5]],
	          		[1,iphoneNum[6]],
	          		[0,null]
	          	];
	
	var IphonedataSet = [
		{label:"电话呼入量" , data:dataIphone , color:"#c75d7b"}//#c5d52b
	];
	
/*	var ticksList = [
		[7,fDateTime(7)],[6,fDateTime(6)],[5,fDateTime(5)],[4,fDateTime(4)],[3,fDateTime(3)],[2,fDateTime(2)],[1,fDateTime(1)],[0,fDateTime(0)]
	];*/
	
	/*var ticksList = [
	         		[0,fDateTime(7)],[1,fDateTime(6)],[2,fDateTime(5)],[3,fDateTime(4)],[4,fDateTime(3)],[5,fDateTime(2)],[6,fDateTime(1)],[7,fDateTime(0)]
	         	];*/
//	var ticksList = [
//		[7,fDateTime(7)],[6,fDateTime(6)],[5,fDateTime(5)],[4,fDateTime(4)],[3,fDateTime(3)],[2,fDateTime(2)],[1,fDateTime(1)],[0,fDateTime(0)]
//	];
	
	var ticksList = [
		[0,fDateTime(7)],
		[1,fDateTime(6)],
		[2,fDateTime(5)],
		[3,fDateTime(4)],
		[4,fDateTime(3)],
		[5,fDateTime(2)],
		[6,fDateTime(1)],
		[7,fDateTime(0)]
	];
	
	var IphoneOptions = {
		series:{
			lines:{show:true},
			points:{
				radius:3,
				show:true
			}
		},
		xaxis:{
			ticks:ticksList,
			tickSize:1
		},
		grid:{
    		hoverable:true,   //鼠标悬停在point上触发事件
    		autoHighlight:true,  //高亮
    		
    	},
    	legend:{
    		backgroundColor:"#ffffff",
    		margin:[20,30]
    	}
	};
	
//	近7日每日工单提交量及完成量情况
	
	var wordOrderNUm = [];
	var wordCompletedNUm = [];
	
	for(var i=0;i<djCountJson.length;i++){
		wordOrderNUm[i]=djCountJson[i];
	}
	
	for(var i=0;i<djCountJson.length;i++){
		wordCompletedNUm[i]=wcCountJson[i];
	}
	
/*	var dataWordOrder = [
		[0,null],
		[1,wordOrderNUm[0]],
		[2,wordOrderNUm[1]],
		[3,wordOrderNUm[2]],
		[4,wordOrderNUm[3]],
		[5,wordOrderNUm[4]],
		[6,wordOrderNUm[5]], 
		[7,wordOrderNUm[6]],
		[8,null]
	];*/
	
	var dataWordOrder = [
	             		[0,null],
	             		[1,wordOrderNUm[6]],
	             		[2,wordOrderNUm[5]],
	             		[3,wordOrderNUm[5]],
	             		[4,wordOrderNUm[3]],
	             		[5,wordOrderNUm[2]],
	             		[6,wordOrderNUm[1]], 
	             		[7,wordOrderNUm[0]],
	             		[8,null]
	             	];
/*	var dataWordOrder = [
	             		[0,null],
	             		[1,wordOrderNUm[0]],
	             		[2,wordOrderNUm[1]],
	             		[3,wordOrderNUm[2]],
	             		[4,wordOrderNUm[3]],
	             		[5,wordOrderNUm[4]],
	             		[6,wordOrderNUm[5]], 
	             		[7,wordOrderNUm[6]],
	             		[8,null]
	             	];*/
	
	
	var dataWordCompleted = [
		[0,null],
		[1,wordCompletedNUm[6]],
		[2,wordCompletedNUm[5]],
		[3,wordCompletedNUm[4]],
		[4,wordCompletedNUm[3]],
		[5,wordCompletedNUm[2]],
		[6,wordCompletedNUm[1]],
		[7,wordCompletedNUm[0]],
		[8,null]
	];
	
	var wordOrderDataSet = [
		{ label:"工单提交量" , data:dataWordOrder , color:"#c5d52b" , bars:{ align:"left" , barWidth:0.4}},
		{ label:"工单完成量" , data:dataWordCompleted , color:"#c75d7b" ,  bars:{ align:"right" , barWidth:0.4}}
	];
	
	var wordOrderOptions = {
			series:{
				bars:{show:true}
			},
			xaxis:{
				ticks:ticksList,
				tickSize:1
			},
			legend:{
				position:"nw",
				backgroundColor:"#ffffff",
				margin:[20,20]
			},
			grid:{
	    		hoverable:true,   //鼠标悬停在point上触发事件
	    		autoHighlight:true,  //高亮
	    		
	    	}
		};
		
	
	
	
		
		
//		全部工单状态占比饼状图
	var allWordStatusData = [];
	function getgdtj(json){
		
			
		
			allWordStatusData.push(json.未审核);
			allWordStatusData.push(json.审核通过);
			allWordStatusData.push(json.回退修改);
			allWordStatusData.push(json.作废);
			allWordStatusData.push(json.已接单);
			allWordStatusData.push(json.已完成);
			allWordStatusData.push(json.已回访);
		
	}
	
		
		getgdtj(TjMap);

		var allWordStatusDataSet = [
			{label: "未审核", data: allWordStatusData[0], color: "#005CDE" },
            { label: "审核通过",data: allWordStatusData[1], color: "#00A36A" },
            { label: "回退修改", data:allWordStatusData[2], color: "#7D0096" },
            { label: "作废", data: allWordStatusData[3], color: "#992B00" },
            { label: "已接单", data: allWordStatusData[4], color: "#DE000F" },
            { label: "已完成", data: allWordStatusData[5], color: "#ED7B00" },
            { label: "已回访", data: allWordStatusData[6], color: "#E75D7B" } 
        ];
		
		var allWordStatusOptions = {
				series:{
	        		pie:{
	        			show:true,
	        			label:{
	        				show:true,
	        				radius:0.9,
	        				formatter: function (label, series) {                
		                        return '' + label + ' : ' + Math.round(series.percent) +'%';
		                    },
	        				background:{
	        					opacity:0.2,
	        				}
	        			}
	        		}
	        	},
	    		grid:{
	        		hoverable:true,   //鼠标悬停在point上触发事件
	        		autoHighlight:true,  //高亮
	        		clickable: true,
	        		
	        	}
	        	
		};
		
		
		
		
		
	
		
		
		
//		逾期工单占比饼状图
		var gdArr = [];
		function getgdarr(json){
			
				
			
			gdArr.push(json.逾期工单);
			gdArr.push(json.其它工单);
			
			
		}
		
			
		getgdarr(TjMap1);
			
			
		var lateWorkDataSet = [
        	{label: "逾期工单", data: gdArr[0], color: "#7D0096" },
            { label: "其它工单", data: gdArr[1], color: "#ED7B00" }
        ];
		
		var lateWorkOptions = {
				series:{
	        		pie:{
	        			show:true,
	        			label:{
	        				show:true,
	        				radius:0.9,
	        				formatter: function (label, series) {                
		                        return '' + label + ' : ' + Math.round(series.percent) +'%';
		                    },
	        				background:{
	        					opacity:0.2,
	        				}
	        			}
	        		}
	        	},
	    		grid:{
	        		hoverable:true,   //鼠标悬停在point上触发事件
	        		autoHighlight:true,  //高亮
	        		
	        	}
		};
		
		
		$(document).ready(function(){
			//图形
			$.plot($("#iphone-call"),IphonedataSet,IphoneOptions);
			$.plot($("#wordorder-completed"),wordOrderDataSet,wordOrderOptions);
			$.plot($("#all-word-status"),allWordStatusDataSet,allWordStatusOptions);
			
			$.plot($("#late-work"),lateWorkDataSet,lateWorkOptions);
			
			//电话tbody
			var callList = [];
			function CallChange(json){
				for (var i = 0 ; i < json.length ; i ++) {
					var arr1 = [];
					
					arr1[0] = i
					arr1[1] = json[i].inTime;
                    if(json[i].callFlag==1){
                    	arr1[2] = json[i].callerNo;
                    	arr1[3] = "呼入";
					}else{
						arr1[2] = json[i].calledNo;
						arr1[3] = "呼出";
					}
					
					
					callList.push(arr1);
				};
			}
			CallChange(findCallJson);
			var callTbody = document.getElementById("tongcall_body");
			for(var i = 0;i < callList.length;i ++){
				var callTr = document.createElement("tr");
				if(i%2 == 1){
					callTr.className = "gradeX odd";
				}else if(i%2 == 0){
					callTr.className = "gradeX even";
				}
				for(var j = 0;j < callList[i].length;j ++){
					callList[i][j] = callList[i][j]+"";
					if(callList[i][j].length > 28){
						var new_callList = callList[i][j].slice(0,14);
						callTr.innerHTML += "<td>" + new_callList + "···</td>";
					}else{
						callTr.innerHTML += "<td>" + callList[i][j] + "</td>";
					}
				}
				callTbody.appendChild(callTr);
			}
			
			//工单tbody
			
			var wordList = [];
			function jsArrChange(json){
				for (var i = 0 ; i < json.length ; i ++) {
					var arr1 = [];
					arr1[0] = json[i].gdNum;
					arr1[1] = json[i].telephone;
					arr1[2] = json[i].yhName;
					arr1[3] = json[i].xqName;
					arr1[4] = json[i].buildNo;
					arr1[5] = json[i].cellNo;
					arr1[6] = json[i].houseNo;
					arr1[7] = json[i].visCon;
					arr1[8] = json[i].tjName;
					arr1[9] = json[i].tjTime;
					arr1[10] = json[i].state;
					wordList.push(arr1);
				};
			}
			jsArrChange(xinwordListj);

			


			var wordTbody = document.getElementById("tongword_body");
			for(var i = 0;i < wordList.length;i ++){
				var wordTr = document.createElement("tr");
				if(i%2 == 1){
					wordTr.className = "gradeX odd";
				}else if(i%2 == 0){
					wordTr.className = "gradeX even";
				}
				for(var j = 0;j < wordList[i].length;j ++){
					wordList[i][j] = wordList[i][j]+"";
					if(wordList[i][j].length > 16){
						var new_wordList = wordList[i][j].slice(0,15);
						wordTr.innerHTML += "<td>" + new_wordList + "···</td>";
					}else{
						wordTr.innerHTML += "<td>" + wordList[i][j] + "</td>";
					}
				}
				wordTbody.appendChild(wordTr);
			}
			
			
			
			var exportcalldata = [];
			
			
			
			//table固定表头
			var tongcalltableCont = $('#tongcall_table_body table tr th'); //获取th
			var tongcalltableScroll = $('#tongcall_table_body'); //获取滚动条同级
			tongcalltableScroll.on('scroll', scrollHandletongcall);

			var tongwordtableCont = $('#tongword_table_body table tr th'); //获取th
			var tongwordtableScroll = $('#tongword_table_body'); //获取滚动条同级
			tongwordtableScroll.on('scroll', scrollHandletongword);
			
			

			function scrollHandletongword() {
				var scrollTop = tongwordtableScroll.scrollTop();
				// 当滚动距离大于0时设置top及相应的样式
				if (scrollTop > 0) {
					tongwordtableCont.css({
						"top" : scrollTop + 'px',
						"marginTop" : "-1px",
						"backgroundColor" : "#EBEBEB"
					})
				} else { // 当滚动距离小于0时设置top及相应的样式 
					tongwordtableCont.css({
						"top" : scrollTop + 'px',
						"marginTop" : "0",
						"backgroundColor" : "#EBEBEB"
					})
				}
			}


			function scrollHandletongcall() {
				var scrollTop = tongcalltableScroll.scrollTop();
				// 当滚动距离大于0时设置top及相应的样式
				if (scrollTop > 0) {
					tongcalltableCont.css({
						"top" : scrollTop + 'px',
						"marginTop" : "-1px",
						"backgroundColor" : "#EBEBEB"
					})
				} else { // 当滚动距离小于0时设置top及相应的样式 
					tongcalltableCont.css({
						"top" : scrollTop + 'px',
						"marginTop" : "0",
						"backgroundColor" : "#EBEBEB"
					})
				}
			}
			
			//电话呼入呼出-时间
			//工单状态-时间
			
			var nowtime = new Date();
			var callYear = nowtime.getFullYear();
			var callMonth = nowtime.getMonth() + 1;
			var callDay = nowtime.getDate();
			if(callMonth < 10){
				callMonth = "0" + callMonth;
			}
			if(callDay < 10){
				callDay = "0" + callDay;
			}
			var nowDistime = callYear + "-" + callMonth + "-" + callDay;
			//电话结束时间
			$("input[name='end_time']").val(nowDistime);
			$("input[name='end_time']").attr("max",nowDistime);
			//工单结束时间
			$("input[name='end_word_time']").val(nowDistime);
			$("input[name='end_word_time']").attr("max",nowDistime);
			
			
			var starttime = new Date(nowtime.getTime() - 24*60*60*1000*6);
			var startYear = starttime.getFullYear();
			var startMonth = starttime.getMonth() + 1;
			var startDay = starttime.getDate();
			if(startMonth < 10){
				startMonth = "0" +startMonth;
			}
			if(startDay < 10){
				startDay = "0" + startDay;
			}
			var startDistime = startYear + "-" + startMonth + "-" + startDay;
			//电话开始时间
			$("input[name='start_time']").val(startDistime);
			$("input[name='start_time']").attr("max",nowDistime);
			//工单开始时间
			$("input[name='start_word_time']").val(startDistime);
			$("input[name='start_word_time']").attr("max",nowDistime);
			
			
			
			//电话搜索
			$("#call_search_btn").click(function(){
				var startTime = new Date($("#start_timeTel").val()).getTime();
				var endTime = new Date($("#end_timeTel").val()).getTime();
				var callType = $("#telSel").val();
				var compareCallList = [];
				var callListTime = "";
				for(var j = 0;j < callList.length;j ++){
					callListTime = new Date(callList[j][1]).getTime();
					compareCallTime(startTime,endTime,callType,callListTime,compareCallList,callList,j);
				};
				$("#tongcall_body").empty();
				for(var x = 0;x < compareCallList.length;x ++){
					var newElemnet = "";
					if(x%2 == 1){
						newElemnet = "<tr class='gradeX odd'><td>" + compareCallList[x][0] + "</td><td>" + compareCallList[x][1] + "</td><td>" + compareCallList[x][2] + "</td><td>" + compareCallList[x][3] + "</td></tr>";
					}else if(x%2 == 0){
						newElemnet = "<tr class='gradeX even'><td>" + compareCallList[x][0] + "</td><td>" + compareCallList[x][1] + "</td><td>" + compareCallList[x][2] + "</td><td>" + compareCallList[x][3] + "</td></tr>";
					}
					
					$("#tongcall_body").append(newElemnet);
				}
				exportcalldata = compareCallList;
			});
			
			function clicklabel(wordType){
			var startWordTime = new Date($(".word-search input[name='start_word_time']").val()).getTime();
			var endWordTime = new Date($(".word-search input[name='end_word_time']").val()).getTime();
			
			var compareWordList = [];
			var WordListTime = "";
			for(var j = 0;j < wordList.length;j ++){
				WordListTime = new Date(wordList[j][9]).getTime();
				compareWordTime(startWordTime,endWordTime,wordType,WordListTime,compareWordList,wordList,j);
			};
			$("#tongword_body").empty();
			for(var x = 0;x < compareWordList.length;x ++){
				
				var newWordElemnet = "";
				if(x%2 == 1){
					
					newWordElemnet = "<tr class='gradeX odd'>";
					for(var y = 0;y < compareWordList[x].length;y ++){
						//省略字数
						compareWordList[x][y] = compareWordList[x][y]+"";
						if(compareWordList[x][y].length > 16){
							var new_compareWordList = compareWordList[x][y].slice(0,15);
							newWordElemnet += "<td>" + new_compareWordList + "···</td>";
						}else{
							newWordElemnet += "<td>" + compareWordList[x][y] + "</td>";
						}
						
					}
					newWordElemnet += "</tr>";
					
				}else if(x%2 == 0){
					
					newWordElemnet = "<tr class='gradeX even'>";
					for(var y = 0;y < compareWordList[x].length;y ++){
						//省略字数
						compareWordList[x][y] = compareWordList[x][y]+"";
						if(compareWordList[x][y].length > 16){
							var new_compareWordList = compareWordList[x][y].slice(0,15);
							newWordElemnet += "<td>" + new_compareWordList + "···</td>";
						}else{
							newWordElemnet += "<td>" + compareWordList[x][y] + "</td>";
						}
						
					}
					newWordElemnet += "</tr>";
					
				}
				
				$("#tongword_body").append(newWordElemnet);
			}
		}
			
			//工单搜索
			$("#word_search_btn").click(function(){
			
				var startWordTime = new Date($("#start_word_time").val()).getTime();
				var endWordTime = new Date($("#end_word_time").val()).getTime();
				var wordType = $("#gdSel").val();
				var compareWordList = [];
				var WordListTime = "";
				for(var j = 0;j < wordList.length;j ++){
					
					WordListTime = new Date(wordList[j][9]).getTime();
					compareWordTime(startWordTime,endWordTime,wordType,WordListTime,compareWordList,wordList,j);
				};
				$("#tongword_body").empty();
				for(var x = 0;x < compareWordList.length;x ++){
					
					var newWordElemnet = "";
					if(x%2 == 1){
						
						newWordElemnet = "<tr class='gradeX odd'>";
						for(var y = 0;y < compareWordList[x].length;y ++){
							//省略字数
							compareWordList[x][y] = compareWordList[x][y]+"";
							if(compareWordList[x][y].length > 16){
								var new_compareWordList = compareWordList[x][y].slice(0,15);
								newWordElemnet += "<td>" + new_compareWordList + "···</td>";
							}else{
								newWordElemnet += "<td>" + compareWordList[x][y] + "</td>";
							}
							
						}
						newWordElemnet += "</tr>";
						
					}else if(x%2 == 0){
						
						newWordElemnet = "<tr class='gradeX even'>";
						for(var y = 0;y < compareWordList[x].length;y ++){
							//省略字数
							compareWordList[x][y] = compareWordList[x][y]+"";
							if(compareWordList[x][y].length > 16){
								var new_compareWordList = compareWordList[x][y].slice(0,15);
								newWordElemnet += "<td>" + new_compareWordList + "···</td>";
							}else{
								newWordElemnet += "<td>" + compareWordList[x][y] + "</td>";
							}
							
						}
						newWordElemnet += "</tr>";
						
					}
					
					$("#tongword_body").append(newWordElemnet);
				}
			});
			
			
			//工单排序
			var tableObject = $('#tongword_table_body table'); //获取id为xincreate_table_body的table对象
			var tbHead = tableObject.children('thead'); //获取table对象下的thead
			var tbHeadTh = tbHead.find('tr th'); //获取thead下的tr下的th
			var tbBody = tableObject.children('tbody'); //获取table对象下的tbody
			var tbBodyTr = tbBody.find('tr'); //获取tbody下的tr
			var sortIndex = 1;
			
			tbHeadTh.each(function() { //遍历thead的tr下的th
				var thisIndex = tbHeadTh.index($(this)); //获取th所在的列号

				var type ="";
				$(this).click(function() { //给当前表头th增加点击事件
					tbHeadTh.find("span").show();
					if(sortIndex%2 == 1){//奇数偶数显示
						$(this).find(".span-up").show();
						$(this).find(".span-down").hide();
					}else{
						$(this).find(".span-up").hide();
						$(this).find(".span-down").show();
					}
					var table = $('#tongword_table_body table'); 
					var body = table.children('tbody'); 
					var bodytr = body.find('tr');
					checkColumnValue(thisIndex,table,bodytr);
				});
			});
			
			
			//对表格排序
			function checkColumnValue(index,table,bodytr) {
				var trsValue = new Array();

				bodytr.each(function() {
					var tds = $(this).find('td');
					//获取行号为index列的某一行的单元格内容与该单元格所在行的行内容添加到数组trsValue中
					var data = $(tds[index]).html();//parseFloat($(tds[index]).html()) || 
					if(isNaN(data)&&!isNaN(Date.parse(data))){
					　　type = "string";
					}else if (parseFloat(data)) {
						type = "number";
					}else{
						type = "string";
					}
					
					trsValue.push(type + ".separator" + $(tds[index]).html() + ".separator" + $(this).html());
					$(this).html("");
				});

				var len = trsValue.length;

				if(sortIndex%2 == 0) {
					//如果已经排序了则直接倒序
					trsValue.reverse();
				} else {
					for(var i = 0; i < len; i++) {
						//split() 方法用于把一个字符串分割成字符串数组
						//获取每行分割后数组的第一个值,即此列的数组类型,定义了字符串\数字\Ip
						type = trsValue[i].split(".separator")[0];
						for(var j = i + 1; j < len; j++) {
							//获取每行分割后数组的第二个值,即文本值
							value1 = trsValue[i].split(".separator")[1];
							//获取下一行分割后数组的第二个值,即文本值
							value2 = trsValue[j].split(".separator")[1];
							//接下来是数字\字符串等的比较
							if(type == "number") {
								value1 = value1 == "" ? 0 : value1;
								value2 = value2 == "" ? 0 : value2;
								if(parseFloat(value1) > parseFloat(value2)) {
									var temp = trsValue[j];
									trsValue[j] = trsValue[i];
									trsValue[i] = temp;
								}
							} else {
								if(value1.localeCompare(value2) > 0) { //该方法不兼容谷歌浏览器
									var temp = trsValue[j];
									trsValue[j] = trsValue[i];
									trsValue[i] = temp;
								}
							}
						}
					}
				}

				for(var i = 0; i < len; i++) {
					table.find("tbody tr:eq(" + i + ")").html(trsValue[i].split(".separator")[2]);
				}

				sortIndex += 1;
			}
			
			
			//电话排序
			var ctableObject = $('#tongcall_table_body table'); //获取id为xincreate_table_body的table对象
			var ctbHead = ctableObject.children('thead'); //获取table对象下的thead
			var ctbHeadTh = ctbHead.find('tr th'); //获取thead下的tr下的th
			var ctbBody = ctableObject.children('tbody'); //获取table对象下的tbody
			var ctbBodyTr = ctbBody.find('tr'); //获取tbody下的tr
			
			var csortIndex = 1;
			
			ctbHeadTh.each(function() { //遍历thead的tr下的th
				var cthisIndex = ctbHeadTh.index($(this)); //获取th所在的列号

				var ctype ="";
				$(this).click(function() { //给当前表头th增加点击事件
					ctbHeadTh.find("span").show();
					if(csortIndex%2 == 1){//奇数偶数显示
						$(this).find(".span-up").show();
						$(this).find(".span-down").hide();
					}else{
						$(this).find(".span-up").hide();
						$(this).find(".span-down").show();
					}
					var ctable = $('#tongcall_table_body table'); 
					var cbody = ctable.children('tbody'); 
					var cbodytr = cbody.find('tr');
					checkColumnValue(cthisIndex,ctable,cbodytr);
				});
			});
			
			//对表格排序
			function callcheckColumnValue(cindex,ctable,cbodytr) {
				var ctrsValue = new Array();

				cbodytr.each(function() {
					var ctds = $(this).find('td');
					//获取行号为index列的某一行的单元格内容与该单元格所在行的行内容添加到数组trsValue中
					var cdata = $(ctds[cindex]).html();
					if(isNaN(cdata)&&!isNaN(Date.parse(cdata))){
					　　ctype = "string";
					}else if (parseFloat(cdata)) {
						ctype = "number";
					}else{
						ctype = "string";
					}
					
					ctrsValue.push(ctype + ".separator" + $(ctds[cindex]).html() + ".separator" + $(this).html());
					$(this).html("");
				});

				var len = ctrsValue.length;

				if(csortIndex%2 == 0) {
					//如果已经排序了则直接倒序
					ctrsValue.reverse();
				} else {
					for(var i = 0; i < len; i++) {
						//split() 方法用于把一个字符串分割成字符串数组
						//获取每行分割后数组的第一个值,即此列的数组类型,定义了字符串\数字\Ip
						ctype = ctrsValue[i].split(".separator")[0];
						for(var j = i + 1; j < len; j++) {
							//获取每行分割后数组的第二个值,即文本值
							value1 = ctrsValue[i].split(".separator")[1];
							//获取下一行分割后数组的第二个值,即文本值
							value2 = ctrsValue[j].split(".separator")[1];
							//接下来是数字\字符串等的比较
							if(ctype == "number") {
								value1 = value1 == "" ? 0 : value1;
								value2 = value2 == "" ? 0 : value2;
								if(parseFloat(value1) > parseFloat(value2)) {
									var ctemp = ctrsValue[j];
									ctrsValue[j] = ctrsValue[i];
									ctrsValue[i] = ctemp;
								}
							} else {
								if(value1.localeCompare(value2) > 0) { //该方法不兼容谷歌浏览器
									var ctemp = ctrsValue[j];
									ctrsValue[j] = ctrsValue[i];
									ctrsValue[i] = ctemp;
								}
							}
						}
					}
				}

				for(var i = 0; i < len; i++) {
					ctable.find("tbody tr:eq(" + i + ")").html(ctrsValue[i].split(".separator")[2]);
				}

				csortIndex += 1;
			}
			
		});
		

		//导出
		
		var callExport = document.getElementById("call_export_btn");
		var wordExport = document.getElementById("word_export_btn");
		callExport.onclick = function(){
			var aID =  this.parentNode.getAttribute("id");
			tableToExcel('tongcall_table', '下载', aID);
		}
		wordExport.onclick = function(){
			var aID =  this.parentNode.getAttribute("id");
			tableToExcel('tongword_table', '下载', aID);
		}
		
		
	    
	    //base64转码
	    var base64 = function (s) {
	        return window.btoa(unescape(encodeURIComponent(s)));
	    };
	    //替换table数据和worksheet名字
	    var format = function (s, c) {
	        return s.replace(/{(\w+)}/g,
	            function (m, p) {
	                return c[p];
	            });
	    }
	    function tableToExcel(tableid, sheetName, aID) {
	        var uri = 'data:application/vnd.ms-excel;base64,';
	        var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel"' +
	            'xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
	            + '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>'
	            + '</x:ExcelWorkbook></xml><![endif]-->' +
	            ' <style type="text/css">' +
	            'table td {' +
	            'border: 1px solid #000000;' +
	            'width: 200px;' +
	            'height: 30px;' +
	            ' text-align: center;' +
	            'background-color: #ffffff;' +
	            'color: #333333;' +
	            ' }' +
	            '</style>' +
	            '</head><body ><table class="excelTable">{table}</table></body></html>';
	        if (!tableid.nodeType) tableid = document.getElementById(tableid);
	        var ctx = {worksheet: sheetName || 'Worksheet', table: tableid.innerHTML};
	        document.getElementById(aID).href = uri + base64(format(template, ctx));
	    }
		
		
		
	 
}


function fDateTime(num){
	var curDate = new Date();
	var nowTimeDay = new Date(curDate - 24*60*60*1000*num).getDate();
	var nowTimeMonth = new Date(curDate - 24*60*60*1000*num).getMonth()+1;
	var nowTime = nowTimeMonth + "-" + nowTimeDay;
	return nowTime;
}

function compareCallTime(startTime,endTime,callType,callListTime,compareList,callList,j){
	if((startTime <= callListTime) && (callListTime <= endTime)){
		if(callType == "all"){
			compareList.push(callList[j]);
		}
		if(callType == "in"){
			if(callList[j][3] == "呼入"){
				compareList.push(callList[j]);
			}
		}
		if(callType == "out"){
			if(callList[j][3] == "呼出"){
				compareList.push(callList[j]);
			}
		}
	}
}


function compareWordTime(startWordTime,endWordTime,wordType,WordListTime,compareWordList,wordList,j){
	if((startWordTime <= WordListTime) && (WordListTime <= endWordTime)){
		if(wordType == "全部"){
			compareWordList.push(wordList[j]);
		}
		if(wordType == "逾期工单"){
			if(wordList[j][10] == "逾期工单"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "未审核"){
			if(wordList[j][10] == "未审核"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "审核通过"){
			if(wordList[j][10] == "审核通过"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "回退修改"){
			if(wordList[j][10] == "回退修改"){
				compareWordList.push(wordList[j]);
			}
		}
		
		if(wordType == "作废"){
			if(wordList[j][10] == "作废"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "已接单"){
			if(wordList[j][10] == "已接单"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "已完成"){
			if(wordList[j][10] == "已完成"){
				compareWordList.push(wordList[j]);
			}
		}
		if(wordType == "已回访"){
			if(wordList[j][10] == "已回访"){
				compareWordList.push(wordList[j]);
			}
		}
	}
}


