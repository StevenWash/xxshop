<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
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
			<div class="content_box">
				<div class="content form_content">
					<form id="categoryForm" action="./admin/memberUpdateOper?memberId=${member.id}" method="post">
						<table class="form_table" cellpadding="0" cellspacing="0">
							<col width="150px" />
							<col />

							<tr>
								<th>会员号：</th>
								<td>${member.id}</td>
							</tr>
							<tr>
								<th>用户名：</th>
								<td>${member.name}</td>
							</tr>
							<tr>
								<th>邮箱：</th>
								<td>${member.email}</td>
							</tr>
							<tr>
								<th>注册时间：</th>
								<td>${member.regTime}</td>
							</tr>
							<tr>
								<th>电话：</th>
								<td>${member.phoneNum}</td>
							</tr>
							<tr>
								<th>用户状态：</th>
								<td><input id="status" maxlength="1" size="3"
										   name="status" type="text" value="${member.status}">
									<label id="statusMsg">"0":下线 "1":在线 "2":已删除</label></td>
							</tr>
							<tr>
								<th>用户身份：</th>
								<td><input id="role" maxlength="1" size="3"
											name="role" type="text" value="${member.role}">
									<label id="roleMsg">"u":一般会员 "1":管理员</label></td>
							</tr>
							<tr>
								<th>密码：</th>
								<td><input id="password" maxlength="32" size="20"
									name="password" type="text" value="${member.password}"><label
									id="passwordMsg"></label></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="submit" type="submit">
										<span>确定修改</span>
									</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>

	<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
	<script type="text/javascript" src="js/jquery.validate-1.13.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var category = $("#categoryName").val();
			$("#categoryForm").validate({
				rules : {
					"category.name" : {
						required : true,
						remote : {
							url : "./category/isexist",
							type : "post",
						}
					}
				},
				messages : {
					"category.name" : {
						required : "必须填写种类",
						remote : "类型已存在"
					}
				},
				submitHandler : function(r) {
					r.submit();
				}

			});
		});
	</script>
</body>
</html>
