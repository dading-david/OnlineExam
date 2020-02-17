<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

    <link href="${pageContext.request.contextPath}/assets/css/table-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<style>
    th{
        text-align: center;
    }
    a{
        padding-right: 8px;
    }
    td{
        word-wrap:break-word;
        text-align: center;
    }
</style>

<body>

<section id="container" >
    <header class="header black-bg">
        <a href="index.html" class="logo"><b>在线考试</b></a>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="login.html">登录</a></li>
            </ul>
        </div>
    </header>



    <section id="main-content">
        <section class="wrapper">
            <div style=""><h3>2016下半年JAVA期末考试</h3></div>
            <div class="row mt">
                <div class="col-lg-10 col-md-10 col-sm-12 mb">
                    <div class="content-panel">
                        <div style="padding-bottom: 20px;">
                            <h4><strong>第1题</strong></h4>
                            <div style="padding: 0px 10px;">
                                <strong>
                          <span style="padding-left:15px; font-size: 17px;">
                            给定关系模式R（A，B，C，D，E），S（D，E，F，G）和π1,2,4,6（R ?S），经过自然连接和投影运算后的属性列数分别为
                          </span><br>
                                </strong>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>A.</strong>9和4<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>B.</strong>7和4<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>C.</strong>9和7<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                           <strong>D.</strong>7和7<br>
                          </span>
                                <div style="background-color: #FFD777; height: 25px; font-size: 20px;padding:0 25px;">
                                    选项：
                                    <input type="radio" name="myanswer" value="A">A &nbsp
                                    <input type="radio" name="myanswer" value="B">B &nbsp
                                    <input type="radio" name="myanswer" value="C">C &nbsp
                                    <input type="radio" name="myanswer" value="D">D &nbsp
                                </div>
                            </div>
                        </div>

                        <div>
                            <h4><strong>第2题</strong></h4>
                            <div style="padding: 0px 10px;">
                                <strong>
                          <span style="padding: 0px 15px; font-size: 17px;">
                            给定关系模式R（A，B，C，D，E），S（D，E，F，G）和π1,2,4,6（R ?S），经过自然连接和投影运算后的属性列数分别为
                          </span><br>
                                </strong>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>A.</strong>9和4<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>B.</strong>7和4<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                            <strong>C.</strong>9和7<br>
                          </span>
                                <span style="padding: 0 25px; font-size: 20px;">
                           <strong>D.</strong>7和7<br>
                          </span>
                                <div style="background-color: #FFD777; height: 25px; font-size: 20px;padding:0 25px;">
                                    选项：
                                    <input type="radio" name="myanswer" value="A">A &nbsp
                                    <input type="radio" name="myanswer" value="B">B &nbsp
                                    <input type="radio" name="myanswer" value="C">C &nbsp
                                    <input type="radio" name="myanswer" value="D">D &nbsp
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div><!-- /row -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>


        </section><! --/wrapper -->
    </section><!-- /MAIN CONTENT -->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="${pageContext.request.contextPath}/assets/js/common-scripts.js"></script>

<!--script for this page-->


</body>
</html>
