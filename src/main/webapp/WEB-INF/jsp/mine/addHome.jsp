<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
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
			<h1>我的房子 - 添加</h1>
		</div>


		<form role="form" style="margin-top:20px;">
			<div class="form-group">
				<label for="exampleInputEmail1">房源地址</label> <input type="text" class="form-control" id="homeLocation" placeholder="请输入房源地址">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">房源概况</label> <input type="text" class="form-control" id="homeInformation" placeholder="请输入房源概况">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">房源介绍</label> <input type="text" class="form-control" id="homeInclude" placeholder="请输入房源介绍">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">服务条款</label> <input type="text" class="form-control" id="service" placeholder="请输入服务条款">
			</div>
			<hr>
			<button type="button" onclick="window.location.href='${APP_PATH}/mine/myHome'" class="btn btn-warning" style="width: 100px">返回</button>
			<button type="button" onclick="addHome()" class="btn btn-success" style="width: 100px">发布房源</button>
		</form>
		<hr>
	</div>
	<!-- /container -->
	<%@include file="/WEB-INF/jsp/common/statement.jsp"%>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH}/layer/layer.js"></script>
	<script>
		$('#myTab a').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		});
	
		function addHome() {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/home/ajax/addHome",
				data : {
					"homeLocation" : $("#homeLocation").val(),
					"homeInformation" : $("#homeInformation").val(),
					"homeInclude" : $("#homeInclude").val(),
					"service" : $("service").val()
				},
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						layer.msg("添加成功", {
							time : 1000,
							icon : 6,
							shift : 5
						}, function() {
							window.location.href = "${APP_PATH}/mine/myHome"
						})
					}
				}
			});
		}
	</script>
</body>
</html>