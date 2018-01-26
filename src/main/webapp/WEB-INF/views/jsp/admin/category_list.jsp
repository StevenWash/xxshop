<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />

<%--<link href="js/bootstrap-3.3.4-dist/css/bootstrap.min.css"--%>
	<%--rel="stylesheet">--%>
<%--<script src="js/bootstrap-3.3.4-dist/jquery-2.1.4.min.js"></script>--%>
<%--<script src="js/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript">
	function delCategory(id) {
		if(confirm("您确认要删除该商品种类？")){
		    location.href="./category/delete?categoryId="+id;
		}
    }
</script>

</head>
<body>
	<div class="container1">
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
						<col width="50px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<thead>
							<tr>
								<th>序号</th>
								<th>分类名称</th>
								<th>商品数量</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<div class="content1">
				<table id="list_table" class="list_table">
					<col width="50px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<tbody>
						<c:forEach items="${categories}" var="category" varStatus="s">
							<tr>
								<td>${s.count}</td>
								<td>${category.name}</td>
								<td>${category.goodsNum}</td>
								<td><a class="update" data-update="${category.id}"
										data-toggle="modal" data-target="#myModal">
										<img class="operator" src="images/admin/icon_edit.gif" alt="修改"
										title="修改" /></a>
									<a href="javascript:void(0)" onclick="delCategory('${category.id}')">
										<img class="operator" src="images/admin/icon_del.gif" alt="删除" title="删除" /></a></td>
									<%--<a href="./category/delete?categoryId=${category.id}"><img--%>
										<%--class="operator" src="images/admin/icon_del.gif" alt="删除"--%>
										<%--title="删除" /></a></td>--%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<div id="separator"></div>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改商品类别</h4>
				</div>
				<div class="modal-body">
					<div style="padding: 10px 100px 10px;">
						<form id="updateCategoryForm" action="./category/refresh"
							class="bs-example bs-example-form" role="form">
							<div class="input-group">
								<span class="input-group-addon">商品类别</span>
								<input id="updateCategory" type="text" class="form-control"
									name="category.name"> <label id="catemsg"></label>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">提交更改</button>
							</div>
						</form>
					</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
</body>

<script type="text/javascript" src="js/jquery.validate-1.13.1.js"></script>
<script type="text/javascript">
	var categoryId = "";
	$(document).ready(function() {
		$(".update").bind("click", function() {
			categoryId = $(this).attr("data-update");
			var updateCategory = $("#updateCategory").val();
			$("#updateCategoryForm").validate({
				rules : {
					"category.name" : {
						required : true,
						remote : {
							url : "./category/update?categoryId=" + categoryId,
							type : "post",
						}
					}
				},
				messages : {
					"category.name" : {
						required : "必须填写种类",
						remote : "修改的种类信息已存在"
					}
				},
				submitHandler : function(r) {
					r.submit();
				}
			});
		})
	});
</script>

</html>
