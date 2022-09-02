<%--
  Created by IntelliJ IDEA.
  User: alice
  Date: 2022-07-29
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>

<div class="panel panel-bordered">
    sdaf
</div>


<div class="panel-heading">
    <!-- Content2 Row -->
    <div class="row">
        <div class="col-md-6">
            <h5 class="panel-title"> Safe Counter</h5>
        </div>
        <div class="col-md-4 text-right panel-heading-right">
            <button id="openallnode" class="btn btn-sm btn-secondary">
                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2"
                     stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-chevrons-down">
                    <polyline points="7 13 12 18 17 13"></polyline>
                    <polyline points="7 6 12 11 17 6"></polyline>
                </svg>
            </button>
            <button id="closeallnode" class="btn btn-sm btn-secondary">
                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2"
                     stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-chevrons-up">
                    <polyline points="17 11 12 6 7 11"></polyline>
                    <polyline points="17 18 12 13 7 18"></polyline>
                </svg>
            </button>
        </div>
    </div>
</div>
<a class="dropdown-item" href="#">
    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
    Settings
</a>
<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal" >
    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
    Logout
</a>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="/logout">Logout</a>

            </div>
        </div>
    </div>
</div>



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
<%--home.jsp--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- Bootstrap theme -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css">
<!-- common CSS -->
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>">

<%--menu bar add--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Expand at lg</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05"
            aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExample05">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu" aria-labelledby="dropdown05">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-md-0">
            <input class="form-control" type="text" placeholder="Search">
        </form>
    </div>
</nav>



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

<%--signup.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   <form class="form-signin" action="/user" method="POST">
        <sec:csrfInput/>
        <h1 class="form-signin-heading">Sign Up</h1>
        <hr>
        I D : <input type="text" name="username" placeholder="아이디"> <br>
        PW : <input type="password" name="password" placeholder="비밀번호"> <br>
        <input type="radio" name="auth" value="ROLE_ADMIN,ROLE_USER"> admin
        <input type="radio" name="auth" value="ROLE_USER" checked="checked"> user <br>
        <button type="submit">Join</button>
        <button type="button" onclick="location.href='/login'"> Go to login</button>
    </form>
    <br>
</body>
</html>
