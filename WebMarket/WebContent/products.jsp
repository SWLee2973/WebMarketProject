<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.ProductRepository"%><%@page import="dto.Product"%><%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ProductRepository productDAO = ProductRepository.getInstance(); %>
<%
  			ArrayList<Product> listOfProducts = productDAO.getAllProducts();
 %>
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
  			<h1 class="display-3">상품목록</h1>
  	</div>
    <div class="container">
         <div class="row" align="center">
         		 <%     for(int i=0;i<listOfProducts.size();i++){
         		        	Product product = listOfProducts.get(i);
         		   %>
         	<div class="col-md-4">
         		     <img src="<%=getServletContext().getContextPath()%>/resources/images/<%=product.getFilename()%>" 
         		                       style="width:100%">
         		     <h3><%=product.getPname()%></h3>
         		     <p><%=product.getDescription() %></p>
         		     <p><%=product.getUnitPrice() %></p>
         		     <p><a href="./product.jsp?id=<%=product.getProductId() %>"
         		                            class="btn btn-secondary" role="button">상세정보</a>
         		</div>
         		<%
         		       }
         		%>
    	 </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>