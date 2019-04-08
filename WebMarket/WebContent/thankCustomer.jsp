<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body>
<%
		String shipping_cartId="";
        String shipping_name="";
        String shipping_shippingDate="";
        String shipping_country="";
        String shipping_zipCode="";
        String shipping_addressName="";
        
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){
        	for(int i=0;i<cookies.length;i++){
        		   Cookie cookie = cookies[i];
        		   String n = cookie.getName();
        		   if(n.equals("Shipping_cartId")){
        			   shipping_cartId=URLDecoder.decode(cookie.getValue(),"utf-8");
        		   }else if(n.equals("Shipping_shippingDate")){
        			   shipping_shippingDate=URLDecoder.decode(cookie.getValue(),"utf-8");
        		   }
        	}
        }
%>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	 <div class="container">
  			<h1 class="display-3">주문 완료</h1>
  	  </div>
  </div>
    <div class="container">
     <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
       <p> 주문은 <% out.print(shipping_shippingDate); %>에 배송될 예정입니다.!
       <p> 주문번호:<%out.print(shipping_cartId); %>
   </div>
   <div class="container">
      <p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품목록</a>
   </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>
<%
		 session.invalidate();//로그아웃처리(세션정보 삭제)
		 for(int i=0;i<cookies.length;i++){
			 Cookie cookie = cookies[i];
			 String n=cookie.getName();
			 if(n.equals("Shipping_cartId")){
				 cookie.setMaxAge(0);
			 }else if(n.equals("Shipping_addressName")){
				 cookie.setMaxAge(0);
			 }else if(n.equals("Shipping_country")){
				 cookie.setMaxAge(0);
			 }else if(n.equals("Shipping_name")){
				 cookie.setMaxAge(0);
			 }else if(n.equals("Shipping_shippingDate")){
				 cookie.setMaxAge(0);
			 }else if(n.equals("Shipping_zipCode")){
				 cookie.setMaxAge(0);
			 }
			 //응답객체에 쿠키를 실어 보냄.
			 response.addCookie(cookie);
		 }
		 
		

%>