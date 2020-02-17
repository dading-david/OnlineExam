<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <p class="centered"><a href="profile.html"><img src="${pageContext.request.contextPath}/assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">${stuName} 同学</h5>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-desktop"></i>
                        <span>试卷列表</span>
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
                        <span>个人信息</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>

    <section id="main-content">
        <section class="wrapper">
            <div style="text-align: center;"><h2>试卷列表</h2><h3>共${pages.totalCount}套</h3></div>
            <div class="row mt">
                <c:forEach items="${pages.list}" var="plist" varStatus="s">
                    <div class="col-lg-4 col-md-4 col-sm-4 mb">
                        <form action="${pageContext.request.contextPath}/student/findByAPaper" method="post">
                            <div class="content-panel" style="text-align: center;">
                                <input type="hidden" value="${plist.tpId}" name="tpId">
                                <div><h3><input type="hidden" value="${plist.tpName}" name="tpName">${plist.tpName}</h3></div>
                                <div><h4>截止时间：<fmt:formatDate value="${plist.tpStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h4></div>
                                <div><h4>考试时长：${plist.tpTimeLength}分钟</h4></div>
                                <button type="submit" class="btn btn-theme02">开始考试</button>
                                <p style="padding-top: 10px">
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div><!-- /row -->
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
                            <a href="${pageContext.request.contextPath}/student/findAllPaper?_currentPage=${pages.currentPage - 1}" aria-label="Previous">
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
                                <a href="${pageContext.request.contextPath}/student/findAllPaper?_currentPage=${i}">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${pages.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/student/findAllPaper?_currentPage=${i}">${i}</a>
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
                            <a href="${pageContext.request.contextPath}/student/findAllPaper?_currentPage=${pages.currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <%--end--%>
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
