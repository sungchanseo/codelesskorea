<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<%@include file="../head.jsp" %>
<link rel="stylesheet" href="path/to/bootstrap.min.css">
<!-- Bootstrap 5 JavaScript -->
<script src="path/to/bootstrap.min.js"></script>
</head>
<body>

<%@include file="../nav.jsp" %>
<script type="text/javascript">

function addr() {
	new daum.Postcode({
		    oncomplete : function(data) {
			document.getElementById("address1").value = data.address; // 주소 넣기
		}
	}).open();
}; //우편주소창부르기

$('document').ready(function() {
	const modelList = JSON.parse('${modelList}');
	const colorList = JSON.parse('${colorList}');
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델</option>");
			$('#color').append("<option value=''>색상</option>");
			$.each(modelList,function(idx, obj){
				console.log(obj.model_id);
				console.log(obj.model);
				if(obj.model_id>5) return false;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected apple
		}else if($('#brand').val() == "2"){
			// Init selectBox
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델</option>");
			$('#color').append("<option value=''>색상</option>");
			// add values
			$.each(modelList,function(idx, obj){
				if(obj.model_id<6) return true;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected samsung
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>모델</option>");
		}//미선택시
	});//특정 브랜드 선택시 모델옵션 변경
	
	 $('#model').change(function() {
		$('#color option').remove();
		$('#color').append("<option value=''>모델</option>");
		 var color = "";
		$.each(modelList,function(idx, obj){
// 			alert("color : " + obj.color+ "/ model id : " + obj.model_id + "/ model val : " + $('#model').val());
			if(obj.model_id == $('#model').val()) {
				color = obj.color;
				return false;
			}
		}); // get Colors by Model
		var colorArr = color.split("/");
		$.each(colorList,function(idx, obj){
			$.each(colorArr, function(idx, colorEle){
				if(obj.color_id == colorEle) {
					$('#color').append("<option value='"+obj.color_id+"'>"+obj.color+"</option>");
				}
			});
		});
	 });

});

function toggleAddressField() {
    var methodSelect = document.getElementById("method");
    var address1Input = document.getElementById("address1");
    var address2Input = document.getElementById("address2");
    var deliveryMessage = document.getElementById("deliveryMessage");
    var postalCodeBtn = document.getElementById("postalCodeBtn");

    if (methodSelect.value === "2") { // 택배를 선택한 경우
      address1Input.style.display = "none";
      address2Input.style.display = "none";
      deliveryMessage.style.display = "block";
      postalCodeBtn.style.display = "none";
    } else {
      address1Input.style.display = "block";
      address2Input.style.display = "block";
      deliveryMessage.style.display = "none";
      postalCodeBtn.style.display = "block";
    }
  }//script끝

</script>

 <!-- 사이드바 -->

<div class="row" style="margin-left: 100px;">
<%@include file="../mySide.jsp" %>
  
 <!--   사이드바 -->
 
<div class="col-sm-8" style="margin-left: 0px;">
 <div class="container" id="right" style="margin-left: 0px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 수 정</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductUpdateProAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${product.user_id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->

	<label for="seller"></label>
    <span id="seller">${sessionScope.id} 님</span>
	<br>
	<label for="productNo">No.</label>
	<input type="text" value="${ product.product_id }"name="product_id" style="width: 50px;" readonly>
   <label for="title"></label>
    <input type="text" value="${product.title }" name="title" style="width: 406px;">
	<br>
		<select name="brand" id="brand" required>			
			<option value="">브랜드</option>
			<option value="1">애플</option>
			<option value="2">삼성</option>
		</select>
		
		<select name="model" id="model" required>	
			<option value="">모델</option>
		</select>
		
		<select name="color" id="color" required>
			<option value="">색상</option>
		</select>
		
		<select name="parts" id="parts" required>
			<option value="">부품</option>
			<option value="left">좌</option>
			<option value="right">우</option>
			<option value="body">본체</option>
		</select>
   <br>
   <label for="content"></label>
   <textarea name="content" placeholder="글 내용을 작성하세요"  rows="4" cols="50">${product.content}</textarea>
   <br>
	<table>
	  <tr>
	    <td class="file-input">
	    <hr>업로드한 이미지<br>
	    <img src="./upload/product/${product.product_image.split(',')[0]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[1]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[2]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[3]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[4]}" alt="이미지 없음" width="40px">
	    <br>
	      <input type="file" name="product_image1" id="product_image1" required>
	      <input type="file" name="product_image2" id="product_image2" required>
	      <input type="file" name="product_image3" id="product_image3" required>
	      <input type="file" name="product_image4" id="product_image4">
	      <input type="file" name="product_image5" id="product_image5">
	      </td>
	  </tr>
	</table>
	      <hr>

      <label for="price"></label>
      <input type="number" name="price" id="price" value="${product.price}"
					required>

    <label for="grade">등급 </label>
      <select name="grade">
						<option value="1">상</option>
						<option value="2">중</option>
						<option value="3">하</option>
				</select>
		
  <label for="method">거래방법 </label>
		<select name="method" id="method" onchange="toggleAddressField()">
		  <option value="">거래방법을 선택하세요</option>
		  <option value="1" ${product.method == 1 ? "selected" : ""}>직거래</option>
		  <option value="2" ${product.method == 2 ? "selected" : ""}>택배</option>
		</select>
		<p id="deliveryMessage" style="display: none;  color: red;"> (직거래만 가능합니다.)</p>
		<br>
		주소 : ${product.city}<br>
		<input type="text" name="address1" placeholder="주소를 입력해주세요" id="address1" size="45" onclick="addr();">
		<input type="button" value="우편번호 찾기" onclick="addr();" id="postalCodeBtn" >
		<input type="text" name="address2" id="address2" size="45" placeholder="상세주소를 입력해주세요.">
		<br>
    <label>결제방식</label>
       <input type="radio" name="charge" value="${product.charge}"checked="${product.charge==0}" />
        <label for="charge">계좌거래</label>
       <input type="radio" name="charge" value="1" checked="${product.charge==1}" />
        <label for="charge">안전결제</label>
   <br>
    <label>배송비</label>
        <input type="radio" name="fee" value="${product.fee}" checked="${product.fee == 0}" />
        <label for="fee">배송비 포함</label>
        <input type="radio" name="fee" value="3000"checked="${product.fee != 0}" />
        <label for="fee">배송비 미포함</label>
		<div style="text-align: right; margin-top: 10px;">
  <div style="text-align: center; margin-top: 10px;">
	</div>
	  <hr>
	</div>
  <button type="submit" class="btn btn-primary" style="display: inline-block;">상품 수정</button>
	</form>
</div>
</div>
</div>
<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>