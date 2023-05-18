<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<jsp:include page="../head.jsp"/>
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" /> 
	
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
		if(id != seller_id){
			$("#accept_1").hide();
			$("#tracking").hide();
		}
		
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

	 </script>
<meta charset="UTF-8">
<title>주문서 보기</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<div class=row style="margin-left: 100px;"> 
<jsp:include page="../mySide.jsp"/>
	 <div class="col-md-10">
 <div id="right" style="width: 80%">
 <h1 style="font-family: 'TheJamsil5Bold';">주 문 내 역</h1>
<hr style="border: 0;height: 3px; background-color: black;">
<!-- 	<h1>주문서 보기</h1> -->
<div class="orderContent">
	<fieldset>
		<legend>상품 정보</legend>
			<input type="hidden" id="id" name="id" value="${dto.id }">
			<input type="hidden" id="receiver_id" name="receiver_id" value="${dto.receiver_id }">
			<input type="hidden" id="seller_id" name="seller_id" value="${dto.seller_id }">
			<input type="hidden" id="order_status" name="order_status" value="${dto.order_status }">
		<table>
			<tr>
				<td style="text-align: left;"><span style="color: gray; margin-right: 5px; font-size: 15px;">주문번호:</span></td>
				<td style="text-align: right;"><span style="color: gray; margin-right: 20px; font-size: 15px;">${dto.order_id }</span></td>
				<td style="text-align: left;"><span style="color: gray; margin-right: 5px; font-size: 15px;">주문일자:</span></td>
				<td style="text-align: right;"><span style="color: gray; margin-right: 20px; font-size: 15px;">${dto.order_date } </span></td>
				<td style="text-align: left;"><span style="color: gray; margin-right: 5px; font-size: 15px;">주문상태:</span></td>
				<td style="text-align: right;"><span style="color: gray; margin-right: 20px; font-size: 15px;">${dto.order_status }</span></td>
			</tr>
		</table>
		<input type="hidden" id="title" name="title" value="${dto.title}">
		<input type="hidden" name="price" value="${dto.price}">
		<input type="hidden" name="fee" value="${dto.fee}">
		<div style="display: flex; align-items: center;" >
			<img src="${dto.product_image}" alt="이미지 없음" width="150px" style="display: block; margin-right: 10px;">
			<table>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">상품명</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.title}</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">가격</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.price}원</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">배송비</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.charge}원</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">수수료</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.fee}원</span></td>
				</tr>
			</table>
		</div>
	</fieldset>
</div>
	<hr>
	<div class="trackingInfo">
	<fieldset>
		<legend>배송 정보</legend>
		<input type="hidden" id="order_id" name="order_id" value="${dto.order_id }">
		<input type="hidden" id = "id" name="id" value="${dto.id }">
			<table>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">이름</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.receiver_name }</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">전화번호</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.receiver_phone }</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">우편번호</span></td>
					<td style="text-align: right;"><span style="color: black;">${dto.receiver_post }</span></td>
				</tr>
				<tr>
					<td style="text-align: left;"><span style="color: black; margin-right: 20px;">주소</span></td>
					<td style="text-align: right;"><span style="color: black;"> ${dto.receiver_addr1 } , ${dto.receiver_addr2 } </span></td>
				</tr>
			</table>
	</fieldset>
		</div>
	<fieldset>
	<legend>결제정보</legend>
		결제수단 : ${dto.payment }  <br>
		결제금액 : ${dto.price + dto.fee }  <br>
		<input type="hidden" id="t1" name="total" value="${dto.price+dto.fee }">
		<input type="hidden" name="payment" value="카드결제" readonly> 
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
</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>