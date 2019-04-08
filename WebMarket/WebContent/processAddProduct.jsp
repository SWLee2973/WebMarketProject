<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	request.setCharacterEncoding("utf-8");
	//클라이언트에서 "multipart/form-data"로 넘어온 데이타 처리
	String filename="";
	/* String realFolder = "C:\\upload";//웹 어플리케이션 상의 절대 경로(시스템 경로) */
	String realFolder = getServletContext().getRealPath("./resources/images/");
	/* System.out.println("저장경로:"+getServletContext().getRealPath(realFolder)); */
	
	String encType = "utf-8";//인코딩 타입
	int maxSize = 5*1024*1024;//최대 전송 사이즈 5Mb
	//멀티 파트 객체 생성
	MultipartRequest multi = 
	                        new  MultipartRequest(request,
	                        		                            realFolder,
	                        		                            maxSize,
	                        		                            encType,
	                        		                            new DefaultFileRenamePolicy());
	
    //input type="file"이 아닌 일반태그 데이타들은 그대로 multi.getParameter()
    String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	if(unitPrice.isEmpty()) price=0;
	else price =Integer.valueOf(unitPrice);//int타입
	long stock;
	if(unitsInStock.isEmpty()) stock=0;
	else stock= Long.valueOf(unitsInStock);//long타입
	
	//클라이언트의 form내의 input type="file"인 태그의 값을 처리
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();//nextElement()는 Object -> String
	String fileName = multi.getFilesystemName(fname);//서버에 전송된 파일명, getOriginalFileName() 전송전의원래 파일명
	System.out.println("업로드 파일명:"+fileName);
	
	//싱글톤 객체 생성
	ProductRepository dao=ProductRepository.getInstance();
	
	Product product = new Product();
	
	product.setProductId(productId);
	product.setPname(pname);
	product.setUnitPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	product.setFilename(fileName);//upload된 파일명 저장
	
	 System.out.println("파일명=> :"+product.getFilename());
	 int result=dao.addProduct(product);
	  if(result>0){
		  out.print("<script>alert('입력성공!');location.href='products.jsp';</script>");
	  }else{
		  out.print("<script>alert('입력실패');history.back();</script>");
	  }
	//상품 리스트 페이지로 이동
	//브라우저에서(원점) 다시 products.jsp로 이동
	//response.sendRedirect("products.jsp");
%>

</body>
</html>