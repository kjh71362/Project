<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<c:set var="num" value="001" scope="session" />
<c:set var="name" value="홍길동" scope="session"/>
<c:set var="pos" value="대리" scope="session"/>
<c:set var="dep" value="전산" scope="session"/>
<c:set var="join" value="2019년1월1일" scope="session"/>
<c:set var="sal" value="3000만" scope="session"/>
세션변수가 생성되었습니다.<br>
<a href="myEL_result.jsp">확인</a>
</body>
</html>