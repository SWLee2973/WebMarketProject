<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%><%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<%
	 String cartId=session.getId();
%>
<title>장바구니</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">장바구니</h1>
  	</div>
    <div class="container">
         <div class="row">
          <table width="100%">
             <tr>
             <td align="left">
             <a href="./deleteCart.jsp?cartId=<%=cartId%>" 
                                       class="btn btn-danger">삭제하기</a></td>
             <td align="right">
             <a href="./shippingInfo.jsp?cartId=<%=cartId%>"
                                      class="btn btn-success">주문하기</a>
             </td>
             </tr>
          </table>	    
    	 </div>
    	 <div style="padding-top:50px">
    	    <table class="table table-hover">
    	    	<tr>
    	           <th>상품</th>
    	           <th>가격</th>
    	           <th>수량</th>
    	           <th>소계</th>
    	           <th>비고</th>
    	        </tr>
    	           <%
    	                DecimalFormat df=new DecimalFormat("#,##0");
    	           	    int sum=0;//총액 저장 변수
    	           	    ArrayList<Product> cartList 
    	           	            =(ArrayList<Product>)session.getAttribute("cartlist");
    	           	    if(cartList==null)//ssion에 cartlist가 없으면 새로 생성
    	           	    	cartList =new ArrayList<Product>();
    	           	    for(int i=0;i<cartList.size();i++){
    	           	    	Product product = cartList.get(i);
    	           	    	int total = product.getUnitPrice()*product.getQuantity();//단가*수량
    	           	    	sum+=total;//전체 상품가격
    	           	    %>
    	           	    	<tr>
    	           	    	 <td><p class="badge badge-success"><%=product.getProductId() %></p> <%=product.getPname() %></td>
    	           	    	 <td><%=df.format(product.getUnitPrice())%></td>
    	           	    	 <td><%=df.format(product.getQuantity()) %></td>
    	           	    	 <td align="right"><%=df.format(total) %></td>
    	           	    	 <td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" 
    	           	    	            class="badge badge-danger">삭제</a></td>
    	           	    	</tr>
    	           	   <% 	
    	           	    } //for문 끝.   	           
    	           %>
    	           <tr>
    	            <th></th>
    	            <th></th>
    	            <th>총액</th>
    	            <th align="right"><%=df.format(sum) %></th>
    	            <th></th>
    	           </tr>
    	    </table>
     <a href="./products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
    </div>
    <hr>
  </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>