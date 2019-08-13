<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.util.Date" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="num" value="1234" scope="page" />
<c:set var="num" value="kim" scope="request" />
<c:set var="num" value="김철수" scope="session" />
<c:set var="num" value="전산부" scope="application" />
<%
Date date=new Date();
%>

page : ${pageScope.num}<br>
request : ${requestScope.num}<br>
session : ${sessionScope.num}<br>
application : ${applicationScope.num}<br>
입사일자 :
<c:set var="date" value="<%=date%>" />
<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
</body>
</html>