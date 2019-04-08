<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	 request.setCharacterEncoding("utf-8");

	 final int maxAge=365*24*60*60;//유효기간 1년
	 
      Cookie cartId = 
    		  new Cookie("Shipping_cartId",
    				            URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
      Cookie name = new Cookie("Shipping_name",
    		                    URLEncoder.encode(request.getParameter("name"),"utf-8"));
      Cookie shippingDate = new Cookie("Shipping_shippingDate",
    		                    URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
      Cookie country = new Cookie("Shipping_country",
    		                    URLEncoder.encode(request.getParameter("country"),"utf-8"));
      Cookie zipCode = new Cookie("Shipping_zipCode",
    		                    URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
      Cookie addresName=new Cookie("Shipping_addressName",
    		                    URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
      //유효기간 설정
      cartId.setMaxAge(maxAge);
      name.setMaxAge(maxAge);
      shippingDate.setMaxAge(maxAge);
      country.setMaxAge(maxAge);
      zipCode.setMaxAge(maxAge);
      addresName.setMaxAge(maxAge);
      //클라이언트로 전송 하면 클라이언트(브라우저)의 cookie 저장소에 저장
      response.addCookie(cartId);
      response.addCookie(name);
      response.addCookie(shippingDate);
      response.addCookie(country);
      response.addCookie(zipCode);
      response.addCookie(addresName);
      
      response.sendRedirect("orderConfirmation.jsp");

%>