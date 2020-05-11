<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>二维码生成</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #262626;
}

#box {
	width: 1000px;
	height: 600px;
	margin: 200px auto;
}

#box .qrcode {
	width: 400px;
	height: 400px;
	float: left;
	margin: 40px 40px;
}

#box .introduce {
	width: 500px;
	height: 600px;
	float: left;
}

.introduce p {
	width: 200px;
	height: 40px;
	background: #333;
	float: left;
	margin: 10px 20px;
	color: #fff;
	border-radius: 5px;
	overflow: hidden;
}

.introduce p span {
	float: left;
	width: 50px;
	height: 40px;
	color: #fff;
	text-align: center;
	line-height: 40px;
}

.introduce p input {
	width: 150px;
	height: 40px;
	float: left;
	border: 0;
	color: #fff;
	background: #000;
	text-indent: 10px;
	outline: none;
}

.introduce .btn {
	width: 440px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	background: #6c0;
}

.qrcode>img {
	display: block;
	border: 5px solid white;
}
</style>
</head>
<body>

<div id="box" style="padding-left: 700px;">
	<h3 style="color: aliceblue">请用Home手机版搜生成的二微码，查看效果</h3>
	<div class="introduce">

		<p style="width: 400px;">
			<span style="width: 200px;">姓名：</span>
			<input style="width: 200px;" type="text" id="email" value="">
		</p>
		<p style="width: 400px;">
			<span style="width: 200px;">邮箱：</span>
			<input style="width: 200px;" type="text" id="email" value="">
		</p>
		<p style="width: 400px;">
			<span style="width: 200px;">手机：</span>
			<input style="width: 200px;" type="text" id="email" value="">
		</p>
		<p style="width: 400px;">
			<span style="width: 200px;">访问单元：</span>
			<input style="width: 200px;" type="text" id="email" value="">
		</p>
		<p style="width: 400px;">
			<span style="width: 200px;">个人身份证信息：</span>
			<input style="width: 200px;" type="text" id="email" value="">
		</p>
		<p style="width: 400px;" class="btn">生成二维码</p>
	</div>
	<div class="qrcode" id="qrcode"></div>
</div>

<script src="${APP_PATH}/js/jquery.min.js"></script>
<script src="${APP_PATH}js/qrcode.js"></script>
<script>
var name, company, title, address, mobile, email, web, desc;
$(".btn").click(function() {
	name = "FN:" + $("#name").val() + "\n";             //姓名
	company = "ORG:" + $("#company").val() + "\n";      //公司
	title = "TITLE:" + $("#title").val() + "\n";        //职务
	address = "WORK:" + $("#address").val() + "\n";     //地址
	mobile = "TEL:" + $("#mobile").val() + "\n";        //手机
	email = "EMAIL:" + $("#email").val() + "\n";        //邮箱
	web = "URL:" + $("#web").val() + "\n";              //网址
	desc = "NOTE:" + $("#desc").val() + "\n";           //备注

	var info = "BEGIN:VCARD\n" + name + company + title + address + mobile + email + web + desc + "END:VCARD";
	//console.log(info);
	//生成二维码
	var qrcode = new QRCode("qrcode");
	qrcode.makeCode(info);

})
</script>

</body>
</html>