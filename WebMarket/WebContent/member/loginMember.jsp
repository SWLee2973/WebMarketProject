<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.print("<div class='alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해 주세요.");
					out.print("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp"
													method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" name="id" id="id" class="form-control"
												placeholder="id" require autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" name="password" id="password" class="form-control"
												placeholder="password">
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>													
			</form>
		</div>
		<hr>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>