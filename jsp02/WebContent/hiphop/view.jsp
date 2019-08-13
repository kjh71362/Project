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
   
  #subject {
  margin-left: 5%;
  }
  
  #table {
   margin-left : 5%;
   margin-right : 5%;
  }
  
  #table2 {
   margin-left : 5%;
   margin-right : 5%;
  }
  
  #commentList {
   margin-left : 5%;
   margin-right : 5%;
  }
  
 
  

   
  </style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/tlboard_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/tlboard_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/tlboard_servlet/pass_check.do";
		document.form1.submit();
	});
	$("#btnLogout").click(function(){
		location.href="${path}/Tlmember_servlet/logout.do";
	});
	
});
function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/tlboard_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/tlboard_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
</script>
</head>
<body>

<%@ include file="../include/nav.jsp" %>

<h2 id="subject"><span class="glyphicon glyphicon-ok"></span>&nbsp;${dto.subject}</h2>
<form name="form1" method="post">

<div id="table">
<table class="table table-striped">
	<tr>
		<td>날짜</td>
		<td>${dto.reg_date}</td>
		<td>조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td colspan="3">${dto.writer}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td>본문</td>
		<td colspan="3" height="500px;">
		${dto.content}</td>
	</tr>
	<c:if test="${sessionScope.userid != null}">
	<tr>
		<td>비밀번호</td>
		<td colspan="3">
			<input type="password" name="passwd" id="passwd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>
	</c:if>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a href="${path}/tlboard_servlet/download.do?num=${dto.num}">
	[다운로드]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<c:if test="${sessionScope.userid != null}">
			<input type="button" value="수정/삭제" id="btnEdit">
			</c:if>
			<input type="button" value="목록" id="btnList">
		</td>
	</tr>
</table>
</div>


</form>

<c:if test="${sessionScope.userid != null}">
<!-- 댓글 쓰기 폼 -->
<div id="table2">
<table class="table table-striped">
 <tr>
  <td><input id="writer" value="${sessionScope.userid}"  readonly></td>
  <td rowspan="2">
    <button id="btnSave" type="button">확인</button>
  </td>
 </tr>
 <tr>
   <td><textarea rows="5" cols="80" 
   placeholder="내용을 입력하세요" id="content"></textarea></td>
 </tr>
</table>
</div>

<!-- 댓글 목록을 출력할 영역 -->
<div class="container" id="commentList"></div>
</c:if>
<br>
<footer class="container-fluid text-center">
   <p class="text-center">
          <small><strong>HIPHOP TL</strong></small><br>
          <small>대표 : 김종현 ㆍ 주소 :  우리집 ㆍ 전화 : 010-5661-6917</small><br>
          <small>© HIPHOPTL All Right Reserved.</small>
    </p>
</footer>
</body>
</html>

	