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
<link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
</head>
<h1 style="font-weight: bold">Home 密码找回</h1>
<body>
	<div class="panel-heading">
		<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal">
			<i class="glyphicon glyphicon-question-sign"></i>
		</div>
	</div>
	<div class="panel-body">
		<div class="form-group">
			<input type="text" class="form-control" id="userid" placeholder="请输入用户名">
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="phoneNumber" placeholder="请输入手机号">
		</div>
		<div class="row">
			<div class="col-xs-10">
				<input type="text" class="form-control" placeholder="验证码">
			</div>
			<button type="button" class="btn btn-success">发送验证码</button>
		</div>
		<br> <a class="btn btn-lg btn-danger btn-block" onclick="dologin()"> 验证</a>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
		function dologin() {
			var userid = $("#userid").val()
			if (userid == "") {
				layer.msg("用户名不为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}), function() {
					//消息关闭执行逻辑
				}
				return
			}
	
			if (!userIdVerify(userid)) {
				layer.msg("用户名不符合规范，请更换", {
					time : 1000,
					icon : 5,
					shift : 6
				}), function() {
					//消息关闭执行逻辑
				}
				return
			}
	
			var phoneNumber = $("#phoneNumber").val()
			if (!phoneNumberVerify(phoneNumber)) {
				layer.msg("手机号码格式输入错误", {
					time : 1000,
					icon : 5,
					shift : 6
				}), function() {
					//消息关闭执行逻辑
				}
				return
			}
		}
	
		function phoneNumberVerify(phone) {
			let reg = /^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8]|8[0-9]|9[1,8,9])\d{8}$/;
			return reg.test(phone);
		}
	
		function userIdVerify(userid) {
			let reg = /^[0-9a-zA-Z]{5,10}$/;
			return reg.test(userid);
		}
	</script>
</body>
</html>
