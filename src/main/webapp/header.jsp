<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
	<h1 class="logo">
		<a title="" style="background: url(images/logo.png);" href="">电子商务平台</a>
	</h1>
	<ul class="shortcut">
		<li class="first"><a href="order_uindex">我的账户</a></li>
		<li><a href="order_listByUser">我的订单</a></li>
		<c:if test="${sessionScope.user.role eq 'a'}">
			<li><a href="admin/login.jsp">后台管理</a></li>
			<%--<li><a href="admin">后台管理</a></li>--%>
		</c:if>
		<li class='last'><a href="">使用帮助</a></li>
	</ul>
	<p class="loginfo">
		<c:if test="${not empty sessionScope.user}">
		${user.name}您好，欢迎您来到${site}购物！[<a href="user_logout" class="reg">安全退出</a>]
	  </c:if>
		<c:if test="${empty sessionScope.user}">
	  	[<a href="login.jsp">登录</a>
			<a class="reg" href="register.jsp">免费注册</a>]
	  </c:if>
	</p>
</div>