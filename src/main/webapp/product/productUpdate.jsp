<%@page import="com.itwillbs.db.ProductDTO"%>
<%@page import="com.itwillbs.db.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
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
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 수 정</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	
	<form action="./ProductWriteAction.pr" method="post" enctype="multipart/form-data" >
		<table>
			<tr>
				<td>상품 번호:</td>
				<td><input type="text" value="${ product.product_id }"
					name="product_id" readonly></td>
			</tr>
			<tr>
				<td>판매자:</td>
				<td><input type="text" value="${ product.user_id }"
					name="user_id" readonly></td>
			</tr>
			<tr>
				<td>상품 제목:</td>
				<td><input type="text" value="${product.title }" name="title"
					required></td>
			</tr>
			<tr>
				<td>상품 모델:</td>
				<td><select name="parts" required>
						<option value="samsung" ${product.model == 'samsung' ? 'selected' : ''}>SAMSUNG</option>
						<option value="apple"
							${product.model == 'apple' ? 'selected' : ''}>APPLE</option>
						<option value="etc" ${product.model == 'etc' ? 'selected' : ''}>etc</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 부품:</td>
				<td><select name="parts" required>
						<option value="left" ${product.parts == 'left' ? 'selected' : ''}>좌</option>
						<option value="right"
							${product.parts == 'right' ? 'selected' : ''}>우</option>
						<option value="body" ${product.parts == 'body' ? 'selected' : ''}>본체</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 내용:</td>
				<td><textarea name="content" rows="5" cols="30">${product.content}</textarea></td>
			</tr>
		<tr>
  <td>이미지 업로드 :</td>
  <td><input type="file" name="product_image1" id="product_image1" required></td>
	</tr>
			<tr>
				<td>상품 가격:</td>
				<td><input type="number" name="price" value="${product.price}"
					required></td>
			</tr>
			<tr>
				<td>상품 등급:</td>
				<td><select name="grade">
						<option value="1">상</option>
						<option value="2">중</option>
						<option value="3">하</option>
				</select></td>
			</tr>

			<tr>
				<td>지역:</td>
				<td><input type="text" name="city" value="${product.grade}"
					required></td>
			</tr>
			<tr>
				<td>거래 방식:</td>
				<td><select class="method" name="method">
						<option value="0" ${product.method == 0 ? "selected" : ""}>택배거래</option>
						<option value="1" ${product.method == 1 ? "selected" : ""}>직거래</option>
				</select><br></td>
			</tr>
			<tr>
				<td>결제방식 :</td>
				<td><input type="radio" name="charge" value="${product.charge}"
					checked="${product.charge==0}" />계좌거래</td>
				<td><input type="radio" name="charge" value="1"
					checked="${product.charge==1}" />안전결제</td>
			</tr>
			<tr>
				<td>배송비 :</td>
				<td><input type="radio" name="fee" value="${product.fee}"
					checked="${product.fee == 0}" />배송비 포함</td>
				<td><input type="radio" name="fee" value="3000"
					checked="${product.fee != 0}" />배송비 미포함</td>
			</tr>

		</table>
		<input type="submit" value="수정하기">
	</form>
</div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>