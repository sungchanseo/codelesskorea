<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- jQuery -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	
<meta charset="UTF-8">
<title>주문서 보기</title>
</head>
<body>
	<h1>주문서 보기</h1>
	
	주문번호 : ${dto.order_id }
	주문일자 : ${dto.order_date }

	<fieldset>
	<legend>상품 정보</legend>
		상품번호 : <input type="text"  name = "id" value="${dto.product_id }" readonly ><br>
		상품사진 : <img src="../img/img.jpg " width="100px"><br>
		상품이름 : <input type="text" name = "title" value="${dto.title }" readonly ><br>
		상품가격 : <input type="text" name = "price" value="${dto.price }" readonly ><br>
		배송비 : <input type="text" name = "fee" value="${dto.fee }" readonly ><br>
	</fieldset>
		<hr>
	<fieldset>
	<legend>배송 정보</legend>
	<!--  action주소가 없으면 자신의 페이지 호출 -->
		<input type="hidden" name="order_id" value="${dto.order_id }">
		<input type="hidden" id = "e1" name="id" value="${dto.id }">
		이름 : ${dto.receiver_name } <br>
		전화번호 : ${dto.receiver_phone } <br>
		우편번호 : ${dto.receiver_post } <br> 
		주소 : ${dto.receiver_addr1 } , ${dto.receiver_addr2 } <br>
		
		<!-- 구매계정/판매계정일때 보이기 나누기 -->
		<form action=""></form>
		운송장번호 : <input type="text" placeholder="운송장번호를 입력해주세요">
		<input type="submit" value="등록">
		
	</fieldset>
	
	<fieldset>
	<legend>결제정보</legend>
		총 금액 : ${dto.price + dto.fee+100 }  <br>
		<input type="hidden" id="t1" name="total" value="${dto.price+dto.fee+100 }">
		결제수단 : <input type="text" name="payment" value="카드결제" readonly> 
		결제금액 : <input type="text" name = "fee" value="${dto.paid_amount }" readonly ><br>
	</fieldset>
	
	
</body>
</html>