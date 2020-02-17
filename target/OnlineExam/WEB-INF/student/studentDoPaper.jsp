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
<script src="${pageContext.request.contextPath}/assets/jsjs/jquery-3.3.1.min.js"></script>
<script>
    $(function () {
        if(${TF != null}){

        }else {
            countDown();
        }


        var val0 = $("input[name ='select0']");
        var option0 = $("#option0").val();
        val0.each(function (i,e) {
            if ($(e).val() == option0){
                $(e).prop("checked",true);
                return false;
            }
        });

        var val1 = $("input[name ='select1']");
        var option1 = $("#option1").val();
        val1.each(function (i,e) {
            if ($(e).val() == option1){
                $(e).prop("checked",true);
                return false;
            }
        });
    });

    function temPaper(obj) {
        var currentPage = $(obj).text();                            //分页栏中选中的页数
        var num0 = $("#num0").html();
        var num1 = $("#num1").html();
        $("#currentPage").attr("value",currentPage);
        $("#tnum0").attr("value",num0);
        $("#tnum1").attr("value",num1);
        $("#doPaper").submit();
    }
    function leftbtn() {
        var currentPage = ${byAPaper.currentPage - 1};
        var num0 = $("#num0").html();
        var num1 = $("#num1").html();
        $("#currentPage").attr("value",currentPage);
        $("#tnum0").attr("value",num0);
        $("#tnum1").attr("value",num1);
        $("#doPaper").submit();
    }
    function rightbtn() {
        var currentPage = ${byAPaper.currentPage + 1};
        var num0 = $("#num0").html();
        var num1 = $("#num1").html();
        $("#currentPage").attr("value",currentPage);
        $("#tnum0").attr("value",num0);
        $("#tnum1").attr("value",num1);
        $("#doPaper").submit();
    }
    function submitanswer() {
        var path="${pageContext.request.contextPath}/student/submitanswer";
        var num0 = $("#num0").html();
        var num1 = $("#num1").html();
        $("#tnum0").attr("value",num0);
        $("#tnum1").attr("value",num1);
        $("#doPaper").attr("action",path).submit();
    }

    //倒计时
    function countDown() {
        $.ajax({
            url:"${pageContext.request.contextPath}/student/countDown",
            type:"post",
            dataType:"text",
            success:function (data) {
                if(data == null || "" ==data.trim()){
                    submitanswer();
                    alert("考试时间已到，系统将自动帮您提交试卷！");

                }else{
                    $("#countDown").html(data);

                }
            }
        });
        setTimeout('countDown()', 1000);
    }




</script>

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
                <c:if test="${totalscore != null}">
                    <li><h3 style="margin-top: 20px;">成绩为：${totalscore}</h3></li>
                </c:if>
                <c:if test="${totalscore == null}">
                    <h3 style="margin-top: 20px;">剩余：<span id="countDown"></span></h3></li>
                </c:if>
            </ul>
        </div>
    </header>



    <section id="main-content">
        <section class="wrapper">
            <div style=""><h3>${tpName}<span style="color: #d43f3a">（共${byAPaper.totalPage}页，当前第${byAPaper.currentPage}页）</span></h3></div>
                <div class="row mt">
                    <div class="col-lg-10 col-md-10 col-sm-12 mb">
                        <div class="content-panel">
                            <form id="doPaper" method="post" action="${pageContext.request.contextPath}/student/doPaper">
                            <c:forEach items="${byAPaper.list}" var="byAPaperlist" varStatus="s">
                                <div style="padding-bottom: 20px;">
                                    <input type="hidden" id="tnum${s.index}" name="tnum${s.index}">   <%--将题号传过去--%>
                                    <strong>
                                        <span style="font-size: 25px; padding-left: 10px">第 </span><span style="font-size: 25px;" id="num${s.index}">${s.index + byAPaper.currentPage * 2 - 1}</span><span style="font-size: 25px;"> 题：</span>
                                    </strong>
                                    <div style="padding: 0px 10px;">
                                        <strong>
                                              <span style="padding-left:15px; font-size: 17px;">
                                                  ${byAPaperlist.singleTitle}
                                              </span><br>
                                        </strong>

                                          <span style="padding: 0 25px; font-size: 20px;">
                                              <strong>A.</strong>${byAPaperlist.singleA}<br>
                                          </span>

                                          <span style="padding: 0 25px; font-size: 20px;">
                                              <strong>B.</strong>${byAPaperlist.singleB}<br>
                                          </span>

                                          <span style="padding: 0 25px; font-size: 20px;">
                                              <strong>C.</strong>${byAPaperlist.singleC}<br>
                                          </span>

                                          <span style="padding: 0 25px; font-size: 20px;">
                                              <strong>D.</strong>${byAPaperlist.singleD}<br>
                                          </span>
                                        <div style="background-color: #FFD777; height: 25px; font-size: 20px;padding:0 25px;">
                                            选项：
                                            <input type="radio" id="select${s.index}" name="select${s.index}" value="A">A &nbsp
                                            <input type="radio" id="select${s.index}" name="select${s.index}" value="B">B &nbsp
                                            <input type="radio" id="select${s.index}" name="select${s.index}" value="C">C &nbsp
                                            <input type="radio" id="select${s.index}" name="select${s.index}" value="D">D &nbsp

                                        </div>
                                        <c:forEach items="${TF}" var="item" varStatus="j">
                                            <c:if test="${item.key == (s.index + byAPaper.currentPage * 2 - 1)}">
                                                <c:if test="${item.value =='回答正确'}">
                                                    <div style="background-color: #FFD777; height: 25px; font-size: 20px;margin:5px 0px 0px;">
                                                        <span style="margin-left: 20px; background-color: #8fde9c">${item.value}</span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${item.value=='回答错误'}">
                                                    <div style="background-color: #FFD777; height: 25px; font-size: 20px;margin:5px 0px 0px;">
                                                        <span style="margin-left: 20px; background-color: #d9a597;font-weight: bold">${item.value}</span>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </c:forEach>
                            <input type="hidden" id="option0" value="${option0}">      <%--为了实现可以修改上一页的选项，而添加的中间值--%>
                            <input type="hidden" id="option1" value="${option1}">      <%--为了实现可以修改下一页的选项，而添加的中间值--%>
                        </div>
                    </div>
                </div><!-- /row -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${byAPaper.currentPage == 1}">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${byAPaper.currentPage > 1}">
                            <li>
                                <a href="#" onclick="leftbtn()" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <input type="hidden" name="_currentPage" id="currentPage">    <%--将点击的页数传递过去--%>
                        <c:forEach begin="1" end="${byAPaper.totalPage}" var="i">
                            <c:if test="${byAPaper.currentPage == i}">
                                <li class="active">
                                    <a href="#" class="atn" onclick="temPaper(this)">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${byAPaper.currentPage != i}">
                                <li>
                                    <%--<a href="${pageContext.request.contextPath}/student/findByAPaper?_currentPage=${i}&tpId=${tpId}&tpName=${tpName}">${i}</a>--%>
                                    <a href="#" class="atn" onclick="temPaper(this)">${i}</a>
                                </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${byAPaper.currentPage == byAPaper.totalPage}">
                            <li class="disabled">
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${byAPaper.currentPage < byAPaper.totalPage}">
                            <li>
                                <a href="#" onclick="rightbtn()" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${TF == null}">
                        <button type="button" class="btn btn-theme03" style="margin-left: 40px" onclick="submitanswer()">完成答题</button>
                        </c:if>
                        <c:if test="${TF != null}">
                            <button type="button" class="btn btn-theme04" style="margin-left: 40px" onclick="window.location='${pageContext.request.contextPath}/student/deletesession'">退出答题</button>
                        </c:if>
                    </ul>
                </nav>
            </form>


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
