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
			<div class="container theme-showcase" role="main">
				<div class="page-header">
					<h1>实名认证 - 申请</h1>
				</div>

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation"><a href="#"><span class="badge">1</span> 基本信息</a></li>
					<li role="presentation" class="active"><a href="#"><span class="badge">2</span> 资质文件上传</a></li>
					<li role="presentation"><a href="#"><span class="badge">3</span> 邮箱确认</a></li>
					<li role="presentation"><a href="#"><span class="badge">4</span> 申请确认</a></li>
				</ul>

				<form role="form" style="margin-top:20px;">
					<div class="form-group">
						<label for="exampleInputEmail1">手执身份证照片</label> <input type="file" class="form-control"> <br> <img src="${APP_PATH}/img/pic.png">
					</div>
					<button type="button" onclick="window.location.href='${APP_PATH}/mine/host/step1'" class="btn btn-default">上一步</button>
					<button type="button" onclick="window.location.href='${APP_PATH}/mine/host/step3'" class="btn btn-success">下一步</button>
				</form>
				<hr>
			</div>
			<!-- /container -->
			<%@include file="/WEB-INF/jsp/common/statement.jsp"%>
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
		});
	</script>
</body>
</html>
