<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<%--<script type="text/javascript" src="js/jquery-2.0.3.js"></script>--%>
<%--<script type="text/javascript" src="js/jquery.cookie.js"></script>--%>
<%--<script type="text/javascript" src="js/shopcar.js"></script>--%>
<%--<script type="text/javascript" src="js/template.js"></script>--%>
<script type="text/javascript">
	function goPage(p) {
		$("#page").val(p);
		$("#form1").submit();
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

		<div>
			<form action="./user/listByPage" method="get" id="form1">
				<input type="hidden" name="page" id="page" value="" />
				<button type = "hidden" class="btn" type="submit" />
			</form>
		</div>

		<div id="admin_right">
			<div class="headbar">
				<div class="field">
					<table class="list_table">
						<colgroup>
							<col width="30px">
							<col width="135px">
							<col width="135px">
							<col width="135px">
							<col width="100px">
						</colgroup>
						<thead>
							<tr>
								<th>序号</th>
								<th>用户</th>
								<th>IP</th>
								<th>登录日期</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form method="post" name="./login_list">
				<div class="content">
					<table id="list_table" class="list_table">
						<colgroup>
							<col width="30px">
							<col width="135px">
							<col width="135px">
							<col width="135px">
							<col width="100px">
						</colgroup>
						<tbody>
							<c:forEach items="${pageBean.data}" var="visit" varStatus="s">
								<tr>
									<td>${s.index }</td>
									<td title="${visit.userName }">${visit.userName }</td>
									<td title="${visit.ip }">${visit.ip }</td>
									<td title="${visit.loginTime }">${visit.loginTime }</td>

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
				<div class='pages_bar'>
					<a href='javascript:goPage(1)' id="first">首页</a>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="p">
						<a href="javascript:goPage('${p}')">${p}</a>
					</c:forEach>
					<select onchange="goPage(this.value)">
						<c:forEach begin="1" end="${pageBean.totalPage}" var="p">
							<option id="indeP" value="${p}">${p}</option>
						</c:forEach>
					</select> <a href='javascript:goPage(${pageBean.totalPage})' id="last">尾页</a>
					<span>当前第${pageBean.page}页/共${pageBean.totalPage}页</span>
				</div>
			</form>

		</div>
		<%--<div id="separator"></div>--%>
	</div>

	<%--<div--%>
		<%--style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>--%>
</body>
</html>