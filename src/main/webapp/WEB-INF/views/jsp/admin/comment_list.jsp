<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript">
	function delComment(id) {
		if(confirm("您确定要删除该条评论吗？")){
		    location.href = ("./comment/adminDelete?commentId=" + id);
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
					<%--<table class="list_table">--%>
					<table class="list_table m_10 mt_10">
						<col width="20%" />
						<col width="10%" />
						<col width="5%" />
						<col width="40%" />
						<col width="15%" />
						<col width="10%" />

						<thead>
							<tr role="head">
								<th>评价商品</th>
								<th>评论用户</th>
								<th>评星</th>
								<th>评价</th>
								<th>评价时间</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form method="post" name="comment_list">
				<div class="content">
					<table id="list_table" class="list_table m_10 mt_10">
					<%--<table id="list_table" class="list_table">--%>
						<col width="20%" />
						<col width="10%" />
						<col width="5%" />
						<col width="40%" />
						<col width="15%" />
						<col width="10%" />
						<tbody>
							<c:forEach items="${commentList}" var="comment">
							<tr>
								<td><a class="orange" href="./goods/view?goodsId=${comment.goods.id}"
									   target="_blank">${comment.goods.name}</a></td>
								<td>${comment.user.name}</td>
								<td>${comment.score}</td>
								<td>${comment.remark}</td>
								<td>${comment.createtime}</td>
								<td><a href="./comment/view?commentId=${comment.id}">
									<img class="operator" src="images/admin/icon_check.gif" alt="查看" /></a>
									<a href="javascript:void(0)" onclick="delComment('${comment.id}')">
										<img class="operator" src="images/admin/icon_del.gif" alt="删除" /></a></td>
							</tr>
							</c:forEach>
						</tbody>


					</table>
				</div>
			</form>

		</div>
		<div id="separator"></div>
	</div>

</body>

<%--<tbody>--%>
<%--<tr>--%>
<%--<td>1</td>--%>
<%--<td><a href="">谭岚</a></td>--%>
<%--<td><a href="" target="_blank">苹果（Apple）iPhone 6--%>
<%--(A1586) 16GB 金色 移动联通电信4G手机</a></td>--%>
<%--<td>2015-05-03 10:52:33</td>--%>
<%--<td><a href="./admin/toCommentView"><img class="operator"--%>
<%--src="images/admin/icon_check.gif" alt="查看" /></a>--%>
<%--<!--删除按钮未设置-->--%>
<%--<a href="javascript:void(0)" onclick=""><img class="operator"--%>
<%--src="images/admin/icon_del.gif" alt="删除" /></a></td>--%>
<%--</tr>--%>
<%--</tbody>--%>

</html>
