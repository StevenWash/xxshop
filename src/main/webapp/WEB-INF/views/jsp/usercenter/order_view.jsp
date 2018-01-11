<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>订单详情_${site}</title>
<jsp:include page="../base.jsp" />
</head>
<body class="index">
	<div class="ucenter container">
		<jsp:include page="../header.jsp"></jsp:include>
		<jsp:include page="../navbar.jsp"></jsp:include>
		<jsp:include page="../search.jsp"></jsp:include>
		<div class="wrapper clearfix">
			<jsp:include page="left.jsp" />
			<div class="main f_r">
				<div class="uc_title m_10">
					<label class="current"><span>订单详情</span></label>
				</div>
				<div class="prompt_2 m_10">
					<div class="t_part">
						<p>
							2015-05-01 11:39:41&nbsp;&nbsp;<span class="black">订单创建</span>
						</p>
						<p>
							2015-05-01 11:39:48&nbsp;&nbsp;<span class="black">订单付款
								5800.00</span>
						</p>
						<p>
							2015-05-01 11:41:53&nbsp;&nbsp;<span class="black">订单发货完成</span>
						</p>
						<p>
							2015-05-01 11:42:28&nbsp;&nbsp;<span class="black">订单完成</span>
						</p>
					</div>
					<p>
						<b>订单号：</b>20150501113941350735 <b>下单日期：</b>2015-05-01 11:39:41 <b>状态：</b>
						<span class="red2"> <b class="green">已完成</b>
						</span>
					</p>

					<form action='' method='post'>
						<p>
							<input type="hidden" name="order_id" value="2" /> <label
								class="btn_orange"> <input type="button" value="申请退款"
								onclick="" />
							</label>
						</p>
					</form>

				</div>
				<div class="box m_10">
					<div class="title">
						<h2>
							<span class="orange">收件人信息</span>
						</h2>
					</div>

					<!--收获信息展示-->
					<div class="cont clearfix" id="acceptShow">
						<table class="dotted_table f_l" width="100%" cellpadding="0"
							cellspacing="0">
							<col width="130px" />
							<col />
							<tr>
								<th>收货人：</th>
								<td>谭岚</td>
							</tr>
							<tr>
								<th>地址：</th>
								<td>四川省 成都市 青羊区 石人西路</td>
							</tr>
							<tr>
								<th>邮编：</th>
								<td></td>
							</tr>
							<tr>
								<th>固定电话：</th>
								<td></td>
							</tr>
							<tr>
								<th>手机号码：</th>
								<td>15982352915</td>
							</tr>
						</table>
					</div>
				</div>

				<!--支付和配送-->
				<div class="box m_10">
					<div class="title">
						<h2>
							<span class="orange">支付及配送方式</span>
						</h2>
					</div>
					<div class="cont clearfix">
						<table class="dotted_table f_l" width="100%" cellpadding="0"
							cellspacing="0">
							<col width="130px" />
							<col />
							<tr>
								<th>支付方式：</th>
								<td>预存款支付</td>
							</tr>


							<tr>
								<th>运费：</th>
								<td>20.00</td>
							</tr>
							<tr>
								<th>物流公司：</th>
								<td>中国邮政</td>
							</tr>
							<tr>
								<th>快递单号：</th>
								<td></td>
							</tr>
						</table>
					</div>
				</div>

				<!--物品清单-->
				<div class="box m_10">
					<div class="title">
						<h2>
							<span class="orange">商品清单</span>
						</h2>
					</div>
					<div class="cont clearfix">
						<table class="list_table f_l" width="100%" cellpadding="0"
							cellspacing="0">
							<tbody>
								<tr>
									<th>图片</th>
									<th>商品名称</th>
									<th>商品价格</th>
									<th>商品数量</th>
									<th>小计</th>
								</tr>
								<tr>
									<td><img class="pro_pic" src="images/goods/apple.jpg"
										width="50px" height="50px" /></td>
									<td class="t_l"><a class="blue" href="" target='_blank'>苹果（Apple）iPhone
											6 (A1586) 16GB 金色 移动联通电信4G手机</a></td>
									<td class="red2">￥5688.00</td>
									<td>x 1</td>
									<td class="red2 bold">￥5688</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="gray_box">
					<div class="t_part">
						<p>商品总金额：￥5688.00</p>
						<p>
							+ 运费：￥<label id="freightFee">20.00</label>
						</p>
					</div>
					<p>
						订单支付金额：<span class="red2">￥<label id="order_amount">5702.00</label></span>
					</p>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp" />
		<jsp:include page="../footer.jsp" />
	</div>

</body>
</html>
