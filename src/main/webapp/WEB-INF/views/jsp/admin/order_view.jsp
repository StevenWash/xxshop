<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
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
			<div id="tab-1" name="table">
				<div class="content">
					<table class="list_table">
						<col width="550px" />
						<col width="100px" />
						<col width="100px" />
						<col />
						<thead>
							<tr>
								<th>商品名称</th>
								<th>价格</th>
								<th>商品数量</th>
								<th>小计</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>苹果（Apple）iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机</td>
								<td>4888.00</td>
								<td>1</td>
								<td>4888</td>
							</tr>
						</tbody>
					</table>

					<table style="width:300px;margin-right:20px;"
						class="border_table f_l">
						<col width="80px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">订单信息</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>商品总额:</th>
								<td>￥4888.00</td>
							</tr>
							<tr>
								<th>配送费用:</th>
								<td>￥20.00</td>
							</tr>
							<tr>
								<th>订单总额:</th>
								<td>￥4908.00</td>
							</tr>
							<tr>
								<th>已支付金额:</th>
								<td>￥4908.00</td>
							</tr>
							<tr>
								<th>配送方式:</th>
								<td>快递</td>
							</tr>
							<tr>
								<th>支付方式:</th>
								<td>预存款支付</td>
							</tr>
						</tbody>
					</table>

					<table style="width:300px;margin-right:20px;"
						class="border_table f_l">
						<col width="80px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">收货人信息</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>发货日期:</th>
								<td></td>
							</tr>
							<tr>
								<th>姓名:</th>
								<td>谭岚</td>
							</tr>
							<tr>
								<th>电话:</th>
								<td></td>
							</tr>
							<tr>
								<th>手机 :</th>
								<td>15982352915</td>
							</tr>
							<tr>
								<th>地区:</th>
								<td>四川省&nbsp;成都市&nbsp;青羊区</td>
							</tr>
							<tr>
								<th>地址:</th>
								<td>石人南路31</td>
							</tr>
							<tr>
								<th>邮编:</th>
								<td></td>
							</tr>
							<tr>
								<th>送货时间:</th>
								<td>任意</td>
							</tr>
						</tbody>
					</table>

					<table style="width:300px;margin-right:20px;"
						class="border_table f_l">
						<col width="80px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">商城用户信息</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>用户名:</th>
								<td>谭岚</td>
							</tr>
							<tr>
								<th>Email:</th>
								<td>tanlan@qq.com</td>
							</tr>
							<tr>
								<th>注册时间:</th>
								<td>2015-05-01 21:22:40</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-2" name="table" style="display:none">
				<div class="content">
					<table style="width:45%;margin-right:20px;"
						class="border_table f_l">
						<col width="120px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">收款单据</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>时间：</th>
								<td>2015-05-02 22:23:55</td>
							</tr>
							<tr>
								<th>金额：</th>
								<td>4908.00</td>
							</tr>
							<tr>
								<th>支付方式：</th>
								<td>预存款支付</td>
							</tr>
							<tr>
								<th>状态：</th>
								<td>支付完成</td>
							</tr>
						</tbody>
					</table>

					<table style="width:45%;margin-right:20px;"
						class="border_table f_l">
						<col width="120px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">退款单据列表</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan='2'>暂无数据</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-3" name="table" style="display:none">
				<div class="content">
					<table style="width:98%" class="border_table">
						<col width="200px" />
						<col />
						<thead>
							<tr>
								<th colspan="2">发货单据列表</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">暂无数据</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-4" name="table" style="display:none">
				<div class="content">
					<table width="98%" class="border_table">
						<col width="250px" />
						<col />
						<thead>
							<tr>
								<th>方案</th>
								<th>优惠内容</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan='2'>暂无数据</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-5" name="table" style="display:none">
				<div class="content">
					<div class="content form_content">
						<form name="ModelForm"
							action="/iwebshop/index.php?controller=order&action=order_note"
							method="post">
							<input type="hidden" name="order_id" value="1" /> <input
								type="hidden" name="tab" value="6" />
							<table class="form_table">
								<col width="150px" />
								<col />
								<tbody>
									<tr>
										<th>订单备注:</th>
										<td align="left"><textarea name="note" id="note" rows="8"
												cols="100"></textarea></td>
									</tr>
									<tr>
										<td></td>
										<td align="left"><button type="submit" class="submit">
												<span>保存</span>
											</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>

			<div id="tab-6" name="table" style="display:none">
				<div class="content">
					<table class="border_table" style='width:98%'>
						<colgroup>
							<col width="200px">
							<col width="150px">
							<col width="150px">
							<col width="100px">
							<col />
						</colgroup>
						<thead>
							<tr>
								<th>时间</th>
								<th>操作人</th>
								<th>动作</th>
								<th>结果</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>

			<div id="tab-7" name="table" style="display:none">
				<div class="content">
					<div class="content form_content">
						<table class="form_table">
							<col width="150px" />
							<col />
							<tbody>
								<tr>
									<th>订单附言:</th>
									<td align="left">生日快乐</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="pages_bar">
				<div class="t_c" id="ctrlButtonArea">
					<button type="button" class="btn" id="to_pay" onclick="pay(1);">
						<span>支付</span>
					</button>
					<button type="button" class="btn" id="to_deliver"
						onclick="deliver(1);">
						<span>发货</span>
					</button>
					<button type="button" class="btn" id="to_refundment"
						onclick="refundment(1);">
						<span>退款</span>
					</button>
					<button type="button" class="btn" onclick="complete(1,5)">
						<span>完成</span>
					</button>
					<button type="button" class="btn" onclick="complete(1,4)">
						<span>作废</span>
					</button>
				</div>
			</div>

			<script type='text/javascript'>
				var pay_status = '1';

				//DOM加载完毕后运行
				$(function() {
					selectTab(1);
					initButton();
				});

				/**
				 * 订单操作按钮初始化
				 */
				function initButton() {
					//订单当前为活跃状态
					//付款按钮锁定 已经付过款
					$('#to_pay').attr('disabled', 'disabled');
					$('#to_pay').addClass('inactive');

					//发货按钮锁定 已经发过货

					//退款按钮锁定 未付款或者已经退款
					//订单当前为非活跃状态
				}

				//选择当前Tab
				function selectTab(curr_tab) {
					$("div[name='table']").hide();
					$("#tab-" + curr_tab).show();
					$("ul[name=menu1] > li").removeClass('selected');
					$('#li_' + curr_tab).addClass('selected');
				}

				//完成或作废订单
				function complete(id, statusVal) {
					if (pay_status == '0' && statusVal == '5') {
						alert('请先支付订单金额，再完成订单!');
						return false;
					}

					$
							.get(
									"/iwebshop/index.php?controller=order&action=order_complete",
									{
										'order_no' : "20150502222352850558",
										'type' : statusVal,
										'id' : id
									}, function(data) {
										if (data == 'success') {
											actionCallback();
										} else {
											alert('发生错误');
										}
									});
				}

				//退款
				function refundment(id) {
					var tempUrl = '/iwebshop/index.php?controller=order&action=order_refundment&id=@id@';
					tempUrl = tempUrl.replace('@id@', id);
					art.dialog.open(tempUrl, {
						id : 'refundment',
						cancelVal : '关闭',
						okVal : '退款',
						title : '订单号:20150502222352850558【退款到余额账户】',
						ok : function(iframeWin, topWin) {
							iframeWin.document.forms[0].submit();
							return false;
						},
						cancel : function() {
							return true;
						}
					});
				}

				//付款
				function pay(id) {
					var tempUrl = '/iwebshop/index.php?controller=order&action=order_collection&id=@id@';
					tempUrl = tempUrl.replace('@id@', id);

					art.dialog.open(tempUrl, {
						id : 'pay',
						title : '订单号:20150502222352850558【付款】',
						cancelVal : '关闭',
						okVal : '付款',
						ok : function(iframeWin, topWin) {
							iframeWin.document.forms[0].submit();
							return false;
						},
						cancel : function() {
							return true;
						}
					});
				}

				//发货
				function deliver(id) {
					var tempUrl = '/iwebshop/index.php?controller=order&action=order_deliver&id=@id@';
					tempUrl = tempUrl.replace('@id@', id);

					var deliv = art.dialog.open(tempUrl, {
						id : 'deliver',
						title : '订单号:20150502222352850558【发货】',
						cancelVal : '关闭',
						okVal : '发货',
						ok : function(iframeWin, topWin) {
							iframeWin.document.forms[0].submit();
							return false;
						},
						cancel : function() {
							return true;
						}
					});
				}

				//执行回调处理
				function actionCallback() {
					window.location.reload();
				}

				//操作失败回调
				function actionFailCallback() {
					alert('操作失败');
				}
			</script>

		</div>
		<div id="separator"></div>
	</div>

	<script type='text/javascript'>
		//DOM加载完毕执行
		$(function() {
			//隔行换色
			$(".list_table tr:nth-child(even)").addClass('even');
			$(".list_table tr").hover(function() {
				$(this).addClass("sel");
			}, function() {
				$(this).removeClass("sel");
			});

			//后台菜单创建
			var data = [
					{
						"current" : false,
						"title" : "商品",
						"link" : "\/iwebshop\/index.php?controller=goods&action=goods_list"
					},
					{
						"current" : false,
						"title" : "会员",
						"link" : "\/iwebshop\/index.php?controller=member&action=member_list"
					},
					{
						"current" : true,
						"title" : "订单",
						"link" : "\/iwebshop\/index.php?controller=order&action=order_list",
						"list" : {
							"订单管理" : {
								"\/iwebshop\/index.php?controller=order&action=order_list" : {
									"name" : "订单列表",
									"urlPathinfo" : "\/order\/order_list"
								},
								"\/iwebshop\/index.php?controller=order&action=order_edit" : {
									"name" : "添加订单",
									"urlPathinfo" : "\/order\/order_edit"
								}
							},
							"单据管理" : {
								"\/iwebshop\/index.php?controller=order&action=order_collection_list" : {
									"name" : "收款单",
									"urlPathinfo" : "\/order\/order_collection_list"
								},
								"\/iwebshop\/index.php?controller=order&action=order_refundment_list" : {
									"name" : "退款单",
									"urlPathinfo" : "\/order\/order_refundment_list"
								},
								"\/iwebshop\/index.php?controller=order&action=order_delivery_list" : {
									"name" : "发货单",
									"urlPathinfo" : "\/order\/order_delivery_list"
								},
								"\/iwebshop\/index.php?controller=order&action=refundment_list" : {
									"name" : "退款申请列表",
									"urlPathinfo" : "\/order\/refundment_list"
								}
							},
							"发货信息" : {
								"\/iwebshop\/index.php?controller=order&action=ship_info_list" : {
									"name" : "发货信息管理",
									"urlPathinfo" : "\/order\/ship_info_list"
								}
							}
						}
					},
					{
						"current" : false,
						"title" : "营销",
						"link" : "\/iwebshop\/index.php?controller=market&action=pro_rule_list"
					},
					{
						"current" : false,
						"title" : "统计",
						"link" : "\/iwebshop\/index.php?controller=market&action=user_reg"
					},
					{
						"current" : false,
						"title" : "系统",
						"link" : "\/iwebshop\/index.php?controller=system&action=default"
					},
					{
						"current" : false,
						"title" : "工具",
						"link" : "\/iwebshop\/index.php?controller=tools&action=db_bak"
					} ];
			var current = '/order/order_show';
			var url = '/iwebshop/index.php';
			initMenu(data, current, url);
		});
	</script>
</body>
</html>
