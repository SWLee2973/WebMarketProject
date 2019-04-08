<%@page import="java.sql.DriverManager"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
        Connection con=null;
try{
		Context ctx = new InitialContext();
		DataSource dataSource 
		                = (DataSource)ctx.lookup("java:comp/env/jdbc/TestDB");
		con=dataSource.getConnection();
	 	/* if(con!=null){
	 		out.print("연결성공");
	 	}else{
	 		out.print("연결실패");
	 	} */
		/* Class.forName("com.mysql.jdbc.Driver");
		con =DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbookdb",
				"root","1234"); */
}catch(Exception e){
	out.print("sqlException:"+e.getMessage());
}
%>