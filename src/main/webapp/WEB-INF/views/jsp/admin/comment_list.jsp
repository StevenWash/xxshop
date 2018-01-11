<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
			<div class="headbar">
				<div class="field">
					<table class="list_table">
						<col width="40px" />
						<col width="150px" />
						<col />
						<col width="160px" />
						<col width="95px" />
						<thead>
							<tr role="head">
								<th>序号</th>
								<th>评价人</th>
								<th>评价商品</th>
								<th>评价时间</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<form method="post" name="comment_list">
				<div class="content">
					<table id="list_table" class="list_table">
						<col width="40px" />
						<col width="150px" />
						<col />
						<col width="160px" />
						<col width="100px" />
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="">谭岚</a></td>
								<td><a href="" target="_blank">苹果（Apple）iPhone 6
										(A1586) 16GB 金色 移动联通电信4G手机</a></td>
								<td>2015-05-03 10:52:33</td>
								<td><a href="admin/comment_view.jsp"><img class="operator"
										src="images/admin/icon_check.gif" alt="查看" /></a> <a
									href="javascript:void(0)" onclick=""><img class="operator"
										src="images/admin/icon_del.gif" alt="删除" /></a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>

		</div>
		<div id="separator"></div>
	</div>

</body>
</html>
