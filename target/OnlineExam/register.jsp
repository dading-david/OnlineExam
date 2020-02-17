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
<script src="${pageContext.request.contextPath}/assets/jsjs/jquery-3.3.1.min.js"></script>
<script>
    $(function () {
        $("#username").blur(function () {
            var name = $("#username").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/login/checkName",
                type:"post",
                //contentType:"application/x-www-form-urlencoded",
                data:{"username":name},
                dataType:"text",
                success:function (data) {
                    if(data == null || "" ==data.trim()){
                        $("#msg2 ").remove();
                        $("#msg1 ").remove();
                        $("#username").after("<span id=\"msg1\" style=\"background-color: #8fde9c;font-weight: bold;\">"+"用户名可以使用"+"</span>");
                    }else{
                        $("#msg1").remove();
                        $("#msg2").remove();
                        $("#username").after("<span id=\"msg2\" style=\"background-color: #ff865c;font-weight: bold;\">"+"用户名已存在，请重新设置"+"</span>");
                    }
                }
            });
        });
        $("#pwd2").blur(function () {
           var pwd1 = $("#pwd1").val();
           var pwd2 = $("#pwd2").val();
           if(pwd1 != pwd2){
               $("#msg3").hide();
               $("#pwd2").after("<span id=\"msg3\" style=\"background-color: #ff865c;font-weight: bold;\">"+"两次密码请保持一致"+"</span>");
           }else {
               $("#msg3").hide();
           }
        });
        $("#pwd1").blur(function () {
            var pwd1 = $("#pwd1").val();
            var pwd2 = $("#pwd2").val();
            if(pwd1 == pwd2){
                $("#msg3").hide();
            }
        });
    });
    function check() {
        if($("#msg2").val()!= null){
        }else {
            $("form").submit();
        }
    }

</script>
<body>



<div id="login-page">
    <div class="container">

        <form class="form-login" action="${pageContext.request.contextPath}/login/register" method="post">
            <h2 style="background-color: #FFD777;font-weight: bold;" class="form-login-heading">学生账户注册</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" id="username" name="username" placeholder="用户ID" autofocus>
                <br>
                <input type="password" class="form-control" id="pwd1" name="password" placeholder="密码">
                <br>
                <input type="password" class="form-control" id="pwd2" name="password1" placeholder="再输入一次密码">
                <br>
                <button class="btn btn-warning btn-block" type="button" onclick="check();"><i class="fa fa-lock"></i> 注册</button>
                <hr>
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
