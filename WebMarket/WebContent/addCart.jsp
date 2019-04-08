<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%><%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");//상품id
	if(id==null||id.trim().equals("")){//상품id가 넘어오지 않으면
		response.sendRedirect("products.jsp");//상품목록으로
		return;
	}
	//상품정보 처리 객체
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);//해당 id에 맞는 상품 정보 얻기
	if(product==null){//해당 상품이 없는 경우
		response.sendRedirect("exceptionNoProductId.jsp");//오류 페이지로 이동.
	}
	//상품정보 리스트 생성
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();//임시저장용 상품객체 생성
	for(int i=0;i<goodsList.size();i++){//리스트 반복하면서 하나씩 상품객체를 추출하여
		goods = goodsList.get(i);//임시저장 객체에 저장
		if(goods.getProductId().equals(id)){//임시저장 객체의 id와 파라미터로 넘어온 id비교
			break;//같으면 반복 종료
		}
	}//for문 끝.
	//cartList정보 생성
	//session에 cartlist명으로 객체가 저장되었는지 추출
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list==null){//cartlist가 없으면
		list = new ArrayList<Product>();//새로 생성
		session.setAttribute("cartlist", list);//새로 생성한 cartlist를 "cartlist"이름으로 세션에 저장
	}
	//
	int cnt =0;
	Product goodsQnt = new Product();//카트에 저장할 임시 상품객체
	for(int i=0;i<list.size();i++){//cartlist반복
		goodsQnt = list.get(i);//i번째 상품을 임시상품객체에 저장
		if(goodsQnt.getProductId().equals(id)){//id비교
			cnt++;//0->1,    3->4
			int orderQuantity = goodsQnt.getQuantity()+1;//기존의 주문수량 + 1
			goodsQnt.setQuantity(orderQuantity);//새로운 주문수량을 세팅(업데이트)
		}
	}
	//cnt=0 그대로, cartlist에 해당상품이 없어서, 추가를 못함.
	if(cnt==0){
		goods.setQuantity(1);//cart에 수량1로 신규등록
		list.add(goods);//등록
	}
	//cartlist에 등록 완료 후 상세페이지로 이동.
	response.sendRedirect("product.jsp?id="+id); 
	
%>