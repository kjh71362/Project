<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board_servlet/delete.do";
			document.form1.submit();			
		}
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

<h2>수정/삭제</h2>
<form name="form1" method="post" 
	enctype="multipart/form-data">
<table border="1" width="700px">
	<tr>
		<td>이름</td>
		<td><input name="writer" id="writer"
			value="${dto.writer}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input name="subject" id="subject" size="60"
			value="${dto.subject}"></td>
	</tr>
	<tr>
		<td>본문</td>
		<td><textarea rows="5" cols="60"
			name="content" id="content">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<c:if test="${dto.filesize > 0 }">
				${dto.filename} ( ${dto.filesize / 1024} KB )
				<input type="checkbox" name="fileDel">첨부파일 삭제
				<br>
			</c:if>
			<input type="file" name="file1">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<!-- 수정,삭제를 위한 글번호 -->
			<input type="hidden" name="num" value="${dto.num}">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
		</td>
	</tr>
</table>
</form>

</body>
</html>

	