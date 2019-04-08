<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
       String productId = request.getParameter("id");
       ProductRepository dao = ProductRepository.getInstance();
       //해당상품 존재하는 확인
        if(dao.getProductById(productId)==null){
              out.print("<script>alert('일치하는 상품이 없습니다.');location.href='editProduct.jsp?edit=delete';</script>");  
        }else{
          int result=dao.deleteProduct(productId);
          if(result>0){
        	  out.print("<script>alert('삭제완료');location.href='products.jsp';</script>");
          }else{
        	  out.print("<script>alert('삭제오류');history.back();</script>");
          }
        }
 
%>