<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/01_header_main.jsp"></jsp:include>

<script src="/resources/js/paging/pagination.js"></script>
<body class="user-site">
<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="../common/10_nav.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%--<jsp:include page="../common/11_TopBar.jsp"></jsp:include>--%>
            <%--inner--%>
            <div class="panel mt-1 mb-1 ml-2">
                <span class="home"><i class="fas fa-fw fa-home"></i>NMS - </span>
                <span class="mt-2" style="color: #5e1700">${Url_location}</span>

            </div>
            <div class="panel">
                <!-- Begin Page Content -->
                <div class="row">
                    <div class="col">
                        <div class="card border-bottom-primary shadow ">
                            <div class="card-body">
                                <div class="row no-gutters align-items-lg-center">
                                    <div class="col ">
                                        <h5 style="font-size: 20px; color: darkblue; font-weight: bold">Device List</h5>
                                    </div>
                                    <div class="col-1 mr-3 text-right">
                                        <%--Repeat Button--%>
                                        <a href class="nav-link toggle " href="#" id="BarButton_Repeat" role="button">
                                            <i class="fa fa-reply-all fa-sm fa-fw mr-2 text-dark"
                                               style="font-size: 18px;">
                                            </i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mb-3 align-items-end " >
                        <div class="col-5">
                            <div id="dataTable_filter" class="dataTables_filter">
                                <label>Search:<input
                                        type="search" class="form-control form-control-sm" placeholder=""
                                        aria-controls="dataTable"></label>
                                <button id="DevSearch" class="btn btn-facebook" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>

                        </div>
                        <div class="col-7 text-right" >
                            <a id="DevlistAddBtn" type="button" class="btn btn-facebook btn-icon-split"
                               data-toggle="modal"
                               data-target="#devAddModal">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-info-circle"></i>
                                        </span>
                                <span class="text">Add</span>
                            </a>
                        </div>
                    </div>
                    <div class="table-responsive" style="overflow-x: hidden">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table class="table table-bordered dataTable table-hover" id="Dev_dataTable"
                                           width="100%"
                                           cellspacing="0" role="grid" aria-describedby="Dev_dataTable_info"
                                           data-toggle="modal"
                                           data-target="#devAddModal"
                                           style="width: 100%;">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting sorting_asc text-center" tabindex="0" aria-controls="Dev_dataTable"
                                                rowspan="1" colspan="1" aria-sort="ascending"
                                                aria-label="Location: activate to sort column ascending"
                                                style="width: 100px;">Location
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="Dev_dataTable" rowspan="1"
                                                colspan="1" aria-label="Dev Location: activate to sort column ascending"
                                                style="width: 180px;">Dev Location
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="Dev_dataTable" rowspan="1"
                                                colspan="1" aria-label="Dev Dev_ID: activate to sort column ascending"
                                                style="width: 150px;">Dev_ID
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="Dev_dataTable" rowspan="1"
                                                colspan="1"
                                                style="width: 200px;">Dev_IP
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="Dev_dataTable" rowspan="1"
                                                colspan="1"
                                                style="width: 154.734px;">Direction
                                            </th>
                                            <th class="sorting text-center" tabindex="0" aria-controls="Dev_dataTable" rowspan="1"
                                                colspan="1" aria-label="Salary: activate to sort column ascending"
                                                style="width: 139.578px;">Data_Received
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach items="${getDev_table}" var="element">
                                            <tr>
                                                <td class="sorting_1 text-center">${element.sname}</td>
                                                <td>${element.module_note}</td>
                                                <td class="sorting_2 text-center">${element.mac}</td>
                                                <c:choose>
                                                    <c:when test="${null eq element.sip}">
                                                        <td class="text-center"> 연결 히스토리가 없는 장비</td>
                                                    </c:when> <c:otherwise>
                                                    <td class="text-center">${element.sip}</td>
                                                </c:otherwise>
                                                </c:choose>
                                                <td class="text-center"> 정방향 </td>
                                                <td class="text-center"> 이력 없음</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                                        Showing ${pagination.listCnt} entries
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-7 ">
                                    <ul class="dataTables_paginate paging_simple_numbers" id="paging">
                                        <!-- pagination{s} -->
                                        <div id="paginationBox">
                                            <ul class="pagination">
                                                <c:if test="${pagination.prev}">
                                                    <li class="page-item ">
                                                        <a class="page-link" href="#"
                                                           onClick="fn_prev('${pagination.page}', '${pagination.range}',
                                                        '${pagination.rangeSize}')">Previous</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
                                                           var="idx">
                                                    <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                                                        <a class="page-link" href="#"
                                                           onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${pagination.next}">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#"
                                                           onClick="fn_next('${pagination.range}', '${pagination.range}',
                                                           '${pagination.rangeSize}')">Next</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->
    </div>
        <%--Start of Content Modal--%>
    <div class="modal fade" id="devAddModal" tabindex="-1" role="dialog" aria-labelledby="devAddModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="devAddModalLabel" style="color: #0c0c0c;">디바이스 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="board-warp board-write-wrap">
                        <table class="table" style="table-layout:auto;with:100%;table-layout:fixed;">
                            <tbody>
                            <tr>
                                <th colspan="3" class="text-center">디바이스 IP</th>
                                <td colspan="7">
                                    <div class="form-group focus-input">
                                        <input id="device_dvIp" type="text" class="form-control form-control-sm"
                                               style="cursor:default" readonly="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3" class="text-center">단말위치</th>
                                <td colspan="7">
                                    <div class="form-group">
                                        <input id="device_dvNote" type="text" class="form-control form-control-sm "
                                               placeholder="단말위치를 입력하세요" autocomplete="off" spellcheck="false">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3" class="text-center">단말번호</th>
                                <td colspan="7">
                                    <div class="form-group">
                                        <input id="device_dvMacId" type="text" class="form-control form-control-sm"
                                               placeholder="단말번호를 입력하세요" autocomplete="off" spellcheck="false"
                                               maxlength="17" style="text-transform : uppercase">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3" class="text-center">설치 영역</th>
                                <td colspan="7">
                                    <div class="form-group focus-input">
                                        <select id="device_dvArea" type="text" class="form-control form-control-sm"
                                                style="cursor:pointer">
                                            <c:if test="${!empty getMap_dvArea}">
                                                <c:forEach items="${getMap_dvArea}" var="dvArea">
                                                    <option value="${dvArea.id}">${dvArea.text}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="RemoveDvBtn" class="btn btn-danger" data-dismiss="modal">Remove</button>
                    <button type="button" id="ModifyDvBtn" class="btn btn-primary" data-dismiss="modal">Modify</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="AddDvBtn" class="btn btn-primary" data-dismiss="modal">Add Device</button>
                </div>
            </div>
        </div>
    </div>
        <%--End of Content Modal--%>
</body>
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
    //At Device Home Btn
    $(document).on('click', '#DevlistAddBtn', function () {
        $('#RemoveDvBtn').hide();
        $('#ModifyDvBtn').hide();
        $('#AddDvBtn').show();

        $('input[id=device_dvNote]').attr('value',"단말위치를 입력하세요.");
        $('#device_dvMacId').attr('readonly', false);
        $('#device_dvMacId').attr('readonly', false);
        $('input[id=device_dvMacId]').attr('value',"단말번호를 입력하세요.");
    })
    $(document).on('click', '#Dev_dataTable', function (){

    })

    //Model Btn
    $(document).on('click', '#AddDvBtn', function () {
        let dv_Note = $('#device_dvNote').val();
        let dv_Mac = $('#device_dvMacId').val();
        let dv_iid = $('#device_dvArea').val();
        //dv_AreaNum = 장비 한정 6대 였는데 지금은 그럴 필요가 없어서 뺌
        let dv_AreaNum = $('#device_dvAreaNum').val();
        cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid, isid: dv_AreaNum};
        insertDevice(cmtData);
    });
    $(document).on('click', '#ModifyDvBtn', function(){
        console.log("modifyDv");
        let dv_Note = $('#device_dvNote').val();
        let dv_Mac = $('#device_dvMacId').val();
        let dv_iid = $('#device_dvArea').val();
        cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid};
        updateDevice(cmtData);
    })
    $(document).on('click', '#RemoveDvBtn', function(){
        console.log("removeDv");
        let dv_Note = $('#device_dvNote').val();
        let dv_Mac = $('#device_dvMacId').val();
        let dv_iid = $('#device_dvArea').val();
        cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid};
        deleteDevice(cmtData);
    })


    //Datatable click event
    $("#Dev_dataTable tr").click(function () {

        $('#AddDvBtn').hide();
        $('#RemoveDvBtn').show();
        $('#ModifyDvBtn').show();
        var str = ""

        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        /*// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());

        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });

        console.log("배열에 담긴 값 : "+tdArr);*/

        // td.eq(index)를 통해 값을 가져올 수도 있다.
        var Location = td.eq(0).text();
        var Dev_Location = td.eq(1).text();
        var Dev_ID = td.eq(2).text();
        var device_dvIp = td.eq(3).text();
        $('input[id=device_dvNote]').attr('value', Dev_Location);
        $('#device_dvMacId').attr('readonly', true);
        $('input[id=device_dvMacId]').attr('value', Dev_ID);

        let sel = document.getElementById("device_dvArea");
        for (let i = 0; i < sel.length; i++) {
            if (sel[i].text == Location) {
                sel[i].selected = true;
                console.log("location " + Location);
                console.log("sel[i] " + sel[i]);
            }
        }
        $('input[id=device_dvIp]').attr('value', device_dvIp);

        str += " * 클릭된 Row의 td값 =" + "Location : " + Location +
            ", Dev_Location : " + Dev_Location +
            ", Dev_ID : " + Dev_ID;
        console.log(str);

    });
</script>