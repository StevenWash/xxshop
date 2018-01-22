<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="searchbar">
	<div class="allsort">
		<a href="javascript:void(0);">全部商品分类</a>

		<!--总的商品分类-开始-->
		<ul class="sortlist" id="div_allsort" style='display: none'>
			<c:forEach items="${categories}" var="category">
				<li>
					<h2>
						<a href="./goods/listByCate?goodsCategoryId=${category.id }">${category.name}</a>
					</h2>
				</li>
			</c:forEach>

		</ul>
	</div>

	<div class="searchbox">
		<!--此处未定义action-->
		<form method='get' action=''>
			<input type='hidden' name='controller' value='site' /> <input
				type='hidden' name='action' value='search_list' /> <input
				class="text" type="text" name='word' autocomplete="off"
				value="输入关键字..." /> <input class="btn" type="submit" value="商品搜索"
				onclick="checkInput('word','输入关键字...');" />
		</form>

	</div>
	<div class="hotwords">热门搜索：</div>
</div>

<script>
	$(function() {
		$(".allsort").hover(function() {
			$('#div_allsort').show();
		}, function() {
			$('#div_allsort').hide();
		});
	});
</script>