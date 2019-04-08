<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css"> -->
<link rel="stylesheet" href="./css/myStyle.css">
</head>
<body>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
   <div class="container">
   		<div>
   		    <a class="navbar-brand" href="./welcome.jsp">Home</a>
   		</div>
   </div>
</nav>
	<%!  /* 전역변수 선언 */
			String greeting = "Welcome to web Shopping Mall";
	        String tagline = "Welcome to Web Market!";
	%>
<div class="jumbotron">	
   <div class="container">
	<h1 class="display-3"><%=greeting %></h1>
	</div>
</div>
<div class="container">	
    <div class="text-center">
	<h3><%=tagline %></h3>
	</div>
</div>
<footer class="container">
   <p> &copy; Webmarket </p>
</footer>
</body>
</html>