<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="ko">
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf_header" content="${_csrf.headerName }"/>
    <meta name="_csrf" content="${_csrf.token }"/>
    <title>Safe Counter</title>

    <%--공통--%>
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet" type="text/css" href="/css/sb_admin-2.css">

    <script src="/resources/assets/lib/feather/feather.min.js"></script>

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- 라이브러리 -->
    <!-- bootstrap-treeview -->
    <script src="/resources/assets/lib/jquery-1.12.4.min.js"></script>
    <script src="/resources/jstree/jstree.js"></script>
    <script src="/resources/jstree/jstree.min.js"></script>
    <link rel="stylesheet" href="/resources/jstree/style.min.css">

    <script src="/resources/js/device/device.js"></script>


</head>

<input type="hidden" id="displaySet" name="displaySet" value="${displaySet }">
<input type="hidden" id="middleIp" name="middleIp" value="${middleIp }">