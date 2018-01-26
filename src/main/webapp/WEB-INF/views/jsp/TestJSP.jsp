<%--
  Created by IntelliJ IDEA.
  User: yin
  Date: 13/01/2018
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        function testJSON() {
            var goodsId = "db9efbd7c28b4c279f0d1f7cc4dd32b1"
            $.ajax({
                // url : "{pageContext.request.contextPath }/testJSON",
                url: "./comment/getCommentsByGoodsId?goodsId=db9efbd7c28b4c279f0d1f7cc4dd32b1",
                type: "post",
                // data : JSON.stringify({goodsId:goodsId}), // data 表示发送的数据
                data: {"goodsId": goodsId}, // data 表示发送的数据
                contentType: "application/json;charset=UTF-8", // 定义发送请求的数据格式为JSON字符串
                dataType: "json", // 定义回调响应的数据格式为JSON字符串

                // 成功相应的结果
                success: function (data) { // data 对应Controller return的变量
                    let {comments} = data
                    var html = "";
                    // 此之所谓前台渲染
                    html += "<table><tr><th>user_id</th><th>comment</th><th>time</th></tr>";
                    for (var i = 0; i < comments.length; i++) {
                        console.log("here");
                        console.log(comments[i])
                        var ls = comments[i];
                        console.log(ls)
                        html += "<tr><td>" + ls.ownerid
                            + "</td><td>" + ls.comment
                            + "</td><td>" + ls.createtime + "</td></tr>";
                    }
                    html += "</table>";
                    // console.info();
                    console.log(html);
                    $("#ulul").html(html); //在html页面id=ulul的标签里显示html内容
                }

                // success : function(data) {
                //     if(data != null) {
                //         alert("您输入的用户名为:" + data.username +
                //             "密码为:" + data.password);
                //     }
                // }

            });
        }
    </script>
</head>

<body>
<h2>
    <form action="/testPOJOWithPoint" method="post">
        <input type="button" value="测试" onclick="testJSON()"/>
    </form>
</h2>

<ul id="ulul">
    <table>
        <tr>
            <th>name</th>
            <th>sex</th>
        </tr>
        <tr>
            <td>yinziang</td>
            <td>male</td>
        </tr>
    </table>
</ul>

<form action="./order/payTest" method="post">
    <input type="submit" value="发表" />
</form>



<form action="./comment/addComment" method="post">
    <textarea id="judgecontent" name="content"></textarea>
    <input type="hidden" name="targetId" value="db9efbd7c28b4c279f0d1f7cc4dd32b1" />
    <input type="hidden" name="statusNum" value="0" />
    <input type="submit" value="发表" />
</form>


<%--<h2>Still NULL!!!</h2>--%>
<%--<c:if test="${goods==null}">--%>
    <%--<h2>goods = null</h2>--%>
<%--</c:if>--%>

<%--<c:if test="${result==null}">--%>
    <%--<h2>result = null</h2>--%>
<%--</c:if>--%>
<%--<c:if test="${result!=null}">--%>
    <%--<h2>result != null</h2>--%>
<%--</c:if>--%>

</body>
</html>
