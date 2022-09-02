<%--
  Created by IntelliJ IDEA.
  User: alice
  Date: 2022-07-29
  Time: 오전 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
    <title>$Title$</title>
</head>
<body>
<h2>관리자 전용 페이지</h2>
<b>Authenticated username:</b><br>
ID : <span><sec:authentication property="principal.username"/></span> <br>
<b>Authenticated user role:</b><br>
소유 권한 : <span><sec:authentication property="principal.authorities"/></span>

<form id="logout" action="/logout" method="POST">
    <sec:csrfInput />
    <input type="submit" value="로그아웃"/>
</form>
</body>
</html>


