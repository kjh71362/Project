<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   
  </style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ include file="../include/header.jsp" %>
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
<div style="background-color:#ffffff;">
<nav class="navbar navbar-default" style="background-color:#ffffff;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../hiphop/main.jsp">HIPHOP TL</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="../hiphop/main.jsp">Home</a></li>
      <li class="dropdown active"><a class="dropdown-toggle" data-toggle="dropdown" href="#">News<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../hiphop/news1.jsp">국내 뉴스</a></li>
          <li><a href="#">국외 뉴스</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Music<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">국내 신곡</a></li>
          <li><a href="#">국외 신곡</a></li>
          <li><a href="#">TL 추천곡</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Community<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">자유 게시판</a></li>
          <li><a href="#">국내 게시판</a></li>
          <li><a href="#">국외 게시판</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><b>${sessionScope.userid}님</b> &emsp;<button type="button" id="btnLogout" class="btn btn-default">Logout</button></li>
    </ul>
  </div>
</nav>
</div>

<h2>글쓰기</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/insert.do" 
enctype="multipart/form-data">
<table class="table table-hover">
 <tr>
   <td>이름</td>
   <td><input name="writer" id="writer"></td>
 </tr>
 <tr>
   <td>제목</td>
   <td><input name="subject" id="subject" size="60"></td>
 </tr>
 <tr>
   <td>본문</td>
   <td><textarea rows="5" cols="60" name="content" id="content">
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
</body>
</html>