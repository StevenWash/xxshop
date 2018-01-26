<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<meta charset="utf-8" />
<title>${goods.name}_${site}</title>
<jsp:include page="base.jsp" />
<script type="text/javascript">

</script>

</head>
<body class="index">
	<div id="content"></div>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<%--<jsp:include page="search.jsp"></jsp:include>--%>
		<div>
			<div class="main f_r">
				<%--评价商品--%>
				<div class="uc_title m_10">
					<label class="current"><span>评价</span></label>
				</div>
				<table class="list_table" width="100%" cellpadding="0" cellspacing="0">
					<col width="20%" />
					<col width="50%" />
					<col width="30%" />
					<tr>
						<th>用户名</th>
						<th>评价</th>
						<th>评价时间</th>
					</tr>
					<tr>
						<td>${comment.user.name}</td>
						<td>${comment.remark}</td>
						<td>${comment.createtime}</td>
					<tr>
				</table>
				<%--对评价的回复--%>
				<div class="uc_title m_10">
					<label class="current"><span>回复</span></label>
				</div>
				<div class="box m_10">
					<table class="list_table" width="100%" cellpadding="0" cellspacing="0">
						<col width="20%" />
						<col width="50%" />
						<col width="30%" />
						<tr>
							<th>用户名</th>
							<th>回复</th>
							<th>评价时间</th>
						</tr>
						<c:forEach items="${reComments}" var="reComment">
						<tr>
							<td>${reComment.user.name}</td>
							<td>${reComment.remark}</td>
							<td>${reComment.createtime}</td>
						<tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="6" class="t_l"><div class='pages_bar'>
									<a href=''>首页</a><a class='current_page' href=''>1</a><a
										href=''>尾页</a><span>当前第1页/共1页</span>
								</div></td>
							</tr>
						</tfoot>
					</table>
					<%--不允许自己评论自己--%>
					<c:if test="${comment.ownerid ne sessionScope.user.id}">
						<div>
							<form action="./comment/addComment" method="post">
								<textarea id="judgecontent" name="remark"></textarea>
								<input type="hidden" name="targetId" value="${comment.id}" />
								<!-- 对评论的回复,statusNum为1 -->
								<input type="hidden" name="statusNum" value="1" />
								<input type="submit" value="发表" />
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<div class="bottom-left" style="bottom: auto">
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>