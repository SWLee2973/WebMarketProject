<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h2 class="alert alert-danger">요청하신 상품을 찾을 수없습니다.</h2>
  	</div>
  </div>	
    <div class="container">
         <p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
         <p><a href="produts.jsp" class="btn btn-secondary">상품목록&raquo;</a>
    </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>