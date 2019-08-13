<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${param.message == 'login' }">
	<script>
		alert("로그인 되었습니다.");
	</script>
</c:if>


<div style="background-color:#ffffff;">
<nav class="navbar navbar-default" style="background-color:#ffffff;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../hiphop/index.jsp">HIPHOP TL</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="../hiphop/index.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">News<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../hiphop/news1.jsp">TL News</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Community<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../hiphop/board.jsp">자유 게시판</a></li>
        </ul>
      </li>
    </ul>
    <c:choose>
    <c:when test="${sessionScope.userid  != null }">
    <ul class="nav navbar-nav navbar-right">
      <li><b>${sessionScope.userid}님</b> &emsp;<button type="button" id="btnLogout" class="btn btn-default">Logout</button></li>
    </ul>
    </c:when>
    <c:when test="${sessionScope.userid  == null }">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="../hiphop/sign.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="../hiphop/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </c:when>
    </c:choose>
  </div>
</nav>
</div>  
 
 




