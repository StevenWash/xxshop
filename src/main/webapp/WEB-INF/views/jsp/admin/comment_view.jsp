<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
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
			<div class="content_box">
				<div class="content form_content">
					<form action="" method="post" name="comment_edit">
						<table class="form_table">
							<col width="150px" />
							<col />
							<tr>
								<th>评论人：</th>
								<td><a href="">${comment.user.name}</a></td>
							</tr>
							<tr>
								<th>评价时间：</th>
								<td>${comment.createtime}</td>
							</tr>
							<tr>
								<th>评价商品：</th>
								<td><a class="orange" href="./goods/view?goodsId=${comment.goods.id}"
								   target="_blank">${comment.goods.name}</a></td>
								<%--<td>${comment.goods.name}</td>--%>
							</tr>
							<tr>
								<th>评价内容：</th>
								<td>${comment.remark}</td>
							</tr>
							<%--考虑贴图？？？--%>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
<!--
<%--<table class="form_table">--%>
<%--<col width="150px" />--%>
<%--<col />--%>
<%--<tr>--%>
<%--<th>评论人：</th>--%>
<%--<td><a href="">谭岚</a></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th>评价时间：</th>--%>
<%--<td>2015-05-03 10:52:33</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th>评价商品：</th>--%>
<%--<td>苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<th>评价内容：</th>--%>
<%--<td>还不错，下次还买！</td>--%>
<%--</tr>--%>
<%--</table>--%>
-->
</html>

