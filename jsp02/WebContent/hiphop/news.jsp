<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIPHOP TL</title>
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
   
   #btnWrite {
    float: right;
   }
   
   #link {
   text-decoration=:none; color:black;
   }
   
  </style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%@ include file="../include/header.jsp" %>
  <script type="text/javascript">
  $(function(){
		$("#btnLogout").click(function(){
			location.href="${path}/Tlmember_servlet/logout.do";
		})
		$("#btnWrite").click(function(){
		location.href="${path}/hiphop/news_write.jsp"
	    });
	});
  </script>
<c:if test="${param.message == 'login' }">
	<script>
		alert("로그인 되었습니다.");
	</script>
</c:if>
</head>
<body>
<%@ include file="../include/nav.jsp" %>

<div class="container text-center">    
  <h3><span class="glyphicon glyphicon-th-list"></span>&nbsp;TL NEWS</h3><br>
  <div class="row">
  <c:forEach var="dto" items="${list}">
    <div class="col-sm-4">
      <a id="link" href="${path}/tlkpop_servlet/view.do?num=${dto.num}">
      <img src="${path}/hiphop/file/${dto.filename}" class="img-responsive" 
      style="width:100%; max-width:495px; max-height:495px;" alt="Image">
      </a>
      <p>${dto.subject}</p>

    </div>
   </c:forEach>
  </div>
  
  <c:if test="${sessionScope.userid == 'admin' }">
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