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
							<i class="glyphicon glyphicon-th"></i> 访问记录
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
						</form>
						<br>
						<hr style="clear:both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">No.</th>
										<th width="400">访客姓名</th>
										<th>访问业主</th>
										<th>单元楼</th>
										<th>出入时间</th>
									</tr>
								</thead>
								<tbody id="dataBody">
								</tbody>
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
			$.ajax({
				type : "POST",
				url : "${APP_PATH}/record/ajax/queryList",
				beforeSend : function() {
					index = layer.load(2, {
						time : 10 * 1000
					});
				},
				success : function(result) {
					layer.close(index);
					if (result.success) {
						var context = "";
						var datas = result.data;
	
						for (var i = 0; i < datas.length; i++) {
							context += '<tr>';
							context += '	<td>' + (i + 1) + '</td>';
							context += '	<td>' + datas[i].userName + '</td>';
							context += '	<td>' + datas[i].visitName + '</td>';
							context += '	<td>' + datas[i].tower + '</td>';
							context += '	<td>' + showTime(datas[i].time) + '</td>';
							context += '</tr>';
						}
	
						$("#dataBody").html(context);
					}
				}
			});
		});
		function showTime(value) {
			nowtime = new Date(value);
			year = nowtime.getFullYear();
			month = nowtime.getMonth() + 1;
			date = nowtime.getDate();
			return year + "-" + month + "-" + date + " " + nowtime.toLocaleTimeString();
		}
	</script>
</body>
</html>