<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<script type="text/javascript">
function addr() {
	new daum.Postcode({
		    oncomplete : function(data) {
			document.getElementById("address1").value = data.address; // 주소 넣기
		}
	}).open();
}; //우편주소창부르기

</script>
<%@include file="../head.jsp" %>

</head>
<body>

<%@include file="../nav.jsp" %>

 <!-- 사이드바 -->

<div class="row" style="margin-left: 100px;">
<%@include file="../mySide.jsp" %>
  
 <!--   사이드바 -->
 
<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 수 정</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductUpdateProAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${product.user_id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->

	<label for="productNo">No.</label>
	<input type="text" value="${ product.product_id }"name="product_id" readonly>
	<br>

   <label for="title"></label>
    <input type="text" value="${product.title }" name="title">
	<br>
	  <label for="brand"></label>
      <select name="brand" id="brand" required>
      	<option value="">브랜드</option>
		<option value="1" ${product.brand == '1' ? 'selected' : ''}>SAMSUNG</option>
		<option value="2"${product.brand == '2' ? 'selected' : ''}>APPLE</option>
		<option value="3" ${product.brand == '3' ? 'selected' : ''}>etc</option>
	  </select>
   <label for="model"></label>
      <select name="model" id="model" required>
        <option value="">모델</option>
		<option value="1" ${product.model == '1' ? 'selected' : ''}>airpods</option>
		<option value="2"${product.model == '2' ? 'selected' : ''}>buds</option>
	  </select>
      <label for="color"></label>
      <select name="color" id="color" required>
    	<option value="">색상</option>
        <option value="1"  ${product.color == '1' ? 'selected' : ''}>화이트</option>
        <option value="2" ${product.color == '2' ? 'selected' : ''}>블랙</option>
      </select>

   <label for="parts"></label> 
   <select name="parts" id="parts"  required>
   		<option value="">부품</option>
		<option value="left" ${product.parts == 'left' ? 'selected' : ''}>좌</option>
		<option value="right" ${product.parts == 'right' ? 'selected' : ''}>우</option>
		<option value="body" ${product.parts == 'body' ? 'selected' : ''}>본체</option>
   </select> <br>

   
   <label for="content"></label>
   <textarea name="content" placeholder="글 내용을 작성하세요"  rows="4" cols="50">${product.content}</textarea>
	<table>
	  <tr>
	    <td class="file-input">
	    <hr>업로드한 이미지<br>
	    <img src="./upload/product/${product.product_image.split(',')[0]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[1]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[2]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[3]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[4]}" alt="이미지 없음" width="40px">
	    <br><br>
	      <input type="file" name="product_image1" id="product_image1" required>
	      <input type="file" name="product_image2" id="product_image2" required>
	      <input type="file" name="product_image3" id="product_image3" required>
	      <input type="file" name="product_image4" id="product_image4">
	      <input type="file" name="product_image5" id="product_image5">
	      </td>
	  </tr>
	</table>
	      <hr>

      <label for="price">가격:</label>

      <input type="number" name="price" id="price" value="${product.price}"
					required>

    <label for="grade">등급:</label>
      <select name="grade">
						<option value="1">상</option>
						<option value="2">중</option>
						<option value="3">하</option>
				</select>
  <br>
  <label for="city"> ${product.city}</label>
	
 	<input type="text" name="address1" placeholder="주소를 입력해주세요"  id="address1" size="35" onclick="addr();" required>
	<input type="button" value="우편번호찾기" onclick="addr();">  
	<input type="text" name="address2" id="address2" size="35" placeholder="상세주소를 입력해주세요.">
	<br>
    <label for="method">거래방식:</label>

     <select class="method" name="method">
						<option value="0" ${product.method == 0 ? "selected" : ""}>택배거래</option>
						<option value="1" ${product.method == 1 ? "selected" : ""}>직거래</option>
				</select><br>

    <label>결제방식:</label>
       <input type="radio" name="charge" value="${product.charge}"checked="${product.charge==0}" />
        <label for="charge">계좌거래</label>
       <input type="radio" name="charge" value="1" checked="${product.charge==1}" />
        <label for="charge">안전결제</label>
   <br>
    <label>배송비:</label>

        <input type="radio" name="fee" value="${product.fee}" checked="${product.fee == 0}" />
        <label for="fee">배송비 포함</label>
        <input type="radio" name="fee" value="3000"checked="${product.fee != 0}" />
        <label for="fee">배송비 미포함</label>
		<div style="text-align: right; margin-top: 10px;">
  <div style="text-align: center; margin-top: 10px;">
  	<hr>
  <button type="submit" class="btn btn-primary" style="display: inline-block; margin-top: -120px;">상품 수정</button>
	</div>

	</div>
	</form>
</div>
</div>

<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>