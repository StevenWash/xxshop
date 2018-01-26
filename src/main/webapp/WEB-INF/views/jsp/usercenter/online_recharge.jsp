<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<base href="${base}/" />
<title>在线充值_${site}</title>
<jsp:include page="../base.jsp" />
<script type="text/javascript">
$(function(){
	setSelectedClass("usercenter/online_recharge.jsp");
});
</script>
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
					<label class="current"><span>在线充值</span></label>
				</div>
				<div class="form_content">
					<form action='./user/recharge'
						method='post'>
						<table class="border_table" cellpadding="0" cellspacing="0"
							width='100%'>
							<col width="200px" />
							<col />
							<tr>
								<th>充值金额：</th>
								<td><input type='text' class="small" name="recharge"
									 alt='请输入充值的金额' /><label>请输入充值的金额</label></td>
							</tr>

							<tr>
								<th>选择充值方式：</th>
								<td><label class='attr'><input class="radio"
										name="payment_id" title="支付宝" type="radio" value="7" />支付宝</label>
									，手续费：0.00% <br /></td>
							</tr>

							<tr>
								<th></th>
								<td><label class="btn"><input type="submit"
										value="确定充值" onclick='return check_form();' /></label></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../help.jsp"></jsp:include>
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>
