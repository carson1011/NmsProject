<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Topbar -->
<div class="page-title dashboard-top">
<nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow" style="height: 100px">
  <div class="panel panel-bordered">
    <div class="panel-heading">
      <h2 style="color:gray; font-size: 20px; font-weight:700; margin-top: 5px; ">
        메인모니터링</h2>
    </div>
    <div class="panel-body">
      <span class="home"><i class="fas fa-fw fa-home"></i>NMS - </span>
      <span style="color: #5e1700">${Url_location}</span>
    </div>
  </div>


  <!-- Topbar Navbar -->
  <ul class="navbar-nav ml-auto">

    <a id="clock"
       style="color:gray; font-weight:700; margin-top: 24px; margin-right:10px;">00:00</a>
    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
    <li class="nav-item dropdown no-arrow d-sm-none">
      <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-search fa-fw"></i>
      </a>
      <!-- Dropdown - Messages -->
      <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
           aria-labelledby="searchDropdown">
        <form class="form-inline mr-auto w-100 navbar-search">
          <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small"
                   placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
              </button>
            </div>
          </div>
        </form>
      </div>
    </li>

    <!-- Nav Item - Alerts -->
    <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-bell fa-fw text-dark"></i>
        <!-- Counter - Alerts -->
        <span class="badge badge-danger badge-counter">3+</span>
      </a>
      <!-- Dropdown - Alerts -->
      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
           aria-labelledby="alertsDropdown">
        <h6 class="dropdown-header">
          Alerts Center
        </h6>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-primary">
              <i class="fas fa-file-alt text-white"></i>
            </div>
          </div>
          <div>
            <div class="small text-gray-500">December 12, 2019</div>
            <span class="font-weight-bold">A new monthly report is ready to download!</span>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-success">
              <i class="fas fa-donate text-white"></i>
            </div>
          </div>
          <div>
            <div class="small text-gray-500">December 7, 2019</div>
            $290.29 has been deposited into your account!
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="mr-3">
            <div class="icon-circle bg-warning">
              <i class="fas fa-exclamation-triangle text-white"></i>
            </div>
          </div>
          <div>
            <div class="small text-gray-500">December 2, 2019</div>
            Spending Alert: We've noticed unusually high spending for your account.
          </div>
        </a>
        <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
      </div>
    </li>

    <!-- Nav Item - Messages -->
    <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-envelope fa-fw text-dark"></i>
        <!-- Counter - Messages -->
        <span class="badge badge-danger badge-counter">7</span>
      </a>
      <!-- Dropdown - Messages -->
      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
           aria-labelledby="messagesDropdown">
        <h6 class="dropdown-header">
          Message Center
        </h6>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="../img/undraw_profile_1.svg"
                 alt="...">
            <div class="status-indicator bg-success"></div>
          </div>
          <div class="font-weight-bold">
            <div class="text-truncate">Hi there! I am wondering if you can help me with a
              problem I've been having.
            </div>
            <div class="small text-gray-500">Emily Fowler · 58m</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="../img/undraw_profile_2.svg"
                 alt="...">
            <div class="status-indicator"></div>
          </div>
          <div>
            <div class="text-truncate">I have the photos that you ordered last month, how
              would you like them sent to you?
            </div>
            <div class="small text-gray-500">Jae Chun · 1d</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="../img/undraw_profile_3.svg"
                 alt="...">
            <div class="status-indicator bg-warning"></div>
          </div>
          <div>
            <div class="text-truncate">Last month's report looks great, I am very happy with
              the progress so far, keep up the good work!
            </div>
            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                 alt="...">
            <div class="status-indicator bg-success"></div>
          </div>
          <div>
            <div class="text-truncate">Am I a good boy? The reason I ask is because someone
              told me that people say this to all dogs, even if they aren't good...
            </div>
            <div class="small text-gray-500">Chicken the Dog · 2w</div>
          </div>
        </a>
        <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
      </div>
    </li>


    <%--CountInit Button--%>
    <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="BarButton_CountInit_popup" role="button"
         data-toggle="modal" data-target="#CountInitModal">
        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-dark"></i>
        <!-- Counter - Alerts -->
        <span class="badge badge-danger badge-counter">1+</span>
      </a>
    </li>
    <%--CountInit Modal --%>
    <div class="modal fade" id="CountInitModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="CountInitModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Click "Count Reset" below if you are ready to reset your
            device.
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel
            </button>
            <a class="btn btn-primary" href>Count Reset</a>
          </div>
        </div>
      </div>
    </div>

    <%--Repeat Button--%>
    <li class="nav-item dropdown no-arrow mx-1">
      <a href class="nav-link toggle" href="#" id="BarButton_Repeat" role="button">
        <i class="fa fa-spinner fa-sm fa-fw mr-2 text-dark" style="font-weight: bold">
        </i>
      </a>
    </li>


    <div class="topbar-divider d-none d-sm-block"></div>

    <!-- Nav Item - User Information -->
    <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span id="profile_name" class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        <sec:authentication property="principal.username"/>
                                    </span>
        <img class="img-profile rounded-circle"
             src="../img/undraw_profile.svg">

      </a>
      <!-- Dropdown - User Information -->
      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
           aria-labelledby="userDropdown">
        <a class="dropdown-item" href="#">
          <i class="fas fa-user fa-sm fa-fw mr-2 text-dark"></i>
          Profile
        </a>
        <%--<a class="dropdown-item" href="#">
            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
            Settings
        </a>--%>
        <%--여기에 log띄우는 화면으로 이동하는 기능 넣을꺼임--%>
        <a class="dropdown-item" href="#">
          <i class="fas fa-list fa-sm fa-fw mr-2 text-dark"></i>
          Activity Log
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-dark"></i>
          Logout
        </a>
      </div>
    </li>

  </ul>
</nav>
</div>

<%--current time--%>
<script >
  var clockTarget = document.getElementById("clock");
  function clock() {
    var date = new Date();
    var month = date.getMonth();
    var clockDate = date.getDate();
    var day = date.getDay();
    var week = ['일', '월', '화', '수', '목', '금', '토'];

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();

    hours = (hours<10)?'0'+hours:hours;
    minutes = (minutes<10)?'0'+minutes:minutes;
    seconds = (seconds<10)?'0'+seconds:seconds;

    clockTarget.innerText = (month+1)+'월 '+clockDate+'일 ('+week[day]+') '+hours+':'+minutes+':'+seconds;

    if(seconds == "00"){
      // 매분마다 출입시간 체크
      /*console.log(entTimeArr);
      EntryTime(entTimeArr,arrLowMap);*/
    }
  }

  function clockinit() {
    clock();
    setInterval(clock, 1000);
  }
  clockinit();
</script>