<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="${base}/" />
<title>管理后台登录</title>
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<link rel="stylesheet" type="text/css" href="css/admin.css" />
<script type="text/javascript">
	$(function(){
		$("#captchaImg").on("click",function(){
			$(this).attr("src","random?"+new Date().getTime());
		});
	});
</script>
</head>
<body id="login">
	<div class="container">
		<div id="header">
			<div class="logo">
				<a href="#"><img src="images/admin/logo.png" width="303" height="43" /></a>
			</div>
		</div>
		<div id="wrapper" class="clearfix">
			<div class="login_box">
				<div class="login_title">后台管理登录</div>
				<div class="login_cont">
					<form action='./user/adminLogin' method='post'>
						<table class="form_table">
							<col width="90px" />
							<col />
							<tr>
								<th valign="middle">用户名：</th><td><input class="normal" type="text" name="name" alt="请填写用户名" /></td>
							</tr>
							<tr>
								<th valign="middle">密码：</th><td><input class="normal" type="password" name="password" alt="请填写密码" /></td>
							</tr>
							<!-- 随机产生二维码 前端？！？！后台？！？！ -->
							<tr>
								<th valign="middle">验证码：</th><td><input style="width:85px" type='text' class='normal' name='captcha' /><label>填写下图所示字符</label></td>
						  	</tr>
							<tr class="low">
								<th></th>
								<td><img src='images/verifyCodeImg/verifyCodeImg_001.png' width="80" id='captchaImg' /></td>
								<%--<td><img src='verifycode' id='captchaImg' /></td>--%>
							</tr>
							<tr>
								<th valign="middle"></th><td><input class="submit" type="submit" value="登录" /><input class="submit" type="reset" value="取消" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="footer">Power by ishop Copyright &copy; 2005-2014</div>
	</div>
</body>
<script>
	<c:if test="${not empty msg}">
		alert("${msg}");
	</c:if>
</script>
</html>

