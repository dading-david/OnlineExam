<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>在线考试</b></a>
        <!--logo end-->
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="${pageContext.request.contextPath}/login.jsp">退出</a></li>
            </ul>
        </div>
    </header>

    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href=""><img src="${pageContext.request.contextPath}/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered"><span id="person" name="person">${teacher.teacherName} 老师</span></h5>
                <li class="mt">
                    <a href="">
                        <i class="fa fa-dashboard"></i>
                        <span>我的试卷</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="${pageContext.request.contextPath}/testpaper/findAllPaper" >
                        <i class="fa fa-desktop"></i>
                        <span>全部试卷</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="${pageContext.request.contextPath}/questionbank/showQuestionBank?teacherName=${teacher.teacherName}" >
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
            <h3>全部试卷</h3>
            <div class="row mt">
                <div class="col-lg-12 col-xs-12">
                    <div class="content-panel">
                        <h4><a href="${pageContext.request.contextPath}/testpaper/addpaperjsp" style="display:block;background-color:#ffd777;width:80px;line-height:30px;border-radius:6px;color:#6C6C6C">新增试卷</a></h4>
                        <table class="table table-bordered table-striped table-condensed" width="500px" style="table-layout:fixed ; ">
                            <thead>
                            <tr style="background-color: #ffd777;font-size: 16px;">
                                <th width="7%">编号</th>
                                <th width="23%">试卷标题</th>>
                                <th width="15%">开始时间</th>
                                <th width="15%">考试时长</th>
                                <th width="15%">试卷类型</th>
                                <th width="25%">操作</th>

                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pages.list}" var="testpaper" varStatus="s">
                                    <tr>
                                        <td width="100px">${s.count}</td>
                                        <td>${testpaper.tpName}</td>
                                        <td><fmt:formatDate value="${testpaper.tpStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>${testpaper.tpTimeLength}</td>
                                        <td>${testpaper.tpType}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/testpaper/lookPaper?tpId=${testpaper.tpId}&_currentPage=${pages.currentPage}&tpName=${testpaper.tpName}">查看试卷</a>
                                            <a href="${pageContext.request.contextPath}/questionbank/addquestionBank?tpId=${testpaper.tpId}&_currentPage=${pages.currentPage}">放入题库</a>
                                            <a href="${pageContext.request.contextPath}/testpaper/deletepaper?tpId=${testpaper.tpId}&_currentPage=${pages.currentPage}">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><!-- /content-panel -->
                </div><!-- /col-lg-4 -->
            </div><!-- /row -->

            <div class="row mt" style="">
                <div class="col-lg-12 col-xs-12">
                    <nav aria-label="Page navigation" style="text-align: center">
                        <ul class="pagination">
                            <%--当前页如果是1时，不能点击上一页 start--%>
                            <c:if test="${pages.currentPage == 1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pages.currentPage > 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/testpaper/findAllPaper?_currentPage=${pages.currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <%--end--%>

                            <%--遍历页数--%>
                            <c:forEach begin="1" end="${pages.totalPage}" var="i">
                                <%--当前页，页号呈现颜色 start--%>
                                <c:if test="${pages.currentPage == i}">
                                    <li  class="active">
                                        <a href="${pageContext.request.contextPath}/testpaper/findAllPaper?_currentPage=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pages.currentPage != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/testpaper/findAllPaper?_currentPage=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <%--end--%>
                            </c:forEach>

                            <%--如果当前是最后一页，不能点击下一页 start--%>
                            <c:if test="${pages.currentPage == pages.totalPage}">
                                <li class="disabled">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pages.currentPage < pages.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/testpaper/findAllPaper?_currentPage=${pages.currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <%--end--%>
                        </ul>
                    </nav>
                </div>
            </div>

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
