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
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<img src="${APP_PATH}/images/logo/logo.png" style="height: 65px;" class="img-responsive" alt="Responsive image">
	</nav>

	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/jsp/common/menu.jsp"%>
			<div style="display: flex;justify-content: center;align-items: center; width: 0px; height: 50px;"></div>
			<div style="display: flex;justify-content: center;align-items: center; width: 145%;">
				<div class="col-xs-6 col-sm-3 placeholder">
					<img src="${APP_PATH}/images/headImg/${loginUser.userId}.png" class="img-responsive" alt="Generic placeholder thumbnail" style="width: 110px;height: 110px;"> <br> <br>
					<form id="headImgUpForm" action="${APP_PATH}/mine/headImgUpForm" method="post" enctype="multipart/form-data">
						<button type="button" class="btn btn-success" id="headImgUpButton">点击上传头像</button>
						<input type="file" name="headImgUpFile" style="display: none;" onchange="doSummit()">
					</form>
				</div>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<hr style="clear: both;">
				<div class="table-responsive">
					<table class="table  table-bordered">
						<tbody id="dataBody"></tbody>
					</table>
					<div style="display: flex;justify-content: center;align-items: center;">
						<button type="button" class="btn btn-success" style="width: 100px;">
							<i class="glyphicon glyphicon-pencil"></i> 修改
						</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<button type="button" class="btn btn-danger" style="width: 100px;">
							<i class="glyphicon glyphicon-refresh"></i> 保存
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			getUserInformation();
			$("#headImgUpButton").click(function() {
				var fileObj = $(this).next();
				fileObj.click();
			});
		});
		function getUserInformation() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/mine/ajax/getInformation",
				data : {
					"userId" : "${loginUser.userId}"
				},
				success : function(result) {
					var user = result.data;
					var context = ""
					context += '<tr><td style="text-align: right; width: 150px">姓名：</td><td style="text-align: left;">' + user.userName + '</td></tr>';
					context += '<tr><td style="text-align: right;">性别：</td><td style="text-align: left;">' + user.userSex + '</td></tr>';
					context += '<tr><td style="text-align: right;">身份证：</td><td style="text-align: left;">' + user.idCard + '</td></tr>';
					context += '<tr><td style="text-align: right;">年龄：</td><td style="text-align: left;">' + user.userAge + '</td></tr>';
					context += '<tr><td style="text-align: right;">所在小区：</td><td style="text-align: left;">' + user.hosting + '</td></tr>';
					context += '<tr><td style="text-align: right;">详细住址：</td><td style="text-align: left;">' + user.location + '</td></tr>';
					$("#dataBody").html(context);
				}
			});
		}
	
		function doSummit() {
			$("#headImgUpForm").submit();
		}
	</script>
</body>
</html>
