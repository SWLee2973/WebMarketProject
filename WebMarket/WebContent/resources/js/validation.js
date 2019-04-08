/**
 *   상품등록 validation 체크 자바스크립트
 */
 function CheckAddProduct(){
	   var productId = document.getElementById("productId");
	   var name = document.getElementById("pname");
	   var unitPrice = document.getElementById("unitPrice");
	   var unitsInStock = document.getElementById("unitsInStock");
	   
	   //상품 아이디 체크
	   //check(표현식,값,메세지)
	   if(!check(/^P[0-9]{4,11}$/,productId,"[상품코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요."))
		   return false;
	   
	   //상품명 체크
	   if(name.value.length<4 || name.value.length>12){
		   alert("[상품명]\n최소 4자에서 최대 12자 까지 입력하세요");
		   name.focus();
		   return false;
	   }
	   //상품 가격 체크
	   if(unitPrice.value.length==0||isNaN(unitPrice.value)){
		   alert("[가격]\n숫자만 입력하세요");
		   unitPrice.focus();
		   return false;
	   }
	   if(unitPrice.value<0){
		   alert("[가격]\n음수를 입력할 수 없습니다.");
		   unitPrice.focus();
		   return false;
	   }else if(!check(/^\d+(?:[.]?[\d]?[\d])$/,unitPrice,'[가격]\n소수점 둘째자리까지만 입력하세요'))
		  return false;
	   
	   //재고수량 체크
	   if(isNaN(unitsInStock.value)){
		   alert("[재고수량]\n숫자만 입력하세요.");
		   unitsInStock.focus();
		    return false;
	   }if(unitsInStock.value < 0){
		   alert("[재고수량]\n음수를 입력할 수 없습니다.");
		   unitsInStock.focus();
		   return false;
	   }else if(!check(/^\d+([\d])$/,unitsInStock,'[재고수량]\n 정수로 입력하세요'))
		  return false;
	   
	   //
	   return true;
   }
   
   
   //정규표현식으로 입력값 검증 함수
  function check(regExp,e,msg){
	  if(regExp.test(e.value)){//정규표현식 과 입력값과 비교해서 조건에 맞으면 true 아니면 false
		  return true;
	  }
	  alert(msg);
	  e.select();//e.focus();
	  e.focus();
	  return false;
  }