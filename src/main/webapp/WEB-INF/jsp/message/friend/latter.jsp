<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="GB18030">
<head>
<meta charset="GB18030">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<style>
/**重置标签默认样式*/
* {
	margin: 0;
	padding: 0;
	list-style: none;
	font-family: '微软雅黑'
}

#container {
	width: 100%; height 100%;
	background: #eee;
	margin: 80px auto 0;
	position: relative;
	box-shadow: 20px 20px 55px #777;
	height: 780px;
}

.header {
	background: #000;
	height: 60px;
	color: #fff;
	line-height: 34px;
	font-size: 40px;
	padding: 10px;
}

.footer {
	width: 100%;
	height: 65px;
	background: #666;
	position: absolute;
	bottom: 0;
	padding: 10px;
}

.footer input {
	width: 85%;
	height: 45px;
	outline: none;
	font-size: 20px;
	text-indent: 10px;
	position: absolute;
	border-radius: 6px;
	left: 90px;
}

.footer span {
	display: inline-block;
	width: 8%;
	height: 45px;
	background: #ccc;
	font-weight: 900;
	line-height: 45px;
	cursor: pointer;
	text-align: center;
	position: absolute;
	right: 10px;
	border-radius: 6px;
}

.footer span:hover {
	color: #fff;
	background: #999;
}

#user_face_icon {
	display: inline-block;
	width: 60px;
	height: 60px;
	position: absolute;
	top: 8px;
	left: 18px;
	cursor: pointer;
	overflow: hidden;
}

.content {
	font-size: 20px;
	width: 100%;
	height: calc(88vh);
	overflow: auto;
	padding: 5px;
}

.content li {
	margin-top: 10px;
	padding-left: 10px;
	width: 100%;
	display: block;
	clear: both;
	overflow: hidden;
}

.content li img {
	float: left;
}

.content li span {
	background: #7cfc00;
	padding: 10px;
	border-radius: 10px;
	float: left;
	margin: 6px 10px 0 10px;
	max-width: %100;
	border: 1px solid #ccc;
	box-shadow: 0 0 3px #ccc;
}               

.content li img.imgleft {
	float: left;
}

.content li img.imgright {
	float: right;
}

.content li span.spanleft {
	float: left;
	background: #fff;
}

.content li span.spanright {
	float: right;
	background: #7cfc00;
}
</style>
</head>

<body style="overflow:scroll;overflow-y:hidden;overflow-x:hidden;">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="padding: 10px; background-color: gray;">
		<button type="button" class="btn btn-warning" id="backButton" style=" width: 8%;">
			<i class="glyphicon glyphicon-arrow-left" style="font-size: 16px;">返回</i>
		</button>
		<label style="padding-left: 40%;"><i style="font-size: 25px; color:black; font-style: normal;"><%=session.getAttribute("receiveId")%></i></label>
	</nav>
	<ul class="content">
	</ul>
	<div class="footer">
		<div id="user_face_icon">
			<img src="${APP_PATH}/img/code.jpg" style="width: 50px; height: 50px; border-radius: 0.7em; " onclick="sendCodeImg();">
		</div>
		<input id="text" type="text" placeholder="说点什么吧..."> <span id="btn">发送</span>
	</div>
</body>

<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
<script type="text/javascript">
	var websocket = null;
	var iNow = -1; //用来累加改变左右浮动   
	var icon = document.getElementById('user_face_icon').getElementsByTagName('img');
	var btn = document.getElementById('btn');
	var text = document.getElementById('text');
	var content = document.getElementsByTagName('ul')[0];
	var img = content.getElementsByTagName('img');
	var span = content.getElementsByTagName('span');
	$(function() {
		var host = document.location.host;
		var username = "${loginUser.userId}"; // 获得当前登录人员的userName 
		//判断当前浏览器是否支持WebSocket 
		if ('WebSocket' in window) {
			websocket = new WebSocket('ws://' + host + '/home/webSocket/' + username);
		} else {
			alert('当前浏览器 Not support websocket')
		}


		//连接发生错误的回调方法 
		websocket.onerror = function() {
			alert("WebSocket连接发生错误")
			setMessageInnerHTML("WebSocket连接发生错误");
		};

		//连接成功建立的回调方法 
		websocket.onopen = function() {
			//alert("WebSocket连接成功")
		}

		//接收到消息的回调方法 
		websocket.onmessage = function(event) {
			var headImgPath = "${APP_PATH}/images/headImg/" + "${receiveId}" + ".png";
			content.innerHTML += '<li><img src="' + headImgPath + '" style="height: 60px; width: 60px;"><span>' + event.data + '</span></li>';
			iNow++;
			img[iNow].className += 'imgleft';
			span[iNow].className += 'spanleft';
			// 内容过多时,将滚动条放置到最底端   
			content.scrollTop = content.scrollHeight;
		}

		//连接关闭的回调方法 
		websocket.onclose = function() {
			//setMessageInnerHTML("WebSocket连接关闭");
		}

		//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。 
		window.onbeforeunload = function() {
			websocket.onclose = function() {};
			websocket.close();
		}

		//关闭WebSocket连接 
		function closeWebSocket() {
			websocket.close();
		}

	});

	$("#backButton").click(function() {
		websocket.close();
		window.location.href = "${APP_PATH}/message/friend";
	});


	window.onload = function() {
		btn.onclick = function() {
			if (text.value == '') {
				layer.msg("不能发送空消息", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
			} else {
				var headImgPath = "${APP_PATH}/images/headImg/" + "${loginUser.userId}" + ".png";
				content.innerHTML += '<li><img src="' + headImgPath + '" style="height: 60px; width: 60px;"><span>' + text.value + '</span></li>';
				iNow++;
				var jsonData = {
					dataType : "text",
					receiveId : "${receiveId}",
					content : text.value
				};
				websocket.send(JSON.stringify(jsonData));
				img[iNow].className += 'imgright';
				span[iNow].className += 'spanright';
				text.value = '';
				// 内容过多时,将滚动条放置到最底端   
				content.scrollTop = content.scrollHeight;
			}
		}
	}
	function sendCodeImg() {
		var headImgPath = "${APP_PATH}/images/headImg/" + "${loginUser.userId}" + ".png";
		var code = '<div style="padding-right:2%"><img src="${APP_PATH}/img/code.jpg" style="width: 240px; height: 240px;"></div>';
		content.innerHTML += '<li>' + code + '<span style="display: none;">' + "" + '</span></li>';
		iNow++;
		var jsonData = {
			dataType : "text",
			receiveId : "${receiveId}",
			content : text.value
		};
		websocket.send(JSON.stringify(jsonData));
		img[iNow].className += 'imgright';
		span[iNow].className += 'spanright';
		text.value = '';
		// 内容过多时,将滚动条放置到最底端   
		content.scrollTop = content.scrollHeight;
	}

	function receiveCodeImg() {
		var headImgPath = "${APP_PATH}/images/headImg/" + "${loginUser.userId}" + ".png";
		var code = '<div style="padding-right:2%"><img src="${APP_PATH}/img/code.jpg" style="width: 240px; height: 240px;"></div>';
		content.innerHTML += '<li>' + code + '<span style="display: none;">' + "" + '</span></li>';
		iNow++;
		img[iNow].className += 'imgleft';
		span[iNow].className += 'spanleft';
		// 内容过多时,将滚动条放置到最底端   
		content.scrollTop = content.scrollHeight;
	}
</script>
</html>