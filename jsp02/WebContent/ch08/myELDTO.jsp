<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%@ page import="member.MemberDTO" %>
<%
MemberDTO dto=new MemberDTO();
dto.setUserid("kim");
dto.setName("김철수");
dto.setEmail("kim@gmail.com");
dto.setHp("010-1111-1111");
%>
<c:set var="dto" value="<%=dto%>" scope="request" />

<jsp:forward page="myELDTO_result.jsp"></jsp:forward>

</body>
</html>