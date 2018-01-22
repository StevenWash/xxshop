<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>地址管理_${site}</title>
<jsp:include page="../base.jsp" />

<script type="text/javascript" src="js/address.js"></script>

<script type="text/javascript">

</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search_backup.jsp"></jsp:include>
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
							<table class="list_table" width="100%" cellpadding="0"
								cellspacing="0">
								<%--<col width="120px" />--%>
								<%--<col width="120px" />--%>
								<%--<col width="120px" />--%>
								<%--<col width="120px" />--%>
								<%--<col width="120px" />--%>
								<%--<col />--%>
								<thead>
									<tr>
										<th>用户编号</th>
										<th>用户名</th>
										<th>电话号码</th>
										<th>注册时间</th>
										<th>邮箱</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td>${user.id}</td>
											<td>${user.name}</td>
											<td>${user.phoneNum}</td>
											<td>${user.regTime}</td>
											<td>${user.email}</td>
										</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
