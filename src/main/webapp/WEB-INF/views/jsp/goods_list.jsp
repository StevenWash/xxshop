<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<meta charset="UTF-8" />
<%--<title>商品分类列表_${site}</title>--%>
<title>${category.name }_${site}</title>
<link type="image/x-icon" href="favicon.ico" rel="icon" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/shopcar.js"></script>
<script type="text/javascript" src="js/template.js"></script>
	<script type="text/javascript">
        function goPage(p) {
            $("#page").val(p);
            $("#form1").submit();
        }
        $(function() {
            $("#category").val("${goods.categoryId}");
            $("#name").val("${goods.name}");
        });
	</script>

<script type="text/javascript">
	$(function() {
		var index = $("#index").val();
		if (index == null || index <= 0) {
			index = 0;
		}
		$(".tag .current").removeClass("current");
		$(".tag>li:eq(" + (parseInt(index) - 1) + ")").addClass("current");

		$(".tag li").each(function(ind) {
			$(this).click(function() {
				$(".tag .current").removeClass("current");
				$(this).addClass("current");
			})
		});
	})
	function joinCart_list(num, goodsId, price) {
		location.href = "./cart/add?goodsId=" + goodsId
			+ "&num=" + num + "&price=" + price;
    }
</script>
</head>
<body class="index">
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="navbar.jsp"></jsp:include>
		<jsp:include page="search.jsp"></jsp:include>

		<form action="./goods/listByPageCate" method="get" id="form1">
			<input type="hidden" name="page" id="page" value="" />
			<input type="hidden" name="categoryId" id="categoryId" value="${category.id}" />
			<input type="hidden" name="order" id="order" value="${order}" />
			<button type = "hidden" class="btn" type="submit">

			</button>
		</form>



		<div class="position">
			<span>您当前的位置：</span> <a href="">首页</a> » <a href="">${category.name }</a>
		</div>
		<div class="wrapper clearfix container_2">
			<div class="sidebar f_l">
				<!--销售排行-->
				<div class="box m_10">
					<div class="title">销售排行榜</div>
					<div class="content">
						<ul class="ranklist" id='ranklist'>
							<%--<c:forEach items="${goodsesWithOrder }" var="goods" varStatus="s">--%>
							<c:forEach items="${goodses }" var="goods" varStatus="s">
								<%--<a href="./goods/view?goodsId=${goods.id }" target="_blank">--%>
									<%--<img src="${goods.thumbnail}" width="85" height="85" alt="${goods.name}" /></a>--%>
								<li><span>${s.index+1}</span>
										<a title="${goods.name}" class="p_name"
										   href="./goods/view?goodsId=${goods.id}">${goods.name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--销售排行-->
			</div>

			<div class="main f_r">
				<!--商品列表展示-->
				<div class="display_title">
					<span class="l"></span> <span class="r"></span> <span class="f_l">排序：</span>
					<ul class="tag">
						<li id="sellnum" class="current"><span class="l"></span><span class="r"></span>
							<a href="./goods/listByPageCate?categoryId=${category.id}&order=sellnum&index=1">销量<span class="">&nbsp;</span></a>
							<input id="index" name="index" type="hidden" value="${index}" /></li>
						<li id="role" class="" onclick=""><span class="l"></span><span class="r"></span>
							<a href="./goods/listByPageCate?categoryId=${category.id}&order=role&index=2">热度<span class="">&nbsp;</span></a></li>
						<li id="price2" class=""><span class="l"></span><span class="r"></span>
							<a href="./goods/listByPageCate?categoryId=${category.id}&order=price2&index=3">价格<span class="">&nbsp;</span></a></li>
						<li id="selltime" class=""><span class="l"></span><span class="r"></span>
							<a href="./goods/listByPageCate?categoryId=${category.id}&order=selltime&index=4">最新上架<span class="">&nbsp;</span></a></li>
					</ul>
				</div>

				<ul class="display_list clearfix m_10">

					<c:forEach items="${pageBean.data }" var="goods">
						<li class="clearfix win">
							<input type="hidden" name="page" id="page" value="" />
							<div class="pic">
								<a title="${goods.name }"
									href="./goods/view?goodsId=${goods.id }">
									<img src="${goods.thumbnail }" width="200" height="200" alt="${goods.name }" title="${goods.name }" /></a>
							</div>
							<h3 class="title">
								<a title="${goods.name }" class="p_name" href="./goods/view?goodsId=${goods.id}">${goods.name }</a>
								<%--<span>总销量：${goods.sellNum }<a class="blue" href="">( 0人评论 )</a></span>--%>
								<span>总销量：${goods.sellNum }<a class="blue" href="./goods/view?goodsId=${goods.id}">评论</a></span>
								<span class='grade'><i style='width: 0px'></i></span>
							</h3>
							<div class="handle">
								<label class="btn_gray_m"><img
									src="images/front/ucenter/shopping.gif" width="15" height="15" />
									<input type="button" value="加入购物车" onclick="joinCart_list('1','${goods.id}','${goods.price2}');"></label>
								<div class="msgbox" style="width: 350px; display: none">
									<div class="msg_t">
										<a class="close f_r"
											onclick="$(this).parents('.msgbox').hide();">关闭</a>请选择规格
									</div>
									<div class="msg_c" id='product_box_1'></div>
								</div>
							</div>
							<div class="price">
								${goods.price2 }<s>${goods.price1 }</s>
							</div></li>
					</c:forEach>
				</ul>


				<div class='pages_bar'>
					<a href='javascript:goPage(1)' id="first">首页</a>
					<c:forEach begin="1" end="${pageBean.totalPage}" var="p">
						<a href="javascript:goPage('${p}')">${p}</a>
					</c:forEach>
					<%--<select onchange="goPage(this.value)">--%>
						<%--<c:forEach begin="1" end="${pageBean.totalPage}" var="p">--%>
							<%--<option id="indeP" value="${p}">${p}</option>--%>
						<%--</c:forEach></select>--%>
					<a href='javascript:goPage(${pageBean.totalPage})' id="last">尾页</a>
					<span>当前第${pageBean.page}页/共${pageBean.totalPage}页</span>
				</div>
				<!--商品列表展示-->

			</div>
		</div>
		<jsp:include page="help.jsp"></jsp:include>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>
