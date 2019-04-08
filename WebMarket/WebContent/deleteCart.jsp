<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
      //카트 id를 파라미터로 받음
      String id=request.getParameter("cartId");
      if(id==null||id.trim().equals("")){
    	  response.sendRedirect("cart.jsp");
    	  return;
      }
      //session 정보 삭제
       session.invalidate();
      //장바구니 페이지로 이동
       response.sendRedirect("cart.jsp");
%>