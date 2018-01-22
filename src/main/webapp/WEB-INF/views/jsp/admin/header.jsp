<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="logo">
	<a href=""><img src="images/admin/logo.png" width="250" height="53" /></a>
</div>
<p>
	<a href="">退出管理</a> <a href="./admin/toIndex">后台首页</a> <a href="" target='_blank'>商城首页</a>
	<span>您好&nbsp;<label class='bold'>${sessionScope.user.name}</label>，当前身份&nbsp;<label
		class='bold'>
			<c:if test="${sessionScope.user.name eq 'admin'}">超级</c:if>
		管理员</label></span>
</p>