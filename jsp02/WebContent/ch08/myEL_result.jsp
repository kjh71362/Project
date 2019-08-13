<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
사원번호 : ${sessionScope.num}<br>
사원이름 : ${sessionScope.name}<br>
직책 : ${sessionScope.pos}<br>
부서 : ${sessionScope.dep}<br>
입사일자 : ${sessionScope.join}<br>
연봉 : ${sessionScope.sal}<br>
</body>
</html>