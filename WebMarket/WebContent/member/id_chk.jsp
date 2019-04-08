<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
		//id존재여부 확인
		 String id= request.getParameter("id");
         /*  빈 파라미터가 넘어왔는지 확인 */
         String driver="com.mysql.jdbc.Driver";
         String url="jdbc:mysql://localhost:3306/webmarketdb";
         String user="root";
         String password="1234";
        try{   
        	      Class.forName(driver);
        	      Connection con = DriverManager.getConnection(url, user, password);
        	      PreparedStatement pstmt
        	              =con.prepareStatement("select count(*) from member where id=?");
        	      pstmt.setString(1,id);
        	      ResultSet rs=pstmt.executeQuery();
        	      if(rs.next()){
        	    	  int result = rs.getInt(1);
        	    	  if(result>0){//  count(*)결과가 >0이면 해당아이디가 존재함
        	        	   //id가 있는 경우 
        	        	   out.print("<script>");
        	               out.print("alert('존재하는 id입니다.');");
        	               out.print("self.close();");
        	               out.print("opener.document.member.id.value='';");
        	               out.print("opener.document.member.id.focus();");
        	        	   out.print("</script>");
        	          } else{//count(*)결과가 0이면 해당아이디가 존재하지 않음, 사용가능
        	              //id가 없는 경우
        	        	  out.print("<script>");
        	              out.print("alert('사용할수 있는 id입니다.');");
        	              out.print("self.close();");
        	       	      out.print("</script>");
        	          } 
        	      } 
        }catch(Exception e){
        	e.printStackTrace();
        }
 %>
<%-- <%
 	//id존재여부 확인
 	String id = request.getParameter("id");
%>
	<!-- db 연결객체 얻기 -->
	<sql:setDataSource var="dataSource"
									driver = "com.mysql.jdbc.Driver"
									url="jdbc:mysql://localhost:3306/WebMarketDB"
									user="root"
									password="1234"/>
									
	<!-- 쿼리 실행 -->
	<!-- select count(*)면 무조건 not empty,
			select *로 변경: 값이 없으면(null) empty,
									값이 있으면 not empty -->
	<sql:query var="resultSet" dataSource="${dataSource }">
		select * from member where id=?
		<sql:param value="<%=id %>"/>
	</sql:query>
	
	<!-- 기존 아이디가 존재할 때 -->
	<c:if test="${resultSet != null }">
		<script>
			alert('이미 존재하는 id입니다.');
			opener.document.newMember.id.value = '';
			opener.document.newMember.id.focus();
			self.close();/*window객체 자신을 닫을 때*/
		</script>
	</c:if>
	<!-- 기존 아이디가 존재하지 않을 때 -->
	<c:if test="${resultSet == null }">
		<script>
			alert('사용할 수 있는 id입니다.');
			self.close();
		</script>
	</c:if> --%>
	
<script>
   function chk(val){
	   opener.newMember.id.value=val;
	   /* window.close(); */
	   self.close();
   }   
</script>
</head>
<body>
</body>
</html>