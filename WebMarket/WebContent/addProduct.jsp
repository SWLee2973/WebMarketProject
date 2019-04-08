<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품등록</title>
<script src="./resources/js/validation.js"></script><!-- 파일로 저장한 js파일 링크 -->
</head>
<body>
<fmt:setLocale value='<%=request.getParameter("language") %>'/>
<fmt:bundle basename ="bundle.message">
<jsp:include page="menu.jsp"/>
<div  class="jumbotron">
   <div class="container">
   	<h1 class="display-3"><fmt:message  key="title"/></h1>
   </div>
 </div><!-- jumbotron 끝.  -->  	
 <div class="container">
    <div class="text-right">
      <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
    </div>
	 <form name="newProduct" action="./processAddProduct.jsp" class="form-hrizontal" 
	           method="post" enctype="multipart/form-data"><!-- 파일을 전송할수있는 문서 타입  -->
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="productId"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="productId"  id="productId" class="form-control">
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="pname"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="pname" id="pname" class="form-control">
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="unitPrice"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="unitPrice" id="unitPrice" class="form-control">
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="description"/></label>
	     <div class="col-sm-5">
	     		<textarea rows="2" cols="50" name="description" class="form-control"></textarea>
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="manufacturer"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="manufacturer" class="form-control">
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="category"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="category" class="form-control">
	     </div>
	 </div>
	   <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
	     <div class="col-sm-3">
	     		<input type="text" name="unitsInStock"  id="unitsInStock" class="form-control">
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="condition"/></label>
	     <div class="col-sm-5">
	     		<input type="radio" name="condition"  value="New" checked><fmt:message key="condition_New"/>
	     		<input type="radio" name="condition"  value="Old"><fmt:message key="condition_Old"/>
	     		<input type="radio" name="condition"  value="Refurbished"><fmt:message key="condition_Refurbished"/>
	     </div>
	 </div>
	 <div class="form-group row">
	     <label class="col-sm-2"><fmt:message key="productImage"/></label>
	     <div class="col-sm-5">
	     		<input type="file" name="productImage" class="form-control">
	     </div>
	 </div>
	 
	 <div class="form-group row">
	     <div class="col-sm-offset-2 col-sm-10">
	     		<input type="submit" value="<fmt:message key='button'/>" class="btn btn-primary" onclick="return CheckAddProduct()">
	     </div>
	 </div>
	 </form>
   	</div><!--container 끝.  -->
<jsp:include page="footer.jsp"/>
</fmt:bundle><!-- fmt의 끝. -->
</body>
</html>