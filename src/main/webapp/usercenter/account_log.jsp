<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>账户余额_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript">
	$(function() {
		setSelectedClass("usercenter/account_log.jsp");
	});
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">
				<div class="uc_title m_10">
					<label class="current"><span>账户余额</span></label>
				</div>

				<div class="prompt m_10">
					<p>
						账户余额：<b class="orange f14">${user.money}</b>
					</p>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
