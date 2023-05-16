<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<%@include file="../head.jsp" %>


</head>
<body>

<%@include file="../nav.jsp" %>

 <!-- 사이드바 -->

  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> 마이페이지 </h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./ProductList.pr'"> 판매 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 구매 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 찜 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 1대1 문의</h5>
  <h5 onclick="location.href='./ProductList.no'"> 내 정보 보기</h5>
  </div>
	</div>	
  
 <!--   사이드바 -->
 
<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 등 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductWriteAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${sessionScope.id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->
  
<table>
  <tr>
    <td><label for="seller">판매자:</label></td>
    <td><span id="seller">${sessionScope.id}</span></td>
  </tr>
  <tr>
    <td><label for="title">상품 제목:</label></td>
    <td><input type="text" placeholder="글 제목을 입력하세요" name="title" id="title" required></td>
  </tr>
  <tr>
    <td><label for="model">상품 모델:</label></td>
    <td>
      <select name="model" id="model" required>
        <option value="">카테고리를 선택해주세요</option>
        <option value="samsung">SAMSUNG</option>
        <option value="apple">APPLE</option>
        <option value="etc">etc</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label for="parts">상품 부품:</label></td>
    <td>
      <select name="parts" id="parts" required>
        <option value="left">좌</option>
        <option value="right">우</option>
        <option value="body">본체</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label for="content">상품 내용:</label></td>
    <td><textarea name="content" placeholder="글 내용을 작성하세요" id="content" rows="5" cols="30"></textarea></td>
  </tr>
  
      <tr>
    <td>
      <label for="product_image1">상품 이미지 1:</label>
    </td>
    <td>
      <input type="file" name="product_image1" id="product_image1" required>
    </td>
    <td>
      <label for="product_image2">상품 이미지 2:</label>
    </td>
    <td>
      <input type="file" name="product_image2" id="product_image2">
    </td>
  </tr>
  <tr>
    <td>
      <label for="product_image3">상품 이미지 3:</label>
    </td>
    <td>
      <input type="file" name="product_image3" id="product_image3">
    </td>
    <td>
      <label for="product_image4">상품 이미지 4:</label>
    </td>
    <td>
      <input type="file" name="product_image4" id="product_image4">
    </td>
    
  </tr>
  <tr>
    <td>
      <label for="price">상품 가격:</label>
    </td>
    <td>
      <input type="number" name="price" placeholder="가격을 입력해주세요" id="price" required>
    </td>
  </tr>
 <tr>
    <td><label for="grade">상품 등급:</label></td>
    <td>
      <select name="grade" id="grade">
        <option value="1">상</option>
        <option value="2">중</option>
        <option value="3">하</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label for="city">지역:</label></td>
    <td><input type="text" placeholder="지역을 입력하세요" name="city" id="city" required></td>
  </tr>
  <tr>
    <td><label for="method">거래 방식:</label></td>
    <td>
      <select name="method" id="method">
        <option value="0">택배거래</option>
        <option value="1">직거래</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label>결제방식:</label></td>
    <td>
      <div>
        <input type="radio" name="charge" id="account" value="0" required>
        <label for="account">계좌거래</label>
      </div>
      <div>
        <input type="radio" name="charge" id="payment" value="1" required>
        <label for="payment">안전결제</label>
      </div>
    </td>
  </tr>
  <tr>
    <td><label>배송비:</label></td>
    <td>
      <div>
        <input type="radio" name="fee" id="free" value="0" required>
        <label for="free">배송비 포함</label>
      </div>
      <div>
        <input type="radio" name="fee" id="not_free" value="3000" required>
        <label for="not_free">배송비 미포함</label>
      </div>
    </td>
  </tr>
</table>
		<input type="submit" value="등록">
	</form>
</div>
</div>

<script src="js/aos.js"></script>

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>

<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>