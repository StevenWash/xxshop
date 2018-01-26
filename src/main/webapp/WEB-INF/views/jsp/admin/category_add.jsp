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
					<form id="categoryForm" action="./category/add" method="post">
						<table class="form_table" cellpadding="0" cellspacing="0">
							<col width="150px" />
							<col />
							<tr>
								<th>分类名称：</th>
								<td><input id="categoryName" class="normal"
									name="categoryName" type="text" value=""><label
									id="catemsg"></label></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="submit" type="submit">
										<span>确 定</span>
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
