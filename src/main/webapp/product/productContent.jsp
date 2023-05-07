<%@page import="com.itwillbs.member.db.ProductDTO"%>
<%@page import="com.itwillbs.member.db.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			margin-top: 20px;
		}
		
		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			border: none;
			padding: 10px 20px;
			border-radius: 4px;
			cursor: pointer;
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
			<td>${product.grade}점</td>
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

	<a href="./ProductList.me">상품 리스트로 이동</a>
	<a href="./OrderWrite.me">구매하기</a>
	<a href="./ProductUpdate.me">상품글 수정</a>
	<a href="./ProductDelete.me">상품글 삭제</a>
	<a href="./QNAWrite.me">신고하기</a>
</body>
</html>