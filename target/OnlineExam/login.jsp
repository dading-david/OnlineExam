<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style-responsive.css" rel="stylesheet">

</head>

<body>



<div id="login-page">
    <div class="container">

        <form class="form-login" action="${pageContext.request.contextPath}/login/loginIdentity" method="post">
            <h2 style="background-color: #FFD777;font-weight: bold;" class="form-login-heading">在线考试登录</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" name="username" placeholder="用户ID" autofocus>
                <br>
                <input type="password" class="form-control" name="password" placeholder="密码">
                <br>
                <c:if test="${msg != null}">
                    <span style="background-color: #ff865c;font-weight: bold;">${msg}</span>
                    <br>
                </c:if>
                <input type="radio"  name="identical"  checked="checked" value="学生登录">学生登录 &nbsp
                <input type="radio"  name="identical" value="老师登录">老师登录 &nbsp
                <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> 忘记密码?</a>

		                </span>
                </label>
                <button class="btn btn-warning btn-block" type="submit"><i class="fa fa-lock"></i> 登录</button>
                <hr>

                <div class="registration">
                    <a class="" href="${pageContext.request.contextPath}/register.jsp">
                        学生注册
                    </a>
                </div>

            </div>

        </form>

    </div>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.backstretch.min.js"></script>



</body>
</html>
