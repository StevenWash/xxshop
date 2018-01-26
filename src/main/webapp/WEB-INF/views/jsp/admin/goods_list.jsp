<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript">
	function goPage(p) {
		$("#page").val(p);
		$("#form1").submit();
	}
	$(function() {
		$("#category").val("${goods.categoryId}");
		$("#name").val("${goods.name}");
	});
	
	function delGoods(id) {
		if(confirm("您确认要删除该商品吗？")){
			location.href="./goods/delete?goodsId="+id;
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
				<div class="searchbar">
					<form action="./goods/listByPage" method="get" id="form1">
						<input type="hidden" name="page" id="page" value="" />
						<select class="auto" name="categoryId" id="category">
							<option value="">选择分类</option>
							<c:forEach items="${categories}" var="category">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
						</select> 商品名：<input class="small" name="name" id="name" type="text" value="">
						<button class="btn" type="submit">
							<span class="sel">筛 选</span>
						</button>
					</form>
				</div>

				<div class="field">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<thead>
							<tr>
								<th>选择</th>
								<th>商品名称</th>
								<th>分类</th>
								<th>销售价</th>
								<th>库存</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
			<form action="" method="post" name="orderForm">
				<div class="content">
					<table class="list_table">
						<col width="40px" />
						<col width="400px" />
						<col width="120px" />
						<col width="70px" />
						<col width="70px" />
						<col width="70px" />
						<tbody>
							<c:forEach items="${pageBean.data}" var="goods">
								<tr>
									<td><input name="id[]" type="checkbox" value="1" /></td>
									<td><a href="" target="_blank" title="${goods.name}">${goods.name}</a></td>
									<td>${goods.category.name}</td>
									<td>${goods.price2}</td>
									<td>${goods.stock}</td>
									<td><a href="./goods/update?goodsId=${goods.id}">
											<img class="operator" src="images/admin/icon_edit.gif" alt="编辑" /></a>
										<a href="javascript:void(0)" onclick="delGoods('${goods.id}')">
											<img class="operator" src="images/admin/icon_del.gif" alt="删除" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
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
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>