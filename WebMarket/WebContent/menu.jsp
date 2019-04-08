<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 		String sessionId = (String)session.getAttribute("sessionId");
 %>   
<nav class="navbar navbar-expand  navbar-dark bg-dark">
   <div class="container">
   		<div>
   		    <a class="navbar-brand" href="./welcome.jsp">Home</a>
   		</div>
   		<div>
   		    <ul class="navbar-nav mr-auto">
   		       <c:choose>
   		           <c:when test="${empty sessionId}"><!-- ${empty object} -->
   		            <!-- 세션이이 없을 때 -->
   		            <li class="nav-item">
   		                <a class="nav-link" 
   		                       href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
   		             </li>
   		             <li class="nav-item">
   		                <a class="nav-link" 
   		                       href="<c:url value="/member/addMember.jsp"/>">회원가입</a>
   		             </li>  
   		           </c:when>
   		           <c:otherwise>
   		           <!-- 세션이 있을 때  -->
   		           <li style="padding-top:7px; color:white">[<%=sessionId%>님]</li>
   		           <li class="nav-item">
   		                <a class="nav-link" 
   		                       href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
   		             </li>
   		             <li class="nav-item">
   		                <a class="nav-link" 
   		                       href="<c:url value="/member/updateMember.jsp"/>">회원수정</a>
   		             </li>  
   		           </c:otherwise>
   		       </c:choose>
<li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/products.jsp">상품목록</a></li>
 <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/addProduct.jsp">상품등록</a></li>
 <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/editProduct.jsp?edit=update">상품수정</a></li>
 <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/editProduct.jsp?edit=delete">상품삭제</a></li>
 <li class="nav-item"><a class="nav-link" href="<%=getServletContext().getContextPath() %>/BoardList.do?pageNum=1">게시판</a></li>
   		    </ul>
   		</div>
   </div>
</nav>