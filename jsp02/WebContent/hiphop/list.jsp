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
   
   #btnWrite{
   float: right;
   }
   
   #title {
   margin-left: 5%;
   }
   
   #board {
   margin-left: 5%;
   margin-right: 5%;
   }
   
  </style>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/hiphop/write.jsp"
	})
	$("#btnLogout").click(function(){
		location.href="${path}/Tlmember_servlet/logout.do";
	});
});
</script>


</head>
<body>
<%@ include file="../include/nav.jsp" %>

<h2 id="title"><span class="glyphicon glyphicon-ok"></span>&nbsp;자유게시판</h2>
<div id="board">
<table class="table table-striped">
<tr>
  <th>번호</th>
  <th>작성자</th>
  <th>제목</th>
  <th>날짜</th>
  <th>조회수</th>
  <th>첨부파일</th>
  <th>다운로드</th>
</tr>
<c:forEach var="dto" items="${list}">
<c:choose> 
  <c:when test="${dto.show == 'y'}">

<tr>
<td>${dto.num}</td>
<td>${dto.writer}</td>
<td>
<!-- 답글 들여쓰기 -->
<c:forEach var="i" begin="1" end="${dto.re_level}">
   &nbsp;&nbsp;
</c:forEach>
<a href="${path}/tlboard_servlet/view.do?num=${dto.num}">
${dto.subject}</a>
<!-- 댓글갯수 표시  -->
<c:if test="${dto.comment_count > 0}">
<span style="color:red;">(${dto.comment_count})</span>
</c:if>
</td>
<td>${dto.reg_date}</td>
<td>${dto.readcount}</td>

  <td align="center">
    <c:if test="${dto.filesize > 0}">
      <a href="${path}/tlboard_servlet/download.do?num=${dto.num}">
       <img src="../images/file.gif">
      </a> 
  </c:if>
  </td>
  <td>${dto.down}</td>
</tr>
</c:when>
<c:otherwise>
 <tr>
   <td>${dto.num}</td>
   <td colspan="6" align="center">
     삭제된 게시물입니다.
   </td>
 </tr>
</c:otherwise>
</c:choose>
</c:forEach>
</table>
<c:if test="${sessionScope.userid != null }">
<button id="btnWrite" class="btn btn-default">글쓰기</button>
</c:if>
</div>


<footer class="container-fluid text-center">
   <p class="text-center">
          <small><strong>HIPHOP TL</strong></small><br>
          <small>대표 : 김종현 ㆍ 주소 :  우리집 ㆍ 전화 : 010-5661-6917</small><br>
          <small>© HIPHOPTL All Right Reserved.</small>
    </p>
</footer>
</body>
</html>