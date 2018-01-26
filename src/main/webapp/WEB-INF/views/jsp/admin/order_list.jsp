<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<link rel="stylesheet" href="css/admin.css" />
<script type="text/javascript">
	function goPage(p) {
		$("#page").val(p);
		$("#form1").submit();
	}
	$(function() {
		$("#payStatus").val("${order.orderDetail.payStatus}");
		$("#sendStatus").val("${order.orderDetail.payStatus}");
		$("#status").val("${order.status}");
		//$("#name").val("${goods.name}");
	});

	function delGoods(id) {
		if (confirm("您确认要删除该商品吗？")) {
			location.href = "./goods/delete?goodsId=" + id;
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
					<form action="./order/listByPage" method="post" id="form1">
						<input type="hidden" name="page" id="page" value="" />
						<%--<select name="order.orderDetail.payStatus" class="auto" id="payStatus">--%>
						<select name="orderDetail.payStatus" id="payStatus">
						<%--<select name="queryPayStatus" class="auto" id="payStatus">--%>
							<%--<option value="-1">选择支付状态</option>--%>
							<option value="-1" selected>选择支付状态</option>
							<option value="0">未支付</option>
							<option value="1">已支付</option></select>
						<select name="orderDetail.sendStatus" id="sendStatus">
						<%--<select name="querySendStatus" class="auto" id="sendStatus">--%>
							<%--<option value="-1">选择发货状态</option>--%>
							<option value="-1" selected>选择发货状态</option>
							<option value="0">未发货</option>
							<option value="1">已发货</option></select>
						<select name="status" id="status">
						<%--<select name="orderStatus" class="auto" id="status">--%>
							<%--<option value="-1">选择订单状态</option>--%>
							<option value="-1" selected>选择订单状态</option>
							<!--新订单，最近多久算新-->
							<option value="0">新订单</option>
							<option value="1">取消订单</option>
							<option value="2">完成订单</option></select>
						<button class="btn" type="submit">
							<span class="sel">筛 选</span>
						</button>
					</form>
				</div>
				<div class="field">
					<table class="list_table">
						<colgroup>
							<col width="30px">
								<col width="155px">
									<col width="75px">
										<col width="75px">
											<col width="75px">
												<col width="105px">
													<col width="80px">
														<col>
						</colgroup>
						<thead>
							<tr>
								<th class="t_c">选择</th>
								<th>订单号</th>
								<th>收货人</th>
								<th>支付状态</th>
								<th>发货状态</th>
								<th>配送方式</th>
								<th>支付方式</th>
								<th>用户名</th>
								<th>下单时间</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form name="orderForm" id="orderForm" action="" method="post">
				<div class="content">
					<table class="list_table">
						<colgroup>
							<col width="30px" />
							<col width="175px" />
							<col width="65px" />
							<col width="75px" />
							<col width="65px" />
							<col width="105px" />
							<col width="80px" />
							<col />
						</colgroup>
						<tbody>
							<c:forEach items="${pageBean.data}" var="order">
								<tr>
									<td class="t_c"><input name="" type="checkbox" value="1" />
									</td>
									<td title="${order.id }">${order.id }</td>
									<td title="${order.address.accept }">${order.address.accept }</td>
									<td><c:if test="${order.orderDetail.payStatus eq 0 }">
											<b class='red'>未付款</b>
										</c:if> <c:if test="${order.orderDetail.payStatus eq 1}">
											<b class='green'>已付款</b>
										</c:if></td>
									<td><c:if test="${order.orderDetail.payStatus eq 0 }">
											<b class='red'>未发货</b>
										</c:if> <c:if test="${order.orderDetail.payStatus eq 1 }">
											<b class='green'>已发货</b>
										</c:if></td>
									<td title="${order.deliveryType }">${order.deliveryType }</td>
									<td title="${order.payType }">${order.payType }</td>
									<td title="${order.user.name }">${order.user.name }</td>
									<td title="${order.orderTime }">${order.orderTime }</td>
									<td><a href="./admin/toOrderView">
										<img class="operator" src="images/admin/icon_check.gif" title="查看" /></a>
										<a href="">
											<img class="operator" src="images/admin/icon_edit.gif" title="编辑" /></a>
										<a href="javascript:void(0)" onclick="">
											<img class="operator" src="images/admin/icon_del.gif" title="删除" /></a></td>
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
		<div id="separator"></div>
	</div>
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>