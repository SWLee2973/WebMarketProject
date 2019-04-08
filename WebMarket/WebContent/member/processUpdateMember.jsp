<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");
	String birth = year + "/" + month + "/" + day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	
	Date currentDateTime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDateTime.getTime());
	Timestamp timeStamp = new java.sql.Timestamp(currentDateTime.getTime());
%>

<sql:setDataSource var="dataSource"
								driver="com.mysql.jdbc.Driver"
								url="jdbc:mysql://localhost:3306/WebMarketDB"
								user="root"
								password="1234"/>
								
<sql:update dataSource="${dataSource}" var="resultSet">
	update member 
		set password=?, name=?, gender=?, birth=?, mail=?,
			phone=?, zipcode=?, address=?, regist_day=?
		where id=?
		
	<sql:param value="<%=password %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=gender %>"/>
	<sql:param value="<%=birth %>"/>
	<sql:param value="<%=mail %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=zipcode %>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=timeStamp %>"/>
	<sql:param value="<%=id %>"/>
	
</sql:update>
<c:if test="${resultSet>0 }">
	<c:redirect url="resultMember.jsp?msg=0"/>
</c:if>