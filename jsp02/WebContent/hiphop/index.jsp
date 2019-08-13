<!--http://192.168.0.68/jsp02/hiphop/index.jsp  -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIPHOP TL</title>
<%@ include file="../include/header.jsp" %>
 <c:if test="${param.message == 'login' }">
	<script>
		alert("로그인 되었습니다.");
	</script>
</c:if>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/Tlmember_servlet/logout.do";
	});
});
</script>
<style type="text/css">
  body {
  text-align:center;
  }
  
  footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img  {
      margin: auto;
      width:100%;
      max-height: 710px;
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
  <script type="text/javascript">
  </script>
</head>
<body>

<c:choose>
<c:when test="${sessionScope.userid  == null }">
<nav class="navbar navbar-default" style="border:none; background-color:#ffffff;">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="sign.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
</c:when>
<c:when test="${sessionScope.userid  != null }">
<nav class="navbar navbar-default" style="border:none; background-color:#ffffff;">
  <div class="container-fluid">
    <ul class="nav navbar-nav navbar-right">
      <li><b>${sessionScope.userid}님</b> &emsp;<button type="button" id="btnLogout" class="btn btn-default">Logout</button></li>
    </ul>
  </div>
</nav>
</c:when>
</c:choose>

<div id="logo" style="background-color: #ffffff;">
 <a href="index.jsp"><img src="images/logo2.png"></a>
</div>
<br>
<div style="background-color:#ffffff;">
<nav class="navbar navbar-default" style="border:none; background-color:#ffffff;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">News<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="news1.jsp">TL News</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Community<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="board.jsp">자유 게시판</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
</div>

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-left:10%; margin-right:10%"> 	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="images/slide1.jpg" style="width:100%" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>릴 펌, 5월말 내한공연</h1>
					<p>JBL 2019...</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="images/slide2.jpg" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>타일러 더 크리에이터, 5집 [IGOR] 발매</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="images/slide3.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>씨잼, 정규 2집 [킁] 발매</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
<div>
</div>

<br><br>


<footer class="container-fluid text-center">
  <p class="text-center">
          <small><strong>HIPHOP TL</strong></small><br>
          <small>대표 : 김종현 ㆍ 주소 :  우리집 ㆍ 전화 : 010-5661-6917</small><br>
          <small>© HIPHOPTL All Right Reserved.</small>
    </p>
</footer>

</body>
</html>