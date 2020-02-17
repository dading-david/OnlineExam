<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/bootstrap-daterangepicker/daterangepicker.css" />

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style-responsive.css" rel="stylesheet">
</head>



<body>

<section id="container" >
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>在线考试</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">4</span>
                    </a>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">5</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="login.html">登录</a></li>
            </ul>
        </div>
    </header>

    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href="profile.html"><img src="${pageContext.request.contextPath}/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">某某管理员</h5>

                <li class="mt">
                    <a href="index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>后台</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-desktop"></i>
                        <span>试卷</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-cogs"></i>
                        <span>题库</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-book"></i>
                        <span>成绩</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-tasks"></i>
                        <span>用户</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>

    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i> 完善试题</h3>
            <!-- BASIC FORM ELELEMNTS -->
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <h3>第 ${sessionScope.num} 题</h3>
                        <form id="addquestion" class="form-horizontal style-form" action="" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">题目</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="singleTitle">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">选项A</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="singleA">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">选项B</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="singleB">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">选项C</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="singleC">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">选项D</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="singleD">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">答案</label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="singleAnswer">
                                        <option>A</option>
                                        <option>B</option>
                                        <option>C</option>
                                        <option>D</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">试题解析</label>
                                <div class="col-sm-3">
                                    <textarea class="col-sm-12 col-sm-12" rows="5" cols="40" name="singleAnalyze"></textarea>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-theme" style="margin-left: 120px" onclick="javascript:this.form.action='${pageContext.request.contextPath}/testpaper/addQuestion';">添加试题</button>
                            <button type="submit" class="btn btn-theme" style="margin-left: 105px" onclick="javascript:this.form.action='${pageContext.request.contextPath}/testpaper/finish';">提交试卷</button>
                        </form>
                    </div>
                </div><!-- col-lg-12-->
            </div><!-- /row -->
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
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui-1.9.2.custom.min.js"></script>

        <!--custom switch-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap-switch.js"></script>

        <!--custom tagsinput-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.tagsinput.js"></script>

        <!--custom checkbox & radio-->

        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="${pageContext.request.contextPath}/assets/js/form-component.js"></script>




</body>
</html>
