<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%@ include file="topMenu.jsp" %>
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
	<%
	       /* 5초 간격으로 리프레시 */
	        response.setIntHeader("Refresh", 5);
			Date date = new Date();
	        String am_pm;
	        int hour = date.getHours();
	        int minute = date.getMinutes();
	        int seconds = date.getSeconds();
	        if(hour /12==0){//정수/정수 =>정수
	        	 am_pm ="AM";
	        }else{
	        	am_pm="PM";
	        	hour =hour + 12;
	        }
	        String CT = hour +":"+minute +":"+seconds + " " + am_pm; 
	        out.print("현재 접속 시각:" + CT+"<br>");
	%>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>