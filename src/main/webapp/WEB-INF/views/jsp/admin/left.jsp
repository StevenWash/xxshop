<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="menu">
	<c:choose>
		<%--超级管理员--%>
		<c:when test="${sessionScope.user.name eq 'admin'}" >
			<li><a href="./admin/authorityList">管理员权限管理</a></li>
			<li><a href="./user/member">会员管理</a></li>
			<li><a href="./admin/toIndex">数据报表</a></li>
		</c:when>

		<%--一般业务管理--%>
		<c:otherwise>
			<li><a href="./goods/listByCate?goodsCategoryId=05dca3df8e2148b9b40614ffba993fe4">商品列表</a></li>
			<%--<li><a href="./goods/listByPage">商品列表</a></li>--%>
			<li><a href="./goods/add">商品添加</a></li>
			<li><a href="./category/list">分类列表</a></li>
			<li><a href="./admin/toCategoryAdd">添加分类</a></li>
			<li><a href="./order/listByPage">订单列表</a></li>
			<li><a href="./comment/list">评价管理</a></li>
		</c:otherwise>
	</c:choose>
</ul>