<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>地址管理_${site}</title>
<jsp:include page="../base.jsp" />

	<link rel="stylesheet" type="text/css" href="css/index.css" />

<script type="text/javascript" src="js/address.js"></script>

<script type="text/javascript">

</script>
	<script>
        function showValue(){
            var t1 = document.getElementById("t1").value;
            document.write("<input type='text' id='t2' value="+t1+" />");
        }
	</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp"></jsp:include>
			<div class="main f_r">
				<div class='tabs'>
					<div class="uc_title m_10 tabs_menu">
						<label class="current node"><span>个人设置</span></label>
					</div>
					<div class='tabs_content'>
						<div id="address_list" class="form_content m_10 node">
							<div class="uc_title2 m_10">
								<strong>个人信息</strong>
							</div>
							<center><h4>原始密码输入错误，修改失败……</h4></center>
						</div>
					</div>
				</div>
				<center><a href="./user/userInfo"><td><label class="btn"><input type="submit" value="返回" /></label></td></a></center>
			</div>
		</div>
	</div>
	</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
