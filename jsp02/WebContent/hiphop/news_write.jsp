<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
  body {
  
  }
  
  footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .navbar .navbar-nav {
     display: inline-block;
     float: none;
   }

    .navbar .navbar-collapse {
     text-align: center;
   }
   
   #content {
   width:500px;
   height:500px;
   resize:none;
   }
   
  </style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
	$("#btnLogout").click(function(){
		location.href="${path}/Tlmember_servlet/logout.do";
	});
});

</script>


</head>
<body>
<%@ include file="../include/nav.jsp" %>

<h2>글쓰기</h2>
<form name="form1" method="post" 
action="${path}/tlkpop_servlet/insert.do" 
enctype="multipart/form-data">
<table class="table table-hover">
 <tr>
   <td>제목</td>
   <td><input name="subject" id="subject" size="60"></td>
 </tr>
 <tr>
   <td>본문</td>
   <td><textarea rows="10" cols="40" name="content" id="content">
   </textarea></td>
 </tr>
 <tr>
   <td>첨부파일</td>
   <td><input type="file" name="file1"></td>
 </tr>
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
     <input type="button" value="확인" id="btnSave">
   </td>
 </tr>
</table>
</form>

<footer class="container-fluid text-center">
   <p class="text-center">
          <small><strong>HIPHOP TL</strong></small><br>
          <small>대표 : 김종현 ㆍ 주소 :  우리집 ㆍ 전화 : 010-5661-6917</small><br>
          <small>© HIPHOPTL All Right Reserved.</small>
    </p>
</footer>
</body>
</html>