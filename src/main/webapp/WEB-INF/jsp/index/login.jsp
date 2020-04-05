<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="index.html" style="font-size: 32px;">Home</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">

		<form id="loginForm" method="post" action="user/doLogin" class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-globe"></i> 用户登陆
			</h2>
			<div class="form-group has-default has-feedback">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="请输入登录账号" autofocus> <span class="glyphicon glyphicon-yen form-control-feedback"></span>
			</div>
			<div class="form-group has-default has-feedback">
				<input type="password" class="form-control" id="userPasswd" name="userPassword" placeholder="请输入登录密码" style="margin-top: 10px;"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="checkbox">
				<a href="${APP_PATH}/index/register" style="color: red">还没有账号？立即注册</a>
				<%for (int i=0;i<6;i++) out.print("&emsp;"); %>
				<a href="${APP_PATH}/index/forgetPasswd" style="color: black">忘记密码</a>
			</div>
			<a class="btn btn-lg btn btn-danger btn-block" onclick="dologin()"> 登录</a>
		</form>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
		function dologin() {
			//页面非空校验
			var userId = $("#userId").val()
			if (userId == "") {
				layer.msg("登陆账号不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
	
			var userPasswd = $("#userPasswd").val()
			if (userPasswd == "") {
				layer.msg("登陆密码不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					//消息关闭执行此逻辑
				})
				return
			}
	
			var index = 0;
			$.ajax({
				type : "POST",
				url : "ajax/doLogin",
				data : {
					"userId" : userId,
					"userPasswd" : userPasswd,
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						window.location.href = "${APP_PATH}/main";
					} else {
						layer.msg("登陆账号或密码不正确，请重新输入", {
							time : 2000,
							icon : 5,
							shift : 6
						}, function() {
							// 消息关闭后执行的逻辑
						});
					}
				}
			});
	
		}
	</script>
</body>
</html>