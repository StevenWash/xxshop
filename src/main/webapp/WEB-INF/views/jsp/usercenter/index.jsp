<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${base}/" />
<title>会员中心_${site}</title>
<%--<title>个人中心_${site}</title>--%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<jsp:include page="../base.jsp" />
<script type="text/javascript">
	//用于用户中心左边菜单栏的选择项的样式
	function setSelectedClass(url) {
		$('div.cont ul.list li a[href~="' + url + '"]').parent().addClass(
				"current");
	}
</script>
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp" />
		<jsp:include page="../navbar.jsp" />
		<jsp:include page="../search.jsp" />
		<div class="position">
			您当前的位置： <a href="">首页</a> » <a href="./order/uindex">我的账户</a>
		</div>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">

				<div class="userinfo_bar">
					<b class="f14">您好，${sessionScope.user.name} 欢迎回来!</b>
				</div>
				<div class="box clearfix">
					<h3>用户信息</h3>
					<dl class="userinfo_box">
						<dt>
							<a class="ico">
								<img id="user_ico_img"
									 src="${sessionScope.user.avatar}" width="100" height="100" alt="加载失败" /></a>
							<a class="blue" href="./user/usercenter/toAvatarChange">修改头像</a>
							<%--<a class="blue" href="usercenter/user_avatar.jsp">修改头像</a>--%>
						</dt>
						<dd>
							<table width="100%" cellpadding="0" cellspacing="0">
								<col width="350px" />
								<tr>
									<td>你的订单交易总数量：<b class="red2">${params.orderTotalNum }</b>&nbsp;&nbsp;&nbsp;<a
										class="blue" href="./order/listByUser">进入订单列表</a></td>
								</tr>
								<tr>
									<td>总消费额：<b class="red2">${params.totalUsed }</b></td>

								</tr>
								<tr>
									<td>预存款余额：<b class="red2">${sessionScope.user.money}</b></td>
								</tr>
							</table>

							<div class="stat">
								<span>待评价商品：<label>(<b class="red2">1</b>)
								</label></span> <span>待付款订单：<label>(<b class="red2">${params.noPay }</b>)
								</label></span> <span>待确认收货：<label>(<b class="red2"><a
											href="">${params.noReceive }</a></b>)
								</label></span>
							</div>
						</dd>
					</dl>
				</div>
				<h3 class="bg">我的订单</h3>
				<div class="box m_10">
					<table class="list_table" width="100%" cellpadding="0"
						cellspacing="0">
						<col width="140px" />
						<tr>
							<th>订单编号</th>
							<th>下单日期</th>
							<th>收货人</th>
							<th>支付方式</th>
							<th>总金额</th>
							<th>订单状态</th>
						</tr>

						<c:forEach items="${orders}" var="order">
							<tr>
								<td><a href="./order/resubmit?order.id=${order.id}"
									class="orange">${order.id }</a></td>
								<td>${order.orderTime }</td>
								<td>${order.address.accept}</td>
								<td>${order.payType }</td>
								<td>${order.totalMoney }</td>
								<td><b class="orange"><c:if
											test="${order.orderDetail.orderStatus == 0}">已取消</c:if> <c:if
											test="${order.orderDetail.orderStatus == 1}">待付款</c:if> <c:if
											test="${order.orderDetail.orderStatus == 2}">待发货</c:if> <c:if
											test="${order.orderDetail.orderStatus == 3}">待收货</c:if> <c:if
											test="${order.orderDetail.orderStatus == 4}">已完成</c:if> </b></td>
							<tr>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="6" class="t_r">
									<a class="blue" href="./order/listByUser">更多订单&gt;&gt;</a></td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
		</div>
		<jsp:include page="../help.jsp" />
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>
