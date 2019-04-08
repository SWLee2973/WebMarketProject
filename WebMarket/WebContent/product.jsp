<%@page import="dao.ProductRepository"%><%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  errorPage="exceptionNoProdcutId.jsp" %>
 <% ProductRepository productDAO=ProductRepository.getInstance(); %>
<!DOCTYPE html>
<html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상세 정보</title>
<script>
 function addToCart(){
	 var result = confirm("상품을 장바구니에 추가하시겠습니까?");
	/*  alert(result); */
	if(result){
		document.addForm.submit();//submit(): form내의 input 태그정보를 전달하는 함수
	}else{
		document.addForm.reset();//reset():form내의 input 태그 정보 초기화 하는 함수
	}
 }
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div  class="jumbotron">
   <div class="container">
   	<h1 class="display-3">상품정보</h1>
   	<%
   			String id = request.getParameter("id");
   	        Product product = productDAO.getProductById(id);
   	%>
   	<div class="container">
   	   <div class="row">
   	         <div class="col-md-5">
   	              <img src="./resources/images/<%=product.getFilename()%>" style="width: 100%">
   	         </div>
   	   		<div class="col-md-6">
   	   			<h3><%=product.getPname() %></h3>
   	   			<p><%=product.getDescription() %></p>
   	   			<p><b>상품코드:</b>
   	   			 <span class="badge badge-danger">
   	   			 <%=product.getProductId() %>
   	   			 </span></p>
   	   			<p><b>제조사:</b><%= product.getManufacturer()%></p>
   	   			<p><b>분류:</b><%=product.getCategory() %></p>
   	   			<p><b>재고수량:</b><%=product.getUnitsInStock() %></p>
   	   			<h4><%=product.getUnitPrice() %></h4>
   	   			<p>
   	   			      <form name="addForm" 
   	   			                action="./addCart.jsp?id=<%=product.getProductId()%>"
   	   			                method="post">
   	   			      <a href="#" class="btn btn-info" 
   	   			                          onclick="addToCart()">상품주문&raquo;</a>
   	   			      <a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a> 
   	   			      <a href="./products.jsp" class="btn btn-secondary">상품목록&raquo; </a>
   	   			     </form>
   	   		</div><!-- col-md-6 끝. -->
   	   </div><!-- row 끝. -->
   	</div><!--container 끝.  -->
   </div><!-- container 끝. -->
</div><!-- jumbotron 끝.  -->
<jsp:include page="footer.jsp"/>
</body>
</html>