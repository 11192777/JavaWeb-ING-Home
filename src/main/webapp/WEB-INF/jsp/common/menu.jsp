<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-3 col-md-2 sidebar">
	<div class="tree">
		<ul style="padding-left:0px;" class="list-group">
			<li class="list-group-item"><span><i class="glyphicon glyphicon-cloud"></i> 交友圈<span class="badge" style="float:right">3</span></span>
				<ul style="margin-top:10px;">
					<li style="height:30px;"><a href="${APP_PATH}/user.html"><i class="glyphicon glyphicon-check"></i> 交友圈</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/role.html"><i class="glyphicon glyphicon-check"></i> 发表说说</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/permission.html"><i class="glyphicon glyphicon-check"></i> 我的说说</a></li>
				</ul></li>
			<li class="list-group-item"><span><i class="glyphicon glyphicon-comment"></i> 私信 <span class="badge" style="float:right">3</span></span>
				<ul style="margin-top:10px;">
					<li style="height:30px;"><a href="${APP_PATH}/message/friend"><i class="glyphicon glyphicon-check"></i> 好友</a></li>
				</ul></li>
			<li class="list-group-item"><span><i class="glyphicon glyphicon-home"></i> 租房 <span class="badge" style="float:right">1</span></span>
				<ul style="margin-top:10px;">
					<li style="height:30px;"><a href="${APP_PATH}/homeShow/showHomes"><i class="glyphicon glyphicon-check"></i> 浏览房源</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/favorite/homes"><i class="glyphicon glyphicon-check"></i> 心愿单</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/process.html"><i class="glyphicon glyphicon-check"></i> 预约单</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/record/show"><i class="glyphicon glyphicon-check"></i> 住房记录</a></li>
				</ul></li>
			<li class="list-group-item"><span><i class="glyphicon glyphicon-user"></i> 我的<span class="badge" style="float:right">5</span></span>
				<ul style="margin-top:10px;">
					<li style="height:30px;"><a href="${APP_PATH}/mine/basicInformation"><i class="glyphicon glyphicon-check"></i> 基本信息</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/mine/host/step1"><i class="glyphicon glyphicon-check"></i> 成为房东</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/mine/tenant"><i class="glyphicon glyphicon-check"></i> 我的租客</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/mine/myHome"><i class="glyphicon glyphicon-check"></i> 我的房子</a></li>
					<li style="height:30px;"><a href="${APP_PATH}/message.html"><i class="glyphicon glyphicon-check"></i> 出入记录</a></li>
				</ul></li>
		</ul>
	</div>
</div>