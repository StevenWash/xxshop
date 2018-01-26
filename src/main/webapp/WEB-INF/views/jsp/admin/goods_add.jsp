<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html >
<html>
<head>
<base href="${base}/" />
<title>后台管理</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/admin.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
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
					<%--<form action="./goods/addoper" method="post" enctype="multipart/form-data">--%>
					<form action="./goods/addoper" method="post" enctype="multipart/form-data">
						<div id="table_box_1">
							<table class="form_table">
								<colgroup>
									<col width="150px">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>商品名称：</th>
										<td><input class="normal" name="name" type="text" value="">
											<label>*</label></td>
									</tr>
									<tr>
										<th>所属分类：</th>
										<td><select name="categoryId">
												<c:forEach items="${categories}" var="category">
													<option value="${category.id}">${category.name}</option>
												</c:forEach>

										</select></td>
									</tr>
									<tr>
										<th>基本数据：</th>
										<td>
											<div class="con">
												<table class="border_table">
													<thead id="goodsBaseHead">
														<tr>
															<th>商品货号</th>
															<th>库存</th>
															<th>市场价格</th>
															<th>销售价格</th>
														</tr>
													</thead>
													<tbody id="goodsBaseBody">
														<tr class="td_c">
															<td><input class="small" name="goodsNo"
																type="text" value="${goodsNo}" readonly /></td>
															<td><input class="tiny" name="stock"
																type="text"></td>
															<td><input class="tiny" name="price1"
																type="text"></td>
															<td><input class="tiny" name="price2"
																type="text"></td>
														</tr>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<tr>
										<th>缩略图：</th>
										<%--<td><input type="file" name="thumbnail" /></td>--%>
										<td><input type="file" name="pic"
												   accept="image/jpeg,image/jpg,image/png"/></td>
									</tr>
									<tr>
										<th>设置热度：</th>
										<td><input type="text" name="role" /></td>
									</tr>
									<tr>
										<th>设置新度：</th>
										<td><input type="text" name="sellTime" /></td>
									</tr>
									<tr>
										<th>产品描述：</th>
										<td><textarea rows="5" cols="5" name="description"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<table class="form_table">
							<colgroup>
								<col width="150px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td></td>
									<td><button class="submit" type="submit">
											<span>发布商品</span>
										</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div id="separator"></div>
	</div>
</body>
</html>