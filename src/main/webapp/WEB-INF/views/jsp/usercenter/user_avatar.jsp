<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>个人中心_${site}</title>
<jsp:include page="../base.jsp" />
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp" />
		<jsp:include page="../navbar.jsp" />
		<jsp:include page="../search.jsp" />
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">
				<div class="userinfo_bar">
					<b class="f14">您好，${sessionScope.user.name}
						欢迎回来!</b>
				</div>
				<div class="box clearfix">
					<h3>用户信息</h3>
					<dl class="userinfo_box">
						<form action="./user/uploadAvatar" method="post" enctype="multipart/form-data">
							<input type="file" name="avatar">
							<input type="submit" value="上传"> 
						</form>
					</dl>
				</div>
			</div>
		</div>
	<jsp:include page="../help.jsp" />
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>
