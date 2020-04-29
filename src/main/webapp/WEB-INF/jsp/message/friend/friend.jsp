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
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 租客列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float:left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text" placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
							<button type="button" class="btn btn-success" onclick="window.location.href='${APP_PATH}/mine/addTenant'">
								<i class="glyphicon glyphicon-plus"></i> 添加新的好友
							</button>
						</form>
						<br>
						<hr style="clear:both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">No.</th>
										<th width="400">好友账号</th>
										<th>好友名称</th>
										<th width="50">聊天</th>
									</tr>
								</thead>
								<tbody id="dataBody"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
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
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/message/friend/ajax/getFriend",
				data : {
					"userId" : "${loginUser.userId}"
				},
				success : function(result) {
					var context = "";
					if (result.success) {
						var datas = result.data;
						for (var i = 0; i < datas.length; i++) {
							var data = datas[i];
							context += '<tr>';
							context += '	<td>' + (i + 1) + '</td>';
							context += '	<td>' + data.userId + '</td>';
							context += '	<td>' + data.userName + '</td>';
							context += '	<td>';
							context += '	<button type="button" class="btn btn-success btn-xs" onclick="goLatter(\'' + data.userId + '\')">';
							context += '	<i class=" glyphicon glyphicon-check"></i>';
							context += '	</button>';
							context += '	</td>';
							context += '</tr>';
						}
						$("#dataBody").html(context);
					}
				}
			});
		});
	
		function goLatter(userId) {
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/message/friend/ajax/latter",
				data : {
					receiveId : userId
				},
				success : function(){
					window.location.href="${APP_PATH}/message/friend/latter"
				}
			});
		}
	</script>
</body>
</html>