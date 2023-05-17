<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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

<style>

</style>

</head>
<body>

<%@include file="../nav.jsp" %>

 <!-- 사이드바 -->

<div class="row" style="margin-left: 100px;">
<%@include file="../mySide.jsp" %>
 <!--   사이드바 -->
 
 
<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 등 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductWriteAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${sessionScope.id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->
  
    <label for="seller"></label>
    <span id="seller">${sessionScope.id} 님</span>
	<br>
   <label for="title"></label>
    <input type="text" placeholder="글 제목을 입력하세요" name="title" id="title" style="width: 500px;" required>
	<br>
	   <label for="brand"></label>
      <select name="brand" id="brand" required>
        <option value="">브랜드</option>
        <option value="1">SAMSUNG</option>
        <option value="2">APPLE</option>
        <option value="3">etc</option>
      </select>
   <label for="model"></label>
      <select name="model" id="model" required>
        <option value="">모델</option>
        <option value="1">airpods</option>
        <option value="2">buds</option>
      </select>
     <label for="color"></label>
      <select name="color" id="color" required>
        <option value="">색상</option>
        <option value="1">화이트</option>
        <option value="2">블랙</option>
      </select>
   <label for="parts"> </label>
      <select name="parts" id="parts" required>
      	<option value="">부품</option>
        <option value="left">좌</option>
        <option value="right">우</option>
        <option value="body">본체</option>
      </select>
   <br>
   <label for="content"></label>
    <textarea name="content" placeholder="글 내용을 작성하세요" id="content" rows="4" cols="50"></textarea>
     
<table>
  <tr>
    <td class="file-input">
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
      <input type="number" name="price" placeholder="가격을 입력해주세요" id="price" required>

    <label for="grade">등급:</label>
      <select name="grade" id="grade">
        <option value="1">상</option>
        <option value="2">중</option>
        <option value="3">하</option>
      </select>
  <br>
 	<input type="text" name="address1"  placeholder="주소를 입력해주세요" id="address1" size="45" onclick="addr();">
	<input type="button" value="우편번호 찾기" onclick="addr();">
	<input type="text" name="address2" id="address2" size="45" placeholder="상세주소를 입력해주세요.">
	<br>
    <label for="method">거래방식:</label>

      <select name="method" id="method">
        <option value="0">택배거래</option>
        <option value="1">직거래</option>
      </select>
<br>
    <label>결제방식:</label>

        <input type="radio" name="charge" id="charge" value="0" required>
        <label for="account">계좌거래</label>

        <input type="radio" name="charge" id="charge" value="1" required>
        <label for="payment">안전결제</label>
<br>
    <label>배송비:</label>

        <input type="radio" name="fee" id="free" value="0" required>
        <label for="free">배송비 포함</label>

        <input type="radio" name="fee" id="not_free" value="3000" required>
        <label for="not_free">배송비 미포함</label>

		<div style="text-align: right; margin-top: 10px;">
  <div style="text-align: center; margin-top: 10px;">
  	<hr>
  <button type="submit" class="btn btn-primary" style="display: inline-block;">상품 등록</button>
	</div>

	</div>
	</form>
</div>
</div>

<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>