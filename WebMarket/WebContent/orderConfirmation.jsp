<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<%
	  request.setCharacterEncoding("utf-8");
		String cartId = session.getId();
		System.out.println("cartId="+cartId);
		
		//쿠키로 부터 정보를 저장할 변수 생성
		String Shipping_cartId="";
	    String Shipping_name="";
	    String Shipping_shippingDate="";
	    String Shipping_country="";
	    String Shipping_zipCode="";
	    String Shipping_addressName="";
      //쿠키로 부터 정보 얻어서 저장
      Cookie[] cookies = request.getCookies();
      //배열로부터 쿠키 정보 얻기
      if(cookies!=null){
    	  for(int i=0;i<cookies.length;i++){
    		  Cookie thisCookie = cookies[i];//쿠키배열의 i번째 쿠키객체를 thisCookie에 저장
    		  String n=thisCookie.getName();//쿠키이름을 얻기 getName()
    		  if(n.equals("Shipping_cartId")){
    			  Shipping_cartId=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }else if(n.equals("Shipping_name")){
    			  Shipping_name=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }else if(n.equals("Shipping_shippingDate")){
    			  Shipping_shippingDate=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }else if(n.equals("Shipping_country")){
    			  Shipping_country=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }else if(n.equals("Shipping_zipCode")){
    			  Shipping_zipCode=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }else if(n.equals("Shipping_addressName")){
    			  Shipping_addressName=URLDecoder.decode(thisCookie.getValue(),"utf-8");
    		  }
    	  }
      }
%>
<title>장바구니</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">주문정보</h1>
  	</div>
  	</div>
    <div class="container col-8 alert alert-info">
       <div class="text-center">
          <h1>영수증</h1>
       </div>
 
         <div class="row justify-content-between">
              <div class="col-4" align="left">
                  <strong>배송주소</strong>
                  <br>성명:<%out.print(Shipping_name); %><br>
                  우편번호:<% out.print(Shipping_zipCode); %><br>
                  주소:<%out.print(Shipping_addressName); %>(<%out.print(Shipping_country); %>)<br>
              </div>
              <div class="col-4" align="right">
                  <p><em>배송일:<%out.print(Shipping_shippingDate); %></em>
              </div>
    	 </div>
    	 
    	 <div>
    	    <table class="table table-hover">
    	    	<tr>
    	           <th class="text-center">도서</th>
    	           <th class="text-center">#</th>
    	           <th class="text-center">가격</th>
    	           <th class="text-center">소계</th>
    	           
    	        </tr>
    	       <%
				//정보 출력
				  DecimalFormat df = new DecimalFormat("#,##0");
				  int sum=0;//총계
				  ArrayList<Product> cartList 
				              = (ArrayList<Product>)session.getAttribute("cartlist");
				  System.out.println("카트목록:"+cartList.size());
				  if(cartList==null)
					  cartList = new ArrayList<Product>();
				  //카트리스트에서 정보 출력
				  for(int i=0;i<cartList.size();i++){
					  Product product = cartList.get(i);
					  int total=product.getUnitPrice() * product.getQuantity();//단가*수량
					  sum+=total;//총액에 개별상품의 가격추가
    	           	%>
    	           	<tr>
    	           	  <td class="text-center"><%=product.getPname()%></td>
    	           	  <td class="text-center"><%=df.format(product.getQuantity())%></td>
    	           	  <td class="text-center"><%=df.format(product.getUnitPrice())%></td>
    	           	  <td class="text-center"><%=df.format(total)%>원</td>
    	           
    	           </tr>
					<%
    	           	    } //for문 끝.   	           
					%>    
				  <tr>
    	            <th></th>
    	            <th></th>
    	            <th class="text-right"><strong>총액:</strong></th>
    	            <th class="text-center text-danger"><strong><%=df.format(sum) %>원</strong></th>
    	           </tr>
    	    </table>
   <a href="./shippingInfo.jsp?cartId=<%=Shipping_cartId%>" 
                       class="btn btn-secondary" role="button">이전</a> 
     <a href="./thankCustomer.jsp" 
                        class="btn btn-success" role="button">주문완료</a>
     <a href="./checkOutCancelled.jsp" 
                        class="btn btn-secondary" role="button">취소</a>
    </div>
    <hr>
  </div>
  <jsp:include page="footer.jsp"/>
</body>
</html>