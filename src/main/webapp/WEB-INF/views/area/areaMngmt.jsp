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
                                    <div class="col mt-2">
                                        <h5 style="font-size: 20px; color: darkblue; font-weight: bold">Area List</h5>
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
                    <div class="row">
                        <div class="col-md-4 mt-2">
                            <jsp:include page="../common/20_tree.jsp"></jsp:include>
                        </div>
                        <div class="col-md-8 mt-2" id="Area_InfoPanel">
                            <%--Area.js--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Content Wrapper -->
    <!-- Start of Content Confirm Modal -->
    <%--Edit--%>
    <div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card border-bottom-warning">
                    <div class="card-body">
                        <a href="#" class="btn btn-warning btn-circle btn-sm">
                            <i class="fas fa-exclamation-triangle"></i>
                        </a>
                        <h4 class="mt-2 text-center">구역 정보를 수정하시겠습니까?</h4>
                    </div>
                </div>
                <%--<h5 class="modal-title" id="EditModalLabel">Modal title</h5>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="MaplistEditBtn" type="button" class="btn btn-warning">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <%--Add--%>
    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card border-bottom-primary">
                    <div class="card-body">
                        <a href="#" class="btn btn-primary btn-circle btn-sm">
                            <i class="fas fa-check"></i>
                        </a>
                        <h4 class="mt-2 text-center">구역을 추가합니다.</h4>
                    </div>
                </div>
                <%--<h5 class="modal-title" id="EditModalLabel">Modal title</h5>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="MaplistAddBtn" type="button" data-dismiss="modal" class="btn btn-primary">Confirm
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%--Remove--%>
    <div class="modal fade" id="RemoveModal" tabindex="-1" role="dialog" aria-labelledby="RemoveModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="card border-bottom-danger">
                    <div class="card-body">
                        <a href="#" class="btn btn-danger btn-circle btn-sm">
                            <i class="fas fa-trash"></i>
                        </a>
                        <h4 class="mt-2 text-center">구역을 삭제합니다.</h4>
                    </div>
                </div>
                <%--<h5 class="modal-title" id="EditModalLabel">Modal title</h5>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="MaplistDeleteBtn" type="button" class="btn btn-danger">Confirm</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Content Confirm Modal -->
</div>

</body>
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
    function refreshMemList() {
        location.reload();
    }

    /*Modify Maphead Name*/
    $(document).on('click', '#MaplistEditBtn', function () {
        console.log("MaplistEditBtn");
        let map_iid = $('#area_root_iid').val();
        let map_sName = $('#area_root_name').val();

        cmtData = {id: map_iid, text: map_sName};
        updateMapHead(cmtData);
        refreshMemList();
    })
    /*Add Area*/
    $(document).on('click', '#MaplistAddBtn', function () {
        console.log("MaplistAddBtn");
        let map_iparent = $('#area_root_iid').val();
        let map_sName = $('#area_add_name').val();
        let map_sDesc = $('#area_add_desc').val();
        console.log(map_iparent, map_sName, map_sDesc);
        if (map_sName != '') {
            cmtData = {parent: map_iparent, text: map_sName, sdesc: map_sDesc}
            insertMap(cmtData);
            refreshMemList();
        } else
            alert('구역을 입력해주세요');
    })
    /*Remove Area*/
    $(document).on('click', '#MaplistDeleteBtn', function () {
        console.log("MaplistRemoveBtn");
        let map_iid = $('#area_root_iid').val();
        let map_sName = $('#area_root_name').val();
        let checkbox_InvolveDev = $('#flexCheckInvolveDev').is(":checked");
        let checkbox_InvolveArea = $('#flexCheckInvoleArea').is(":checked");
        let map_has_dev_id = $('#area_has_dev_id').val();
        let map_has_children_id = $('#area_children_id').val();
        let option_case = 0;

        console.log('map_iid : ' + map_iid);
        console.log('map_sName : ' + map_sName);
        console.log('checkbox_InvolveDev : ' + checkbox_InvolveDev);
        console.log('checkbox_InvolveArea : ' + checkbox_InvolveArea);
        console.log('map_has_dev_id : ' + map_has_dev_id);
        console.log('map_has_children_id : ' + map_has_children_id);

        if (checkbox_InvolveDev == false && checkbox_InvolveArea == false)
            option_case = 0;
        else if (checkbox_InvolveDev == true && checkbox_InvolveArea == false)
            option_case = 1;
        else if (checkbox_InvolveDev == false && checkbox_InvolveArea == true)
            option_case = 2;
        else if (checkbox_InvolveDev == true && checkbox_InvolveArea == true)
            option_case = 3;
        console.log('option_case : ' + option_case);
        switch (option_case) {
            case 0: //단일 Area만 삭제 No dev
                if (hasDev.includes(map_iid))
                    alert('해당구역에 장비가 등록되어 있습니다.');
                else if(map_has_children_id)
                    alert('해당구역에 포함된 다른 구역이 있습니다.');
                else {
                    cmtData = {id: map_iid}
                    removeMap(cmtData);
                }
                break;
            case 1: //단일 Area와 등록되어 있는 Dev 모두 삭제
                if (map_has_children_id)
                    alert('해당구역에 포함된 다른 구역이 있습니다.');
                else{
                    cmtData = {id: map_iid, text: map_sName}
                    removeMapwithDev(cmtData);
                }
                break;
            case 2: //해당 Area와 하위 Area 삭제 No dev
                if (map_has_dev_id)
                    alert('해당구역 및 하위 구역에 장비가 등록되어 있습니다.');
                else{
                    cmtData = {text: map_sName, parent: map_iid}
                    removeMapwithUnderMap(cmtData);
                }
                break;
            case 3:
                let aRemoveAreaDev = map_has_children_id.split(",");
                aRemoveAreaDev.push(map_iid);
                console.log(aRemoveAreaDev);
                aRemoveAreaDev.forEach(function (element,index,array){
                    console.log('element : ' + element);
                    cmtData = {id: element}
                    if(map_has_dev_id.includes(element))
                    {
                        console.log('case3 include ' + element);
                        removeMapwithUnderMapDev(cmtData);

                    }
                    else{
                        console.log('case3 not include ' + element);
                        removeMap(cmtData);
                    }
                })
                break;
        }
        refreshMemList();
    })
</script>