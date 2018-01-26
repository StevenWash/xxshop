<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>购物车_${site}</title>
<jsp:include page="base.jsp" />
</head>
<body class="index">
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="search.jsp"></jsp:include>

		<div class="wrapper clearfix">
			<div class="wrap_box">
				<div class="error box clearfix">
					<table class="form_table prompt_3">
						<colgroup>
							<col width="320px" />
							<col />
						</colgroup>

						<tbody>
							<tr>
								<th><img src="images/front/right.gif" width="48px"
									height="51px" /></th>
								<td><strong class="f14"> 支付成功 </strong></td>
							</tr>

							<tr>
								<th></th>
								<td>您现在可以去： <a class="blue" href="">继续操作 >></a> <a
									class="blue" href="./order/uindex">个人中心 >></a> <a class="blue" href="">网站首页
										>></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>
