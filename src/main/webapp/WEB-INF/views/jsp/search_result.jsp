<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<base href="${base}/" />
<title>搜索结果_${site}</title>
<jsp:include page="base.jsp" />
</head>

<body class="index">
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="search.jsp"></jsp:include>

		<div class="wrapper clearfix">
			<div class="sidebar f_r">
				<!--热卖商品-->
				<div class="hot box m_10">
					<div class="title">
						<h2>热卖商品</h2>
					</div>
					<div class="cont clearfix">
						<ul class="prolist">
                            <form action="./goods/getHotGoods" />
                            <c:forEach items="${hotGoodses}" var="goods">
								<li><a href="./goods/view?goodsId=${goods.id}"
									target="_blank"> <img src="${goods.thumbnail}" width="85"
										height="85" alt="" />
								</a>
									<p class="pro_title">
										<a title="${goods.name}" href="./goods/view?goodsId=${goods.id}"
										target="_blank">${goods.name}</a>
									</p>
									<p class="brown">
										<b>￥${goods.price2}</b>
									</p></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--热卖商品-->
			</div>


			<h2></h2>
			<div class="main f_l">
				<!--搜索结果 start-->
				<div class="box yellow m_10">
					<div class="title title3">
						<h2><font color="orange">
							搜索结果</font>
						</h2>
					</div>
					<div class="cont clearfix">
						<ul class="prolist">
							<c:if test="${search_result==null}">
                                <h2>search_result = null</h2>
                            </c:if>

							<c:forEach items="${search_result}" var="goods">
								<li style="overflow: hidden"><a
									href="./goods/view?goodsId=${goods.id}" target="_blank"><img
										src="${goods.thumbnail}" width="175" height="175" alt="" /></a>
									<p class="pro_title">
										<a title="" href="./goods/view?goodsId=${goods.id}">${goods.name}</a>
									</p>
									<p class="brown">
										惊喜价：<b>￥${goods.price2}</b>
									</p>
									<p class="light_gray">
										市场价：<s>￥${goods.price1}</s>
									</p></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--最新商品 end-->
			</div>
		</div> 
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


</body>
</html>