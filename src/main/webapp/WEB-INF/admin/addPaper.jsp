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
        <a href="" class="logo"><b>在线考试</b></a>
        <!--logo end-->
    </header>

    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href=""><img src="${pageContext.request.contextPath}/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered"><span id="person" name="person">某某管理员</span></h5>

                <li class="mt">
                    <a href="">
                        <i class="fa fa-dashboard"></i>
                        <span>后台</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="listExam.jsp" >
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
            <h3><i class="fa fa-angle-right"></i> 添加试卷</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="form-panel">
                        <form class="form-horizontal style-form" action="${pageContext.request.contextPath}/testpaper/addpaper" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">试卷标题</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="tpName" name="tpName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">截止时间</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="yyyy-MM-dd HH:mm:ss" id="tpStartTime" name="tpStartTime">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">考试时长（分钟）</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" placeholder="xxx" id="tpTimeLength" name="tpTimeLength">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">试卷类型</label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="tpType" name="tpType">
                                        <option>Java</option>
                                        <option>语文</option>
                                        <option>数学</option>
                                        <option>英语</option>
                                        <option>C++</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-theme" style="margin-left: 120px">添加</button>
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
