<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/tlkpop_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/tlkpop_servlet/delete.do";
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
<%@ include file="../include/nav.jsp" %>

<h2>수정/삭제</h2>
<form name="form1" method="post" 
	enctype="multipart/form-data">
<table class="table table-hover">
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

<footer class="container-fluid text-center">
   <p class="text-center">
          <small><strong>HIPHOP TL</strong></small><br>
          <small>대표 : 김종현 ㆍ 주소 :  우리집 ㆍ 전화 : 010-5661-6917</small><br>
          <small>© HIPHOPTL All Right Reserved.</small>
    </p>
</footer>
</body>
</html>

	