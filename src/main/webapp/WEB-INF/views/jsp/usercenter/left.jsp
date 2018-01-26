<%@ page language="java" pageEncoding="UTF-8"%>
<div class="sidebar f_l">
	<img src="images/front/ucenter/ucenter.gif" width="180" height="40" />
	<div class="box">
		<div class="title">
			<h2 class='bg5'>个人中心</h2>
		</div>
		<div class="cont">
			<ul class="list">
				<li><a href="./user/userInfo">个人设置</a></li>
				<li><a href="./usercenter/address/list">地址管理</a></li>
				<%--<li><a href="usercenter/address_list">地址管理</a></li>--%>
			</ul>
		</div>
	</div>

	<div class="box">
		<div class="title">
			<h2 class='bg4'>账户中心</h2>
			<%--<h2 class='bg4'>账户资金</h2>--%>
		</div>
		<div class="cont">
			<ul class="list">
				<li><a href="./user/usercenter/toAccountLog">帐户余额</a></li>
				<%--<li><a href="usercenter/account_log.jsp">帐户余额</a></li>--%>
				<li><a href="./user/usercenter/toOnlineRecharge">在线充值</a></li>
				<%--<li><a href="usercenter/online_recharge.jsp">在线充值</a></li>--%>
			</ul>
		</div>
	</div>

	<div class="box">
		<div class="title">
			<h2>订单中心</h2>
		</div>
		<div class="cont">
			<ul class="list">
				<li><a href="./order/listByUser">我的订单</a></li>
			</ul>
		</div>
		<div class="cont">
			<ul class="list">
				<li><a href="./comment/listByUser">我的评价</a></li>
			</ul>
		</div>
	</div>
</div>
