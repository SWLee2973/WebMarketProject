<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     //상품아이디 얻기
     String id = request.getParameter("id");
    //상품아이디가 없으면 상품리스트로 이동 
    if(id==null||id.trim().equals("")){
    	 response.sendRedirect("products.jsp");
    	 return;
     }
    //상품처리 객체에서 해당 아이디에 맞는 상품 얻기
    ProductRepository dao = ProductRepository.getInstance();
    Product product = dao.getProductById(id);
    //아이디에 맞는 상품이 없으면 해당상품 없음 페이지로 이동
    if(product==null){
    	response.sendRedirect("exceptionNoProductId.jsp");
    }
    
    ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
    Product goodsQnt = new Product();
    for(int i=0;i<cartList.size();i++){
    	goodsQnt = cartList.get(i);
    	if(goodsQnt.getProductId().equals(id)){//id에 해당하는 상품 찾아서
    		cartList.remove(goodsQnt);//cartlist에 해당 객체를 제거 remove(object)
    	}
    }
    //삭제 작업 완료 후 cart로 이동하여 변경된 cart정보 출력
    response.sendRedirect("cart.jsp");
   
%>