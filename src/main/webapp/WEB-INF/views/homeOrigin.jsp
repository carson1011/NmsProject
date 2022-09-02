<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<head>
    <title>main</title>
</head>
<body>
<h2>회원 전용 페이지</h2>


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