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
<h1 style="font-weight: bold">Home用户注册</h1>
<body>
	<div class="panel-heading">
		<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal">
			<i class="glyphicon glyphicon-question-sign"></i>
		</div>
	</div>
	<div class="panel-body">
		<div class="form-group">
			<label for="exampleInputPassword1">用户名</label> <input type="text" class="form-control" id="userid" placeholder="请输入用户名">
			<p class="help-block label label-warning">用户名由5-10位数字和字母组成，请输入合法的用户名</p>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">密码</label> <input type="password" class="form-control" id="passwd1" placeholder="请输入密码">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">确认密码</label> <input type="password" class="form-control" id="passwd2" placeholder="再次输入密码">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">电话号码</label> <input type="text" class="form-control" id="phoneNumber" placeholder="电话号码">
		</div>
		<a class="btn btn-lg btn-success btn-block" onclick="dologin()"> 点击注册</a>
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
	
			var passwd1 = $("#passwd1").val()
			if (passwd1 == "") {
				layer.msg("登陆密码不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}), function() {
					//消息关闭执行逻辑
				}
				return
			}
	
			var passwd2 = $("#passwd2").val()
			if (passwd2 == "") {
				layer.msg("密码输入不一致", {
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
			$.ajax({
				type : "POST",
				url : "ajax/doRegister",
				data : {
					"userId" : userid,
					"userPasswd" : passwd1,
					"phoneNumber" : phoneNumber
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("注册成功，即将跳转到登陆界面", {
							time : 2000,
							icon : 6,
							shift : 5
						}, function() {
							window.location.href = "${APP_PATH}/index/login";
						});
					} else {
						layer.msg("用户名已经存在", {
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
