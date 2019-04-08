<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>WebMarket</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">WebMarket</h1>
		</div>
	</div>
		<div class="container" align="center">
			<%
			//msg:0-수정, 1-입력, 2-로그인, null-삭제
				String msg = request.getParameter("msg");
				if(msg != null){
					if(msg.equals("0"))
						out.print("<h2 class='alert alert-warning'>회원정보가 수정되었습니다.</h2>");
					else if(msg.equals("1"))
						out.print("<h2 class='alert alert-success'>회원가입이 완료되었습니다.</h2>");
					else if(msg.equals("2")){
						String loginId = (String)session.getAttribute("sessionId");
						out.print("<h2 class='alert alert-primary'>" + loginId + "님 환영합니다!</h2>");
					}
				} else{
						out.print("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				}
			%>
		<a href="../products.jsp" class="btn btn-secondary">&laquo;물품 보러가기</a>
		</div>
	<hr>
<jsp:include page="../footer.jsp"/>
</body>
</html>