<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>상품 상세 정보</h1>
	<table border="1">
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
	
	<form action="./ProductDeleteAction.me" method="post">
		<input type="hidden" name="id" value="${product.id}">
		<input type="submit" value="삭제">
	</form>
	
	<a href="./ProductList.me">상품 리스트로 이동</a>


<a href="./OrderWrite.me">구매하기</a>
<a href="./ProductUpdate.me">상품글 수정</a>
<a href="./ProductDelete.me">상품글 삭제</a>
<a href="./QNAWrite.me">신고하기</a>


<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<h1>상품 상세 정보</h1>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${product.productName}</td>
		</tr>
		<!-- 나머지 필드도 적절하게 출력합니다. -->
	</table>
	<a href="./ProductList.me">상품 리스트로 이동</a>
</body>
</html>

