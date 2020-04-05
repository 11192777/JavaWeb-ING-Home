<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="GB18030">
<meta http-equiv="X-
UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/css/theme.css">
<style>
#footer {
	padding: 15px 0;
	background: #fff;
	border-top: 1px solid #ddd;
	text-align: center;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<img src="${APP_PATH}/images/logo/logo.png" style="height: 65px;" class="img-responsive" alt="Responsive image">
	</nav>
	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>我的租客 - 添加</h1>
		</div>


		<form role="form" style="margin-top:20px;">
			<div class="form-group">
				<label for="exampleInputEmail1">租客姓名</label> <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入真实名称">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">联系电话</label> <input type="text" class="form-control" id="exampleInputPassword1" placeholder="请输入电话号码">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">工作单位</label> <input type="text" class="form-control" id="exampleInputPassword1" placeholder="请输入工作单位">
			</div>
			<hr>
			<div>
				<label>入住时间:</label> <input type="date">
			</div>
			<hr>
			<div class="form-group">
				<label for="exampleInputEmail1">身份证正面</label> <input type="file" class="form-control">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">省份证背面</label> <input type="file" class="form-control">
			</div>
			<hr>
			<button type="button" onclick="window.location.href='${APP_PATH}/mine/tenant'" class="btn btn-warning" style="width: 100px">返回</button>
			<button type="button" onclick="window.location.href='${APP_PATH}/mine/tenant'" class="btn btn-success" style="width: 100px">提交</button>
		</form>
		<hr>
	</div>
	<!-- /container -->
	<%@include file="/WEB-INF/jsp/common/statement.jsp"%>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script>
		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		});
	</script>
</body>
</html>