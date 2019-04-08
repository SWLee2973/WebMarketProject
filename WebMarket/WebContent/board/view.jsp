<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시글 내용보기</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">게시글 내용보기</h1>
  	</div>
  </div>
    <div class="container">
      <form action="BoardUpdateAction.do" 
      			name="newUpdate"
      			class="form-horizontal"
      			method="post">
      			<input type="hidden" name="pageNum" value="${pageNum}">
      			<input type="hidden" name="num" value="${num}">
      			<input type="hidden" name="items" value="${items}">
      			<input type="hidden" name="text" value="${text}">
      		<div class="form-group now">
      			<label class="col-sm-2 control-label">이름</label>
      			<div class="col-sm-3">
      				<input type="text" name="name" class="form-control" value="${board.name }">
      			
      			</div>
      		</div>
      		<div class="form-group now">
      			<label class="col-sm-2 control-label">제목</label>
      			<div class="col-sm-5">
      				<input type="text" name="subject" class="form-control" value="${board.subject }">
      			
      			</div>
      		</div>
      		<div class="form-group now">
      			<label class="col-sm-2 control-label">내용</label>
      			<div class="col-sm-8" style="word-break:break-all;">
      				<textarea rows="5" cols="50" class="form-control" name="content">${board.content}</textarea>
      			
      			</div>
      		</div>
      		<div class="form-group now">
      			<div class="col-sm-offset-2 col-sm-10">
      				<c:set var="userId" value="${board.id }"/>
      				<c:if test="${sessionId==userId || sessionId=='admin'}">
      				<p>
      				<a href="./BoardDeleteAction.do?pageNum=${pageNum }&num=${num}&items=${items}&text=${text}"
      					class="btn btn-danger">삭제</a>
      					<input type="submit" class="btn btn-warning" value="수정">
      				</c:if>
      				<a href="./BoardList.do?pageNum=${pageNum }&num=${num}&items=${items}&text=${text}"
      					class="btn btn-primary">&laquo;목록</a>
      			</div>
      		</div>
      	
      	
      </form>
    </div>
  <jsp:include page="../footer.jsp"/>
</body>
</html>