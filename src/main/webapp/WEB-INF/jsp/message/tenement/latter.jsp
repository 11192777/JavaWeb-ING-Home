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
.tree li {
	list-style-type: none;
	cursor: pointer;
}

.tree-closed {
	height: 40px;
}

.tree-expanded {
	height: auto;
}

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
	width: 87%;
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
	width: 120px;
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
	background: red;
	width: 60px;
	height: 60px;
	border-radius: 30px;
	position: absolute;
	bottom: 6px;
	left: 14px;
	cursor: pointer;
	overflow: hidden;
}

.content {
	font-size: 20px;
	width: 100%;
	height: 100%;
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

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="padding: 10px">
		
		<button type="button" class="btn btn-warning">
			<i class="glyphicon glyphicon-arrow-left"></i> 返回
		</button>
		</nav>
		<ul class="content">
		<!-- 欢迎加入qq群：454796847、135430763 -->
	</ul>
	<div class="footer">
		<div id="user_face_icon">
			<img src="http://www.xttblog.com/icons/favicon.ico" alt="" style="width: 60px; height: 60px">
		</div>
		<input id="text" type="text" placeholder="说点什么吧..."> <span id="btn">发送</span>
	</div>

</body>

<script>
	window.onload = function() {
		var arrIcon = [ 'http://www.xttblog.com/icons/favicon.ico', 'http://www.xttblog.com/wp-content/uploads/2016/03/123.png' ];
		var num = 0; //控制头像改变   
		var iNow = -1; //用来累加改变左右浮动   
		var icon = document.getElementById('user_face_icon').getElementsByTagName('img');
		var btn = document.getElementById('btn');
		var text = document.getElementById('text');
		var content = document.getElementsByTagName('ul')[0];
		var img = content.getElementsByTagName('img');
		var span = content.getElementsByTagName('span');

		icon[0].onclick = function() {
			if (num == 0) {
				this.src = arrIcon[1];
				num = 1;
			} else if (num == 1) {
				this.src = arrIcon[0];
				num = 0;
			}
		}
		btn.onclick = function() {
			if (text.value == '') {
				alert('不能发送空消息');
			} else {
				content.innerHTML += '<li><img src="' + arrIcon[num] + '"><span>' + text.value + '</span></li>';
				iNow++;
				if (num == 0) {
					img[iNow].className += 'imgright';
					span[iNow].className += 'spanright';
				} else {
					img[iNow].className += 'imgleft';
					span[iNow].className += 'spanleft';
				}
				text.value = '';
				// 内容过多时,将滚动条放置到最底端   
				contentcontent.scrollTop = content.scrollHeight;
			}
		}
	}
</script>
</html>