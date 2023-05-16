<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <%@ include file="../head.jsp"%>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    // 주소 메서드
    function addr() {
		new daum.Postcode({
			    oncomplete : function(data) {
				document.getElementById("receiver_post").value = data.zonecode; // 우편 번호 넣기
				document.getElementById("receiver_addr1").value = data.address; // 주소 넣기
			}
		}).open();
	};
	// 변수
    var order_id ="";
    var email ="";
    var name ="";
    var receiver_phone ="";
    var receiver_addr1 ="";
    var receiver_addr2 ="";
    var receiver_post ="";
    var amount ="";
    var product_id ="";
    var title ="";
    var payment ="";
    $(function(){
    	order_id = $('#order_id').attr('value');
    	email = $('#id').attr('value');
    	name = $('#receiver_name').attr('value');
    	receiver_phone = $('#receiver_phone').attr('value');
    	receiver_addr1 = $('#receiver_addr1').attr('value');
    	receiver_addr2 = $('#receiver_addr2').attr('value');
    	receiver_post = $('#receiver_post').attr('value');
    	amount = $('#amount').attr('value');
    	product_id = $('#product_id').attr('value');
    	title = $('#title').attr('value');
    	payment = $('.pm:checked').val();
    	console.log(name);
    	console.log(email);
    	console.log(payment);
    }); //(document).ready
    	
        var IMP = window.IMP; 
        IMP.init("imp88454102"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds; //주문일시
       	var year = today.getFullYear(); // 년도
       	var month = today.getMonth() + 1;  // 월
       	var date = today.getDate();  // 날짜
       	var day = today.getDay();  // 요일
     	// 두자리 수를 표현하기 위한 0 추가 
        if(month <10){ month = "0"+month; } 
        if(date <10){ date = "0"+date; }      
       	var order_date = year+"-"+month+"-"+date+" "+hours+":"+minutes+":"+seconds; //주문일시
       	
       	// 결제
        function requestPay() {
        	// 약관동의 결제제한
        	if($('#checkbox').is(':checked') == false){
    			alert('약관에 동의해주세요.');
    			$('#checkbox').focus();
    			return false;
    	 	}
        	// 카드결제
        	if($('.pm:checked').val() == "html5_inicis"){
        	var pay_form = {
                    pg : 'html5_inicis',
                    pay_method : 'card',
                    merchant_uid: "IMP"+makeMerchantUid, 
                    name : title, //상품명
                    amount : amount, //금액
                    buyer_email : email,
                    buyer_name : name, // 구매자
                    buyer_tel : receiver_phone, // 전화번호
                    buyer_addr : receiver_addr1, //주소
                    buyer_postcode : receiver_post // 우편변호
                };
			// 카카오페이
        	}else if($('.pm:checked').val() == "kakaopay"){
            	var pay_form = {
                        pg : 'kakaopay',
                        pay_method : 'EASY_PAY',
                        merchant_uid: "IMP"+makeMerchantUid, 
                        name : title, //상품명
                        amount : amount, //금액
                        buyer_email : email,
                        buyer_name : name, // 구매자
                        buyer_tel : receiver_phone, // 전화번호
                        buyer_addr : receiver_addr1, //주소
                        buyer_postcode : receiver_post // 우편변호
                    };
        	}
        	console.log(pay_form);
            IMP.request_pay(pay_form, function (rsp) { 
            	console.log(rsp);
                if (rsp.success) {
                	// 결제 성공시 로직
                	var msg = '결제가 완료되었습니다.';
//                 			msg += '\n주문일시 : ' + order_date;
//                 			msg += '\n고유ID : ' + rsp.imp_uid;
//                 			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
//                 			msg += '\결제 금액 : ' + rsp.paid_amount;
//                 			msg += '카드 승인번호 : ' + rsp.apply_num;
                	alert(msg);
                	
                	var data ={
                			order_id : order_id,
                			product_id : product_id,
                			order_date : order_date,
                			name : name,
                			receiver_phone : receiver_phone,
                			receiver_addr1 : receiver_addr1,
                			receiver_addr2 : receiver_addr2,
                			receiver_post : receiver_post,
                			amount : amount,
                			payment : payment
                			}

                	$.ajax({
    					type : 'post',
    	 				url : './OrderAddAction.or',
    	 				data : data,
    	 				dataType : 'TEXT',
    	 				error: function(xhr, status, error){
    	 					alert(error);
    	 				},
    	 				success : function(text){
//     	 					msg : "데이터 전송 성공";
//     	 					alert(msg);
    	 					
						location.href="./OrderContent.or?product_id="+product_id+"&order_id="+order_id;
    	 				}
                	})// ajax
    	 				
                	// form 태그 JS에서 생성해서 파라미터 전달
// 					const form = document.createElement('form');       		// form 태그 생성 
// 					var order_id_objs = document.createElement('input');    // 값을 넣을 input 생성 
// 					order_id_objs.setAttribute('type', 'hidden');           // 값의 type
// 					order_id_objs.setAttribute('name', 'order_id');         // 값을 담을 변수 이름
// 					order_id_objs.setAttribute('value', order_id);      	// 값 
//                     form.appendChild(order_id_objs);
					
//                     var product_id_objs = document.createElement('input');    
//                     product_id_objs.setAttribute('type', 'hidden');           
//                     product_id_objs.setAttribute('name', 'product_id');         
//                     product_id_objs.setAttribute('value', product_id);     
//                     form.appendChild(product_id_objs);
					
//                     var order_date_objs = document.createElement('input');   
//                     order_date_objs.setAttribute('type', 'hidden');           
//                     order_date_objs.setAttribute('name', 'order_date');      
//                     order_date_objs.setAttribute('value', order_date);     
//                     form.appendChild(order_date_objs);
					
// 					var uid_objs = document.createElement('input');              
//                     uid_objs.setAttribute('type', 'hidden');                                 
//                     uid_objs.setAttribute('name', 'imp_uid');                
//                     uid_objs.setAttribute('value', rsp.imp_uid);          
//                     form.appendChild(uid_objs);
                    
//                     var merchant_uid_objs = document.createElement('input');           
//                     merchant_uid_objs.setAttribute('type', 'hidden');                 
//                     merchant_uid_objs.setAttribute('name', 'merchant_uid');          
//                     merchant_uid_objs.setAttribute('value', rsp.merchant_uid);        
//                     form.appendChild(merchant_uid_objs);
                    
//                     var paid_amount_objs = document.createElement('input');       
//                     paid_amount_objs.setAttribute('type', 'hidden');               
//                     paid_amount_objs.setAttribute('name', 'paid_amount');          
//                     paid_amount_objs.setAttribute('value', rsp.paid_amount);        
//                     form.appendChild(paid_amount_objs);
                    
//                     var apply_num_objs = document.createElement('input');       
//                     apply_num_objs.setAttribute('type', 'hidden');             
//                     apply_num_objs.setAttribute('name', 'apply_num');          
//                     apply_num_objs.setAttribute('value', rsp.apply_num);      
//                     form.appendChild(apply_num_objs);
                    
//                     form.setAttribute('method', 'post');                     
//                     form.setAttribute('action', './OrderContent.or');   
//                     form.setAttribute('accept-charset', 'utf-8');   
//                     document.body.appendChild(form);
//                     form.submit();
                	}else{
                	// 결제 실패시 로직
                	var msg = '결제 실패';
                	msg += '에러내용 : ' + rsp.error_msg;
                	alert(msg);
                    console.log(rsp);
                } //else
            } //function(rsp)
            ); // IMP.request_pay()
    } // function requestPay()
        
    </script>

    <style type="text/css">

	
	
	</style>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
<%-- <%@ include file="../nav.jsp"%><!-- nav 삽입 --> --%>

<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin: 50px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">주 문 서</h1>
<hr style="border: 0;height: 3px; background-color: black;">

<!-- 	<h1>주문서</h1> -->
	
	
	<fieldset>
	<legend>상품 정보</legend>
<%-- 		<input type="hidden"  name = "id" value="${dto.product_id }" readonly ><br> --%>
		<input type="hidden" id="title" name = "title" value="${dto.title }" readonly >
		상품번호 : ${dto.product_id }<br>
<!-- 		상품사진 :  -->
		<img src="${dto.product_image}" alt="이미지 없음" width="200px"><br>
		상품이름 : ${dto.title }<br>
		상품가격 : <input type="text" name = "price" value="${dto.price }" readonly ><br>
		배송비 : <input type="text" name = "price" value="${dto.fee }" readonly ><br>
			
	</fieldset>
		<hr>
	<!-- 체크박스 수정중 -->
<!-- 	<form name="ship" method="post"> -->
<!-- 	 <fieldset> -->
<!--                 <legend>배송 정보</legend> -->
<!--                 <ul> -->
<!--                     <li> -->
<!--                         <input type="checkbox" id="shippingInfo" name="shippingInfo"> -->
<!--                         <label for="bill_info" class="check">주문 정보와 배송 정보가 같습니다.</label> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <label class="field" for="receiver_name">이름: </label>  -->
<!--                         <input type="text" class="input-box" id="receiver_name" name="receiver_name"> -->
<%--                         <input type="hidden" id = "receiver_name3" name = "receiver_name3" value="${dto.name}"> --%>
<!--                     </li> -->
<!--                     <li> -->
<!--                         <label class="field" for="shippingTel">연락처: </label>  -->
<!--                         <input type="text" class="input-box" id="receiver_phone" name="receiver_phone"> -->
<%--                         <input type="hidden" id = "receiver_phone3" name = "receiver_phone3" value="${dto.phone_number}"> --%>
<!--                     </li> -->
                    
<!--                     <li> -->
                    
<!--                         <label class="field" for="shippingAddr">주소: </label>  -->
<!-- <!--                         <input type="text" class="input-box" id="shippingAddr" name="shippingAddr"> -->
<!--                         <table> -->
<!--                         <tr> -->
<!--                         <td> -->
<%--                         <input type="hidden" name="receiver_post3" id="receiver_post3" size="15" value="${dto.post_number}" readonly> --%>
<!-- 							<input type="text" class="input-box" id="receiver_post" name="receiver_post" size="15" readonly > -->
<!-- 							<input type="button" value="우편번호찾기"  onclick="addr();"></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td><input type="text" class="input-box" id="receiver_addr1" name="receiver_addr1" size="45"  onclick="addr();"></td> -->
<%-- 						<td><input type="hidden" name="receiver_addr13" id="receiver_addr13" value="${dto.address}" ></td> --%>
<!-- 					<tr> -->
<!-- 					<tr> -->
<!-- 						<td><input type="text" class="input-box" id="receiver_addr2" name="receiver_addr2"  size="45"  placeholder="상세주소를 입력해주세요."></td> -->
<%-- 						<td><input type="hidden" name="receiver_addr23" id="receiver_addr23" value="${dto.address2}"  size="45"  placeholder="상세주소를 입력해주세요."></td> --%>
<!-- 					<tr> -->
<!-- 					</table> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </fieldset> -->
<!--                  </form> -->
       
        <script>
//     // 주소 체크박스
//     var check = document.querySelector("#shippingInfo"); //체크박스의 id

//     check.addEventListener("click", function() { //check요소에 이벤트가 발생했을 때 실행할 함수
//         var nameInfo = document.querySelector("#receiver_name3").value;
//         var telInfo = document.querySelector("#receiver_phone3").value;
//         var addrInfo = document.querySelector("#receiver_addr13").value;
//         var addr2Info = document.querySelector("#receiver_addr23").value;
//         var postInfo = document.querySelector("#receiver_post3").value;

//         if(check.checked == true) { //체크되었다면
//             document.querySelector("#receiver_name").value = nameInfo; //이름을 배송정보에 복사
//             document.querySelector("#receiver_phone").value = telInfo;
//             document.querySelector("#receiver_addr1").value = addrInfo;
//             document.querySelector("#receiver_addr2").value = addr2Info;
//             document.querySelector("#receiver_post").value = postInfo;
//         }
//         else {
//             document.querySelector("#receiver_name").value = "";
//             document.querySelector("#receiver_phone").value = "";
//             document.querySelector("#receiver_addr1").value = "";
//             document.querySelector("#receiver_addr2").value = "";
//             document.querySelector("#receiver_post").value = "";
//         }
//     });
    </script>
<fieldset>
	<legend>배송 정보</legend>
		<form action="./AddrChangeAction.or" method="post" >
		<input type="hidden" id = "order_id" name="order_id" value="${dto.order_id}">
		<input type="hidden" id = "id" name="id" value="${dto.id}">
		<input type="hidden" id = "product_id" name="product_id" value="${dto.product_id}">
		이름 : <input type="text" id = "receiver_name" name = "receiver_name" value="${dto.receiver_name}" placeholder="이름을 입력해주세요" ><br>
		전화번호 : <input type="text" id = "receiver_phone" name = "receiver_phone" value="${dto.receiver_phone}" placeholder="전화번호를 입력해주세요" ><br>
		주소 : <table>
					<tr>
						<td><input type="text" name="receiver_post" id="receiver_post" size="15" value="${dto.receiver_post}" readonly>
							<input type="button" value="우편번호찾기"  onclick="addr();"></td>
					</tr>
					<tr>
						<td><input type="text" name="receiver_addr1" id="receiver_addr1" value="${dto.receiver_addr1}" size="45"  onclick="addr();"></td>
					<tr>
					<tr>
						<td><input type="text" name="receiver_addr2" id="receiver_addr2" value="${dto.receiver_addr2}"  size="45"  placeholder="상세주소를 입력해주세요."></td>
					<tr>
				</table>
		
		<input type="submit" value="변경하기" >
		</form>
	</fieldset>
	<hr>
	<fieldset>
	<legend>결제정보</legend>
		총 금액 : ${dto.price + dto.fee } 원 <br>
		<input type="hidden" id="amount" name="amount" value="${dto.price+dto.fee }">
		<!-- 카드결제 선택시 일반 카드결제 / 카카오페이 선택시 카카오페이 간편결제 -->
		결제수단 : <input type="radio" class="pm" name = "payment" value="html5_inicis" checked="checked"> 카드결제  
					<input type="radio" class="pm" name = "payment"  value="kakaopay"> 카카오페이<br>
	</fieldset>
	<hr>
	<fieldset>				
	이용약관 내용
	</fieldset>
		<br>
	  <div class="check">
	  <label><input type="checkbox" id="checkbox" >
	  이용 약관 동의</label>
	  </div>

 	<br>
 	<button type="submit" id="pay_btn" onclick="requestPay()">결제하기</button>
</div>
</div>
</body>
</html>