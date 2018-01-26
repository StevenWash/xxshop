<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${base}/" />
<title>我的评价_${site}</title>
<jsp:include page="../base.jsp" />

<script type="text/javascript" src="/js/address.js"></script>
<script type="text/javascript">
	// 删除提示
	function delComment(id) {
		//alert(id);
		if(confirm("您确认要删除该评论吗？")) {
		    location.href = "./comment/delete?commentId=" + id;
		}
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
						<label class="current node"><span>我的评价</span></label>
					</div>
					<div class='tabs_content'>
						<div id="comment_list" class="form_content m_10 node">
							<div class="uc_title2 m_10">
								<strong>作出的评价</strong>
							</div>
							<table class="list_table" width="100%" cellpadding="0"
								cellspacing="0">
								<%--<col width="15%" /><col width="5%" /><col width="60%" /><col width="20%" />--%>
								<%--<col width="120px" />--%>
								<%--<col />--%>
								<thead>
									<tr>
										<th>商品名</th>
										<th>评星</th>
										<th>评论信息</th>
										<th>时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentList}" var="comment">
										<tr>
											<td>${comment.goods.name}</td>
											<td>${comment.score}</td>
											<td>${comment.remark}</td>
											<td>${comment.createtime}</td>
											<td><%--跳转评论的商品网页--%>
												<a class="blue" href="./goods/view?goodsId=${comment.targetid}"
												   target="_blank">查看</a>|
												<%--删除--%>
												<a id="delete" class="blue"
												   href="javascript:delComment('${comment.id}')">删除</a>
												<%--href="./usercenter/address/delete?addressId=${address.id}">删除</a>--%>
										</tr>
									</c:forEach>
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
