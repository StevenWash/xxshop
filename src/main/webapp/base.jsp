<%@ page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/shopcar.js"></script>
<script type="text/javascript" src="js/template.js"></script>
<script type="text/javascript">
	 //用于用户中心左边菜单栏的选择项的样式
	function setSelectedClass(url){
		 $('div.cont ul.list li a[href~="'+url+'"]').parent().addClass("current");
	} 
</script>