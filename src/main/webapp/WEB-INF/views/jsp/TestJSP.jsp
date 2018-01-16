<%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 13/01/2018
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Still NULL!!!</h2>
<c:if test="${goods==null}">
    <h2>goods = null</h2>
</c:if>


</body>
</html>
