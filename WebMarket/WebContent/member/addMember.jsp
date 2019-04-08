<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<%
	Calendar cal = Calendar.getInstance();
	String month = String.valueOf(cal.get(Calendar.MONTH));
	int year = Integer.valueOf(cal.get(Calendar.YEAR));
%>
<script>
function sel(obj){
	var index = obj.selectedIndex;
	var email = document.newMember.mail1.value;
	if(index > 0){
		email = email.substr(0, email.indexOf('@'));
		email += '@' + obj.options[index].value;
		document.newMember.mail1.value = "";
	} else{
		document.newMember.mail1.value = "";
	}
}

function openChk(){
	var id = document.getElementById('id').value;
	if(!id){
		alert('id를 입력하세요.');
		document.getElementById('id').focus();
		return;
	}
	window.open("id_chk.jsp?id=" + id, "idCheck");
}
</script>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
		<div class="container">
			<form name="newMember" class="form-horizontal" 
						action="processAddMember.jsp" method="post"
						onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>				
					<div class="col-sm-3">
						<input type="text" id="id" class="form-control" 
									name="id" placeholder="Input id...">
					</div>
						<input type="button" value="중복확인" 
									onclick="openChk()" class="btn btn-primary">
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>				
					<div class="col-sm-3">
						<input type="password" id="password" class="form-control" 
									name="password" placeholder="Input password...">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>				
					<div class="col-sm-3">
						<input type="password" id="password" class="form-control" 
									name="password_confirm" placeholder="Input password...">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이름</label>				
					<div class="col-sm-3">
						<input type="text" id="name" class="form-control" 
									name="name" placeholder="Input name...">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">성별</label>				
					<div class="col-sm-10">
						<label><input type="radio" id="gender" name="gender" value="남" checked>남</label>&nbsp;&nbsp;
						<label><input type="radio" id="gender" name="gender" value="여">여</label>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">생일</label>				
					<div class="col-sm-10">
						<select name="birthyy">
							<c:forEach var="y" begin="1900" end="<%=year %>">
								<option value="${y }">${y }년</option>
							</c:forEach>
						</select>		
						<select name="birthmm">
							<c:forEach var="m" begin="1" end="12">
								<option value="${m }">${m }월</option>
							</c:forEach>
						</select>						
						<label><input type="text" name="birthdd" id="birthdd"
									maxlength="2" style="text-align: right; width: 2em; height: 25px;">일</label>
					</div>
				</div>
					
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>				
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50" 
										style="width: 5em; height: 25px;">&nbsp;@
						<select name="mail2" onchange="sel(this)">
							<option>선택</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>				
					<div class="col-sm-3">
						<input type="text" id="phone" class="form-control" 
									name="phone" placeholder="숫자만 입력하세요.">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>				
					<div class="col-sm-3">
						<input type="text" id="zipcode" class="form-control" 
									name="zipcode" readonly>
					</div>
					<input type="button" onclick="execDaumPostcode()" 
								class="btn btn-primary" value="우편번호 찾기"><br>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">주소</label>				
					<div class="col-sm-3">
						<input type="text" id="address" class="form-control" 
									name="address" placeholder="Input address...">
					</div>
				</div>
				<input type="hidden" id="detailAddress" placeholder="상세주소">
				<input type="hidden" id="extraAddress" placeholder="참고항목">
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="회원 가입">
						<input type="reset" class="btn btn-warning" value="다시 쓰기">
					</div>
				</div>
				
			</form>
		</div>
	<hr>
<jsp:include page="../footer.jsp"/>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
     /*  oncomplete:데이타 정상처리 되었을때 callback함수 
           {
    	      oncomplete:function(){}
           }
     */
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>