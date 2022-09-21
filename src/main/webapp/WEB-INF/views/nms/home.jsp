<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../common/01_header_main.jsp"></jsp:include>

<body id="page-top" class="user-site">
<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="../common/10_nav.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <jsp:include page="../common/11_TopBar.jsp"></jsp:include>
            <%--inner--%>
            <div class="container-fluid">
                <!-- Begin Page Content -->
                <div class="row">
                    <% String sLocation = (String)request.getAttribute("Url_location"); %>
                    <%--<% out.print(sLocation);%>--%>
                    <div class="col mt-2">
                        <jsp:include page="../common/20_tree.jsp"></jsp:include>
                    </div>
                    <div class="col-9">
                        <jsp:include page="../common/21_CountPanel.jsp"></jsp:include>
                        <div class="row ">
                            <div class="card shadow" style="width: 100%;" id="nms_devPanel">

                            </div>
                        </div>
                        <%--<div class="row bg-gray-200">
                            <div style="margin-left: 20px; margin-top:15px;
                                    margin-bottom: 10px">
                                <label style="font-weight: bold; font-size: 22px; margin-top: 7px;"> 인원 </label>
                            </div>
                        </div>--%>

                    </div>
                    <div class="col-md-12">

                    </div>
                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->

        <div class="container-fluid">
            <div class="inner-wrap">
                <!-- Content1 Row -->

            </div>


        </div>
        <!-- End of Page Wrapper -->


        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="logoutModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current
                        session.
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="/logout">Logout</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<form id="logout" action="/logout" method="POST">
        <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}">
        <input type="submit" value="로그아웃">
    </form>--%>


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <%--<script src="../js/demo/chart-area-demo.js"></script>
    <script src="../js/demo/chart-pie-demo.js"></script>--%>


</div>
</body>
