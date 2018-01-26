<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<script type="text/javascript">
	function delMember(id) {
		//alert(id);
		if (confirm("您确认要删除该用户吗？")) {
			location.href = "./user/delete?userId=" + id;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="admin_left">
			<ul class="submenu">
				<jsp:include page="left.jsp"></jsp:include>
			</ul>
			<div id="copyright"></div>
		</div>

		<div id="admin_right">
			<div class="headbar">
				<div class="field">
					<table class="list_table">
						<colgroup>
							<col width="30px">
							<col width="75px">
							<col width="75px">
							<col width="80px">
							<col width="135px">
							<col width="75px">
							<col width="75px">
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>Tel</th>
								<th>余额</th>
								<th>注册日期</th>
								<th>角色</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form method="post" name="./member_list">
				<div class="content">
					<table id="list_table" class="list_table">
						<colgroup>
							<col width="30px">
							<col width="75px">
							<col width="75px">
							<col width="80px">
							<col width="135px">
							<col width="75px">
							<col width="75px">
							<col width="100px">
						</colgroup>
						<tbody>
							<c:forEach items="${userList}" var="user" varStatus="s">
								<tr>
									<td>${s.index }</td>
									<td title="${user.name }">${user.name }</td>
									<td title="${user.phoneNum }">${user.phoneNum }</td>
									<td title="${user.money }">${user.money }</td>
									<td title="${user.regTime }">${user.regTime }</td>
									<td title="${user.role }">
										<c:if test="${user.role eq 'a'}">
											<span>管理员</span></c:if>
										<c:if test="${user.role eq 'u'}">
											<span>会员</span></c:if></td>
									<td title="${user.status }">
										<c:if test="${user.status eq 0}">
											<span style="color:grey">下线</span>
										</c:if> <c:if test="${user.status eq 1}">
											<span style="color:blue">在线</span>
										</c:if> <c:if test="${user.status eq 2}">
											<span style="color:red">已删除</span>
										</c:if></td>
									<td><!-- 修改操作 -->
										<a href="./admin/memberUpdate?memberId=${user.id}" target="_blank"><img class="operator"
											src="images/admin/icon_edit.gif" alt="修改" /></a>
										<!-- 删除操作-->
										<a href="javascript:delMember('${user.id }')"><img
											class="operator" src="images/admin/icon_del.gif" alt="删除" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pages_bar">
					<a
						href="/iwebshop/index.php?controller=member&amp;action=member_list&amp;page=1">首页</a><a
						href="/iwebshop/index.php?controller=member&amp;action=member_list&amp;page=0">尾页</a><span>当前第1页/共0页</span>
				</div>
			</form>

		</div>
		<div id="separator"></div>
	</div>

	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>