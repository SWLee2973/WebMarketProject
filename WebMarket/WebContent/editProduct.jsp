<%@page import="dto.Product"%><%@page import="java.util.ArrayList"%><%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ProductRepository productDAO = ProductRepository.getInstance(); %>
<%
  			ArrayList<Product> listOfProducts = productDAO.getAllProducts();
 %>    
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<script>
function deleteConfirm(id){
	if(confirm("해당상품을 삭제하시겠습니까?")==true)
		 location.href="./deleteProduct.jsp?id="+id;
	else
		return;
}

</script>
<title>상품 편집</title>
<%
		String edit = request.getParameter("edit");
%>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">상품 편집</h1>
  	</div>
  </div>
    <div class="container">
         <div class="row" align="center">
            <% 
                 for(int i=0;i<listOfProducts.size();i++){
                      Product product = listOfProducts.get(i);
             %>
             <div class="col-md-4">
                 <img src="<%=getServletContext().getContextPath()%>/resources/images/<%=product.getFilename()%>" 
                                  style="width:100%">
                 <h3><%=product.getPname() %></h3>
                 <p><%=product.getDescription() %>
                 <p><%=product.getUnitPrice() %>원
                 <p><%
                 			 if(edit.equals("update")){
                 %>
                 <a href="./updateProduct.jsp?id=<%=product.getProductId() %>"
                                        class="btn btn-success" role="button">수정 &raquo;</a>
                  <%
                 	     }else if(edit.equals("delete")){
                  %>                      
                  <a href="#" onclick="deleteConfirm('<%=product.getProductId() %>')"
                                        class="btn btn-success" role="button">삭제 &raquo;</a>
                  <%
                 	     }
                  %>
             </div>
             <%
                 }
             %>
    	 </div>
     </div>
    <hr>
  <jsp:include page="footer.jsp"/>
</body>
</html>