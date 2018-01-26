<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"></meta>
	<base href="${base}/" />
	<title>地址管理_${site}</title>
	<jsp:include page="../base.jsp" />
	<link rel="stylesheet" type="text/css" href="css/index.css" />
	<script type="text/javascript" language="JavaScript">
        $(function() {
            <%--$("#oldpass").on("blur", function() {--%>
                <%--var oldpass=$("#oldpass").val();--%>
                       <%--if (${sessionScope.user.password}=$("#oldpass").val()){--%>
                           <%--$("#namemsg").html("密码正确");--%>
                       <%--} else {--%>
                           <%--$("#namemsg").html("密码错误");--%>
                           <%--/*设置提交按钮不可用*/--%>
                           <%--$("#submit").attr("disabled",false);--%>
                       <%--}--%>

            <%--});--%>


            $("#email").on("blur", function() {
                var email=$("#email").val();
                if(email!=null){
                    $("#submit").attr("disabled",false);
                }
            });

            // $("#oldpassword").on("blur", function() {
             //    var oldpass=$("#oldpassword").val();
             //    $.get("user_isexist?user.password=" + oldpass.val(), function(r) {
             //        if (r=="true"){
             //            $("#namemsg").html("密码正确");
             //        } else {
             //            $("#namemsg").html("密码错误");
             //            /*设置提交按钮不可用*/
             //            $("#submit").attr("disabled",);
             //        }
             //    });
			// });

            $("#password").on("blur", function() {
                var password=$("#password").val();
                /*用于检验的正则表达式：只能为字母，数字，下划线*/
                var regex1=/^[A-Za-z0-9]*[a-z0-9_]*$/;
                if(password.length<5 || password.length>20||!regex1.test(password)){
                    $("#passmsg").html("请填写正确的密码格式，长度为6-20之间，且只能为字母、数字或下划线");
                    /*设置提交按钮不可用*/
                    $("#submit").attr("disabled",true);
                }else{
                    $("#passmsg").html("密码格式正确");

                    $("#repassword").on("blur", function() {
                        var repassword=$("#repassword").val();

                        if(password==repassword){
                            $("#repassmsg").html("密码验证成功");
                            $("#submit").attr("disabled",false);
                        }else{
                            /*设置提交按钮不可用*/
                            $("#submit").attr("disabled",true);
                            $("#repassmsg").html("与上面的密码不一致，请重新输入");
                            $("#repassword").val("");

                        }
                    });
                }
            });

            $("#phonenum").on("blur", function() {
                /*用于检验的正则表达式：只能为字母，数字，下划线*/
                var regex=/^[1][3578][0-9]*$/;
                //var re=new RegExp(reex);
                var phonenum=$("#phonenum").val();
                if (phonenum.length!=11) {
                    $("#phonemsg").html("格式错误! 请输入11为的手机号码!");
                    /*设置提交按钮不可用*/
                    $("#submit").attr("disabled",true);
                }else{
                    $("#phonemsg").html("手机号码验证成功!");
                    /*设置提交按钮不可用*/
                    $("#submit").attr("disabled",false);
                }
            });

        });
	</script>

	<%--<script type="text/javascript">--%>
		<%--$(function failed() {--%>
			<%--alert("原始密码输入错误，修改失败……");--%>
        <%--})--%>
	<%--</script>--%>

</head>
<body class="index">
<div class="ucenter container">
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../navbar.jsp"></jsp:include>
	<jsp:include page="../search.jsp"></jsp:include>
	<div class="wrapper clearfix">
		<jsp:include page="left.jsp"></jsp:include>
		<div class="main f_r">
			<div class='tabs'>
				<div class="uc_title m_10 tabs_menu">
					<label class="current node"><span>个人设置</span></label>
				</div>
				<div class='tabs_content'>
					<div id="address_list" class="form_content m_10 node">
						<div class="uc_title2 m_10">
							<strong>个人信息</strong>
						</div>
						<%-- 修改用户信息 --%>
						<div class="orange_box" id='address_form'>
							<form action='./user/update' method='post' name='form'>
								<table class="form_table" width="100%" cellpadding="0"
									   cellspacing="0">
									<col width="120px" />
									<col />
									<caption>个人信息修改</caption>

									<tr>
										<th>填写邮箱：</th>
										<td><input class="gray" type="email" id="email"
												   name='email' tabindex="2" value="${user.email}" /><label id="emailmsg">填写有效邮箱</label></td>
									</tr>
									<tr>
										<th>手机号码：</th>
										<td><input class="gray" name='phoneNum' type="text"
												   id="phonenum" tabindex="4" value="${user.phoneNum}"><label id="phonemsg">请填写11位有效手机号</label></td>
									</tr>
									<tr>
										<th>旧密码：</th>
										<td><input class="gray" type="password" id="oldpass"
												   name='oldpass' tabindex="2" /><label>如要修改密码，请填写原密码</label></td>
									</tr>
									<tr>
										<th>设置密码：</th>
										<td><input class="gray" type="password" id="password"
												   name='password' tabindex="2" /><label id="passmsg">填写登录密码，6-32个字符</label></td>
									</tr>
									<tr>
										<th>确认密码：</th>
										<td><input class="gray" type="password" name='repassword'
												   id="repassword" tabindex="3" /><label id="repassmsg">重复上面所填写的密码</label></td>
									</tr>
									<tr>
										<th></th>
										<td><label class="btn">
											<input type="submit" id="submit"
												   disabled="disabled" value="保存" /></label></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page="../help.jsp"></jsp:include>
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
