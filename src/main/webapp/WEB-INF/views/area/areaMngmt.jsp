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
                  <div class="col-1 mr-3 text-right">
                    <a id="MaplistAddBtn" type="button" class="btn btn-facebook btn-icon-split"
                       data-toggle="modal"
                       data-target="#mapAddModal">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-info-circle"></i>
                                        </span>
                      <span class="text">Add</span>
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
          </div>
        </div>
      </div>
    </div>
    <!-- End of Content Wrapper -->
  </div>

</body>
<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script>
  //At mapice Home Btn
  $(document).on('click', '#maplistAddBtn', function () {
    $('#RemoveDvBtn').hide();
    $('#ModifyDvBtn').hide();
    $('#AddDvBtn').show();

    $('input[id=mapice_dvNote]').attr('value',"단말위치를 입력하세요.");
    $('#mapice_dvMacId').attr('readonly', false);
    $('#mapice_dvMacId').attr('readonly', false);
    $('input[id=mapice_dvMacId]').attr('value',"단말번호를 입력하세요.");
  })
  $(document).on('click', '#map_dataTable', function (){

  })

  //Model Btn
  $(document).on('click', '#AddDvBtn', function () {
    let dv_Note = $('#mapice_dvNote').val();
    let dv_Mac = $('#mapice_dvMacId').val();
    let dv_iid = $('#mapice_dvArea').val();
    //dv_AreaNum = 장비 한정 6대 였는데 지금은 그럴 필요가 없어서 뺌
    let dv_AreaNum = $('#mapice_dvAreaNum').val();
    cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid, isid: dv_AreaNum};
    insertmapice(cmtData);
  });
  $(document).on('click', '#ModifyDvBtn', function(){
    console.log("modifyDv");
    let dv_Note = $('#mapice_dvNote').val();
    let dv_Mac = $('#mapice_dvMacId').val();
    let dv_iid = $('#mapice_dvArea').val();
    cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid};
    updatemapice(cmtData);
  })
  $(document).on('click', '#RemoveDvBtn', function(){
    console.log("removeDv");
    let dv_Note = $('#mapice_dvNote').val();
    let dv_Mac = $('#mapice_dvMacId').val();
    let dv_iid = $('#mapice_dvArea').val();
    cmtData = {mac: dv_Mac, module_note: dv_Note, iid: dv_iid};
    deletemapice(cmtData);
  })


  //Datatable click event
  $("#map_dataTable tr").click(function () {

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
    var map_Location = td.eq(1).text();
    var map_ID = td.eq(2).text();
    var mapice_dvIp = td.eq(3).text();
    $('input[id=mapice_dvNote]').attr('value', map_Location);
    $('#mapice_dvMacId').attr('readonly', true);
    $('input[id=mapice_dvMacId]').attr('value', map_ID);

    let sel = document.getElementById("mapice_dvArea");
    for (let i = 0; i < sel.length; i++) {
      if (sel[i].text == Location) {
        sel[i].selected = true;
        console.log("location " + Location);
        console.log("sel[i] " + sel[i]);
      }
    }
    $('input[id=mapice_dvIp]').attr('value', mapice_dvIp);

    str += " * 클릭된 Row의 td값 =" + "Location : " + Location +
            ", map_Location : " + map_Location +
            ", map_ID : " + map_ID;
    console.log(str);

  });
</script>