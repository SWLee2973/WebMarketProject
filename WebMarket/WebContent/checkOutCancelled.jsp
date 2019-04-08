<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 취소</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">주문 취소</h1>
  	</div>
  </div>
    <div class="container">
       <h3 class="alert alert-danger">주문이 취소되었습니다.</h3>
    </div>
    <div class="container">
       <p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품등록</a>
     </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>