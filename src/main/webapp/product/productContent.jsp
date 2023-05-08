<%@page import="com.itwillbs.db.ProductDTO"%>
<%@page import="com.itwillbs.db.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 보기</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			color: #333;
		}
		
		table {
			border-collapse: collapse;
			margin-top: 20px;
		}
		
		th, td {
			padding: 10px;
			border: 1px solid #ccc;
			text-align: center;
			vertical-align: middle;
		}
		
		th {
			background-color: #ddd;
		}
		
		img {
			display: block;
			margin: 0 auto;
			max-width: 100%;
			height: auto;
		}
		
		form {
			display: inline-block;
			margin: 10px;
			padding: 10px 20px;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: 1px solid #333;
			transition: all 0.3s ease;
		}
		
		form:hover {
			background-color: #fff;
			color: #333;
		}
		
		form:hover input[type="submit"] {
			background-color: #fff;
			color: #333;
		}
		
		input[type="submit"] {
			display: inline-block;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: none ;
			transition: all 0.3s ease;
			font-size: 16px;
		}

		a {
			display: inline-block;
			margin: 10px;
			padding: 10px 20px;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: 1px solid #333;
			transition: all 0.3s ease;
		}
		
		a:hover {
			background-color: #fff;
			color: #333;
		}
	</style>
</head>
<body>
<h1>상품 보기</h1>
	<table border="1">
		<tr>
			<th>판매자</th>
			<td>${product.user_id}</td>
		</tr>
		<tr>
			<th>No.</th>
			<td>${product.product_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${product.title}</td>
		</tr>
		<tr>
			<th>모델</th>
			<td>${product.model}</td>
		</tr>
		<tr>
			<th>부품명</th>
			<td>${product.parts}</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src="${product.product_image}" alt="이미지 없음" width="300px"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${product.content}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${product.price}원</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>${product.grade}등급</td>
		</tr>
		<tr>
			<th>판매지역</th>
			<td>${product.city}</td>
		</tr>
		<tr>
			<th>배송방법</th>
			<td>${product.method}</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td>${product.charge}원</td>
		</tr>
		<tr>
			<th>수수료</th>
			<td>${product.fee}원</td>
		</tr>
	</table>
	<a href="./ProductList.pr">상품 리스트로 이동</a>
	<a href="./OrderWrite.pr">구매하기</a>
	<a href="./QNAWrite.qn">신고하기</a>
	<c:if test="${ sessionScope.id != product.user_id }">
		<a href="./ChatToSeller.ch?toID=${product.user_id }">채팅하기</a>
	</c:if>
	<br>
	<br>
	<c:if test="${ sessionScope.id eq 'admin' or product.user_id eq sessionScope.id }">
    <a href="./ProductUpdate.pr?product_id='${product.product_id}'" >상품글 수정</a>
		<form method="post" action="./ProductDeleteAction.pr"
			onsubmit="if(!confirm('상품을 삭제하시겠습니까?')) return false;">
			<input type="hidden" name="product_id" value="${product.product_id}">
			<input type="submit" value="상품글 삭제">
		</form>
		<a href="./ProductList.pr">판매완료</a>
	</c:if>

</body>
</html>