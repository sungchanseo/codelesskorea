<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
   
        var IMP = window.IMP; 
        IMP.init("imp88454102"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds; //주문일시
       
        function requestPay(data) {
            IMP.request_pay({
                pg : 'kcp',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '버즈2 오른쪽 : 테스트결제', //상품명
                amount : 100, //금액
                buyer_email : 'hysoo5223@gmail.com',
                buyer_name : name, // 구매자
                buyer_tel : '010-1234-5678', // 전화번호
                buyer_addr : '부산광역시 부산진구 부전동', //주소
                buyer_postcode : '123-456' // 우편변호
            }, function (rsp) { // callback 방식
            	console.log(rsp);
                if (rsp.success) {
                	// 결제 성공시 로직
            	var msg = '결제 완료';
                	// 주문서 페이지로 이동
              		
    		} else {
                	// 결제 실패시 로직
                	var msg = '결제 실패';
                	msg += '에러내용 : ' + rsp.error_msg;
                	alert(msg);
                    console.log(rsp);
                }
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
	<h1>주문서</h1>
	
	<fieldset>
	<legend>상품 정보</legend>
		상품번호 : <input type="text" name = "id" value="${dto.product_id }" readonly ><br>
		상품사진 : <img src="../img/img.jpg " width="100px"><br>
		상품이름 : <input type="text" name = "title" value="${dto.title }" readonly ><br>
		상품가격 : <input type="text" name = "price" value="${dto.price }" readonly ><br>
		배송비 여부 : 
			
	</fieldset>
		<hr>
	<fieldset>
	<legend>배송지 정보</legend>
	<!--  action주소가 없으면 자신의 페이지 호출 -->
		<form action="./AddrChangeAction.me" method="post" name="fr" >
		이름 : <input type="text" name = "이름" value="${dto.receiver_name }" placeholder="이름을 입력해주세요" ><br>
		전화번호 : <input type="text" name = 전화번호 value="${dto.receiver_phone }" placeholder="전화번호를 입력해주세요" ><br>
		주소 : <input type="text" name = "address" value="${dto.receiver_addr1 }" placeholder="주소를 입력해주세요" ><br>
		<input type="submit" value="변경하기">
		</form>
	</fieldset>
	
	<fieldset>
	<legend>결제정보</legend>
		총 금액 : ${dto.price } + ${dto.fee } <br> <!-- total로 컬럼 만드는게 더 편할수도.. -->
		결제수단 : <input type="radio" vlaue="카드결제"> 카드결제
		
		
	</fieldset>
	
	<hr>
	
	<fieldset>				
	이용약관 내용
	</fieldset>
	
	  <div class="checkbox_group">
	  <input type="checkbox" id="check_all" >
	  <label for="check_all">이용 약관 동의</label>
	  </div>
  
 	<br>
    <button onclick="requestPay()">결제하기</button> 
    
    
    
</body>
</html>