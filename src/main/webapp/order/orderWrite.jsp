<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    
    function addr() {
		new daum.Postcode({
			    oncomplete : function(data) {
				document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
				document.getElementById("address").value = data.address; // 주소 넣기
			}
		}).open();
	};
	
    // body 의 값 -> head 가져오기
    var obj_name ="";
    var obj_email ="";
    var obj_ph ="";
    var obj_addr ="";
    var obj_amount ="";
    var obj_order_id ="";
    var obj_payment ="";
    var obj_product_id ="";
    var obj_title ="";
    var obj_post ="";
    $(document).ready(function(){
    	obj_order_id = $('#o1').attr('value');
    	obj_name = $('#n1').attr('value');
    	obj_email = $('#e1').attr('value');
    	obj_ph = $('#p1').attr('value');
    	obj_addr = $('#address').attr('value');
    	obj_amount = $('#t1').attr('value');
    	obj_product_id = $('#pr1').attr('value');
    	obj_title = $('#ti1').attr('value');
    	obj_post = $('#po1').attr('value');
    	obj_payment = $('.pm1:checked').val();
    	console.log(obj_name);
    	console.log(obj_email);
    	console.log(obj_payment);
    	
    	 
    	
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
     
       	var order_date = year+"-"+month+"-"+date+" "+hours+":"+minutes+":"+seconds; //주문일시
		
       	
       	
       	
        function requestPay() {
        	// 약관동의 결제제한
        	if($('#checkbox').is(':checked') == false){
    			alert('약관에 동의해주세요.');
    			$('#checkbox').focus();
    			return false;
    	 	}
        	if($('.pm1:checked').val() == "html5_inicis"){
        	var pay_form = {
                    pg : 'html5_inicis',
                    pay_method : 'card',
                    merchant_uid: "IMP"+makeMerchantUid, 
                    name : obj_title, //상품명
                    amount : obj_amount, //금액
                    buyer_email : obj_email,
                    buyer_name : obj_name, // 구매자
                    buyer_tel : obj_ph, // 전화번호
                    buyer_addr : obj_addr, //주소
                    buyer_postcode : obj_post // 우편변호
                };
        	
        	console.log(pay_form);
        	
            IMP.request_pay(pay_form, function (rsp) { 
            	console.log(rsp);
                if (rsp.success) {
                	// 결제 성공시 로직
                	var msg = '결제가 완료되었습니다.';
                			msg += '\n주문일시 : ' + order_date;
                			msg += '\n고유ID : ' + rsp.imp_uid;
                			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                			msg += '\결제 금액 : ' + rsp.paid_amount;
                			msg += '카드 승인번호 : ' + rsp.apply_num;
                	alert(msg);
                	
                	
                	// form 태그 JS에서 생성해서 파라미터 전달
                	// (결제 1개는 전송방식 ajax로 수정해볼예정)
					const form = document.createElement('form');       		// form 태그 생성 
					var order_id_objs = document.createElement('input');    // 값을 넣을 input 생성 
					order_id_objs.setAttribute('type', 'hidden');           // 값의 type
					order_id_objs.setAttribute('name', 'order_id');         // 값을 담을 변수 이름
					order_id_objs.setAttribute('value', obj_order_id);      // 값 
                    form.appendChild(order_id_objs);
					
					var uid_objs = document.createElement('input');              
                    uid_objs.setAttribute('type', 'hidden');                                 
                    uid_objs.setAttribute('name', 'imp_uid');                
                    uid_objs.setAttribute('value', rsp.imp_uid);          
                    form.appendChild(uid_objs);
                    var merchant_uid_objs = document.createElement('input');           
                    merchant_uid_objs.setAttribute('type', 'hidden');                 
                    merchant_uid_objs.setAttribute('name', 'merchant_uid');          
                    merchant_uid_objs.setAttribute('value', rsp.merchant_uid);        
                    form.appendChild(merchant_uid_objs);
                    var paid_amount_objs = document.createElement('input');       
                    paid_amount_objs.setAttribute('type', 'hidden');               
                    paid_amount_objs.setAttribute('name', 'paid_amount');          
                    paid_amount_objs.setAttribute('value', rsp.paid_amount);        
                    form.appendChild(paid_amount_objs);
                    var apply_num_objs = document.createElement('input');       
                    apply_num_objs.setAttribute('type', 'hidden');             
                    apply_num_objs.setAttribute('name', 'apply_num');          
                    apply_num_objs.setAttribute('value', rsp.apply_num);      
                    form.appendChild(apply_num_objs);
                    form.setAttribute('method', 'post');                     
                    form.setAttribute('action', './OrderContent.or');   
                    form.setAttribute('accept-charset', 'utf-8');   
                    document.body.appendChild(form);
                    form.submit();
                   
    		} else {
                	// 결제 실패시 로직
                	var msg = '결제 실패';
                	msg += '에러내용 : ' + rsp.error_msg;
                	alert(msg);
                    console.log(rsp);
                } //else
            } //function(rsp)
            ); // IMP.request_pay()
       	 } // if
//     } // function requestPay()
        
		else if($('.pm1:checked').val() == "kakaopay"){
        	var pay_form = {
                    pg : 'kakaopay',
                    pay_method : 'EASY_PAY',
                    merchant_uid: "IMP"+makeMerchantUid, 
                    name : obj_title, //상품명
                    amount : obj_amount, //금액
                    buyer_email : obj_email,
                    buyer_name : obj_name, // 구매자
                    buyer_tel : obj_ph, // 전화번호
                    buyer_addr : obj_addr, //주소
                    buyer_postcode : obj_post // 우편변호
                };
        	console.log(pay_form);
            IMP.request_pay(pay_form, function (rsp) { 
            	console.log(rsp);
                if (rsp.success) {
                	// 결제 성공시 로직
                	var msg = '결제가 완료되었습니다.';
                	alert(msg);
                	
                	// form 태그 JS에서 생성해서 파라미터 전달
					const form = document.createElement('form');       		// form 태그 생성 
					
					var order_id_objs = document.createElement('input');    // 값을 넣을 input 생성 
					order_id_objs.setAttribute('type', 'hidden');           // 값의 type
					order_id_objs.setAttribute('name', 'order_id');         // 값을 담을 변수 이름
					order_id_objs.setAttribute('value', obj_order_id);      // 값 
                    form.appendChild(order_id_objs);
					
                    var product_id_objs = document.createElement('input');    // 값을 넣을 input 생성 
                    product_id_objs.setAttribute('type', 'hidden');           // 값의 type
                    product_id_objs.setAttribute('name', 'product_id');         // 값을 담을 변수 이름
                    product_id_objs.setAttribute('value', obj_product_id);      // 값 
                    form.appendChild(product_id_objs);
					
                    var order_date_objs = document.createElement('input');    // 값을 넣을 input 생성 
                    order_date_objs.setAttribute('type', 'hidden');           // 값의 type
                    order_date_objs.setAttribute('name', 'order_date');         // 값을 담을 변수 이름
                    order_date_objs.setAttribute('value', order_date);      // 값 
                    form.appendChild(order_date_objs);
                    
					var uid_objs = document.createElement('input');              
                    uid_objs.setAttribute('type', 'hidden');                                 
                    uid_objs.setAttribute('name', 'imp_uid');                
                    uid_objs.setAttribute('value', rsp.imp_uid);          
                    form.appendChild(uid_objs);
                    
                    var merchant_uid_objs = document.createElement('input');           
                    merchant_uid_objs.setAttribute('type', 'hidden');                 
                    merchant_uid_objs.setAttribute('name', 'merchant_uid');          
                    merchant_uid_objs.setAttribute('value', rsp.merchant_uid);        
                    form.appendChild(merchant_uid_objs);
                    
                    var paid_amount_objs = document.createElement('input');       
                    paid_amount_objs.setAttribute('type', 'hidden');               
                    paid_amount_objs.setAttribute('name', 'paid_amount');          
                    paid_amount_objs.setAttribute('value', rsp.paid_amount);        
                    form.appendChild(paid_amount_objs);
                    
                    var apply_num_objs = document.createElement('input');       
                    apply_num_objs.setAttribute('type', 'hidden');             
                    apply_num_objs.setAttribute('name', 'apply_num');          
                    apply_num_objs.setAttribute('value', rsp.apply_num);      
                    form.appendChild(apply_num_objs);
                    
                    form.setAttribute('method', 'post');                     
                    form.setAttribute('action', './OrderContent.or');      
                    form.setAttribute('accept-charset', 'utf-8');      
                    document.body.appendChild(form);
                    form.submit();
                   
    		} else {
                	// 결제 실패시 로직
                	var msg = '결제 실패';
                	msg += '에러내용 : ' + rsp.error_msg;
                	alert(msg);
                    console.log(rsp);
                } //else
            } //function(rsp)
            ); // IMP.request_pay()
        } //else if
        } // function requestPay()
        
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
	<h1>주문서</h1>
	
	
	<fieldset>
	<legend>상품 정보</legend>
		상품번호 : <input type="text"  name = "id" value="${dto.product_id }" readonly ><br>
		상품사진 : <img src="../img/img.jpg " width="100px"><br>
		상품이름 : <input type="text" name = "title" value="${dto.title }" readonly ><br>
		<input type="hidden" id = "ti1" name="title" value="${dto.title }">
		상품가격 : <input type="text" name = "price" value="${dto.price }" readonly ><br>
		배송비 : <input type="text" name = "price" value="${dto.fee }" readonly ><br>
			
	</fieldset>
		<hr>
	<fieldset>
	<legend>배송 정보</legend>
		<form action="./AddrChangeAction.or" method="post" accept-charset="utf-8">
		<input type="hidden" id = "o1" name="order_id" value="${dto.order_id }">
		<input type="hidden" id = "e1" name="id" value="${dto.id }">
		<input type="hidden" id = "pr1" name="product_id" value="${dto.product_id }">
		이름 : <input type="text" id = "n1" name = "receiver_name" value="${dto.receiver_name }" placeholder="이름을 입력해주세요" ><br>
		전화번호 : <input type="text" id = "p1" name = "receiver_phone" value="${dto.receiver_phone }" placeholder="전화번호를 입력해주세요" ><br>
		주소 : <table>
					<tr>
						<td><input type="text" name="zipcode" id="zipcode" size="15" value="${dto.receiver_post }" readonly>
							<input type="hidden" id = "po1" name="receiver_post" value="${dto.receiver_post }">
							<input type="button" value="우편번호찾기"  onclick="addr();"></td>
					</tr>
					<tr>
						<td><input type="text" name="receiver_addr1" id="address" size="45" value="${dto.receiver_addr1 }" onclick="addr();"></td>
					<tr>
					<tr>
						<td><input type="text" name="receiver_addr2" id="address2" size="45" value="${dto.receiver_addr2 }" placeholder="상세주소를 입력해주세요."></td>
					<tr>
				</table>
		
<%-- 		<input type="text" id = "a1" name = "receiver_addr1" value="${dto.receiver_addr1 }" placeholder="주소를 입력해주세요" ><br> --%>
		<input type="submit" value="변경하기">
		</form>
	</fieldset>
	
	<fieldset>
	<legend>결제정보</legend>
		총 금액 : ${dto.price + dto.fee+100 } 원 <br>
		<input type="hidden" id="t1" name="amount" value="${dto.price+dto.fee+100 }">
		<!-- 카드결제 선택시 일반 카드결제 / 카카오페이 선택시 카카오페이 간편결제 -->
		결제수단 : <input type="radio" class="pm1" name = "payment" value="html5_inicis" checked="checked"> 카드결제  
					<input type="radio" class="pm1" name = "payment"  value="kakaopay"> 카카오페이<br>
	</fieldset>
	
	<hr>
	
	<fieldset>				
	이용약관 내용
	</fieldset>
	
	  <div class="check">
	  <label><input type="checkbox" id="checkbox" >
	  이용 약관 동의</label>
	  </div>

 	<br>
 	<button type="submit" id="pay_btn" onclick="requestPay()">결제하기</button>

</body>
</html>