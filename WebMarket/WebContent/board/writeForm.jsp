<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
		String sessionId =(String)session.getAttribute("sessionId");
		String pageNum = (String)request.getAttribute("pageNum");
		String items = (String)request.getAttribute("items");
		String text = (String)request.getAttribute("text");
%>
<html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script>
function checkForm(){
	if(!document.newWriter.name.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(!document.newWriter.subject.value){
		alert("제목을 입력하세요.");
		return false;
	}
	if(!document.newWriter.content.value){
		alert("내용을 입력하세요.");
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
  <div class="jumbotron">
  	<div class="container">
  			<h1 class="display-3">게시판 글쓰기</h1>
  	</div>
  </div>
    <div class="container">
      <form name="newWrite" action="./BoardWriteAction.do"
                  class="form-horizontal" method="post" 
                  onsubmit="return checkForm()" >
      <input type="hidden" name="id" class="form-control" 
                            value="${sessionId}">
       <input type="hidden" name="pageNum" class="form-control" 
                            value="${pageNum}">
		<input type="hidden" name="items" class="form-control" 
                            value="${items}">
		<input type="hidden" name="text" class="form-control" 
                            value="${text}">
       <div class="form-group row">
          <label class="col-sm-2 control-label">성명</label>
        <div class="col-sm-3">
        	<input type="text" name="name" class="form-control" 
        	           value="${name}" placeholder="name">
        </div>
       </div>
       <div class="form-group row">
          <label class="col-sm-2 control-label">제목</label>
        <div class="col-sm-5">
        	<input type="text" name="subject" class="form-control" 
        	           placeholder="subject">
        </div>
       </div>
      <div class="form-group row">
          <label class="col-sm-2 control-label">내용</label>
        <div class="col-sm-8">
        	<textarea rows="5" cols="50" class="form-control" name="content"></textarea>
        </div>
       </div>
       <div class="form-group row">
          <div class="col-sm-offset-2 col-sm-10">
          	<input type="submit" class="btn btn-primary" value="등록">
          	<input type="submit" class="btn btn-warning" value="취소">
        </div>
       </div>
      </form>
    </div>
  <jsp:include page="../footer.jsp"/>
</body>
</html>