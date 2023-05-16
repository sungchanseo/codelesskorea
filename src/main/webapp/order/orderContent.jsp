<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <!-- jQuery -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
   <%@ include file="../head.jsp"%>
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
	
	<script>
	$(function(){
		var id = $('#id').val();
		var seller_id = $('#seller_id').val();
		var order_status = $('#order_status').val();
		console.log(id);
		console.log(seller_id);
		console.log(order_status);
		
		// 구매자에게만 보이는 버튼
		if(order_status != "주문 확인"){
			$("#accept_0").hide();
		}
		if(id == seller_id || order_status == "주문 확인" || order_status == "주문 확정"){
			$("#accept_3").hide();
		}
		// 판매자에게만 보이는 버튼
// 		if(id != seller_id){
// 			$("#accept_1").hide();
// 			$("#tracking").hide();
// 		}
		
		$(function (){
			$("#accept_1").click(function(){
				var tracking_number = prompt("운송장 번호를 입력해주세요");
				var tracking ={
						tracking_number : tracking_number,
						order_id : $('#order_id').val(),
						product_id : $('#product_id').val()
				}
				$.ajax({
					type : 'post',
	 				url : './TrackingNumberAction.or',
	 				data : tracking,
	 				dataType : 'TEXT',
	 				error: function(xhr, status, error){
	 					alert(error);
	 				},
	 				success : function(text){
	 					location.reload();
// 	 					alert(text)
	 				}
				})
			})			
		});
		
	});
//     <style type="text/css">

	
	
// 	</style>
	 </script>
<meta charset="UTF-8">
<title>주문서 보기</title>
</head>
<body>
<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin: 50px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">주 문 내 역</h1>
<hr style="border: 0;height: 3px; background-color: black;">
<!-- 	<h1>주문서 보기</h1> -->
	<input type="hidden" id="id" name="id" value="${dto.id }">
	<input type="hidden" id="receiver_id" name="receiver_id" value="${dto.receiver_id }">
	<input type="hidden" id="seller_id" name="seller_id" value="${dto.seller_id }">
	<input type="hidden" id="order_status" name="order_status" value="${dto.order_status }">
	주문번호 : ${dto.order_id }    
	/       
	주문일자 : ${dto.order_date }         
	/ 
	주문상태 : ${dto.order_status }

	<fieldset>
	<legend>상품 정보</legend>
		상품번호 : ${dto.product_id }
		<input type="hidden"  id="product_id" name="product_id" value="${dto.product_id }" readonly ><br>
		상품사진 : <img src="${dto.product_image}" alt="이미지 없음" width="200px"><br>
		상품이름 : ${dto.title }
		<input type="hidden" name = "title" value="${dto.title }" readonly ><br>
		상품가격 : ${dto.price }
		<input type="hidden" name = "price" value="${dto.price }" readonly ><br>
		배송비 : ${dto.fee }
		<input type="hidden" name = "fee" value="${dto.fee }" readonly ><br>
	</fieldset>
		<hr>
	<fieldset>
	<legend>배송 정보</legend>
	<!--  action주소가 없으면 자신의 페이지 호출 -->
		<input type="hidden" name="order_id" value="${dto.order_id }">
		<input type="hidden" id = "id" name="id" value="${dto.id }">
		이름 : ${dto.receiver_name } <br>
		전화번호 : ${dto.receiver_phone } <br>
		우편번호 : ${dto.receiver_post } <br> 
		주소 : ${dto.receiver_addr1 } , ${dto.receiver_addr2 } <br>
		
		<!-- 구매계정/판매계정일때 보이기 나누기 -->
		<form action="./TrackingNumberAction.or" method="post" accept-charset="utf-8">
		<input type="hidden" id="order_id" name="order_id" value="${dto.order_id }">
		운송장번호 : <input type="text" id="tracking_number" name="tracking_number" value="${dto.tracking_number }" placeholder="운송장번호를 입력해주세요">
		<input type="submit" id="tracking" value="수정하기">
		</form>
		
	</fieldset>
	<hr>
	<fieldset>
	<legend>결제정보</legend>
		결제수단 : 
<%-- 		${dto.payment } --%> <br>
		결제 금액 : ${dto.price + dto.fee }  <br>
		<input type="hidden" id="t1" name="total" value="${dto.price+dto.fee }">
		<input type="hidden" name="payment" value="카드결제" readonly> 
<%-- 		결제금액 : ${dto.price+dto.fee } --%>
		<input type="hidden" name = "fee" value="${dto.price+dto.fee }" readonly ><br>
	
	</fieldset>
	
	<!-- 주문 취소 / 주문 수락 -->
	<form action="./OrderIsAccept.or" method="post" accept-charset="utf-8">
	<input type="hidden" id="id" name="id" value="${dto.id }">
	<input type="hidden" id="order_id" name="order_id" value="${dto.order_id }">
	<input type="hidden" id="product_id" name="product_id" value="${dto.product_id }">
	<br>
	<button type="submit" id="accept_0" name="is_accept" value="0">주문 취소</button>
	<button type="submit" id="accept_1" name="is_accept" value="1" >주문 수락</button>
	<button type="submit" id="accept_3" name="is_accept" value="3">주문 확정</button>
	</form>
	</div>
</div>
	
</body>
</html>