<%@page import="com.itwillbs.db.ProductDTO"%>
<%@page import="com.itwillbs.db.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<style>
	body {
		background-color: #f2f2f2;
		font-family: Arial, sans-serif;
	}

	h1 {
		color: #000000;
	}

	form {
		background-color: #fff;
		padding: 20px;
		border-radius: 5px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.3);
	}

	input[type="text"], select, textarea {
		display: block;
		width: 100%;
		padding: 12px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}

	input[type="file"] {
		padding: 5px;
		border: none;
		border-bottom: 1px solid #ccc;
	}

	input[type="submit"] {
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

	input[type="submit"]:hover {
			background-color: #fff;
			color: #333;
	}

	input[type="radio"], input[type="checkbox"] {
		margin-right: 10px;
	}

	label {
		display: block;
		margin-bottom: 10px;
	}

	.error-message {
		color: red;
		margin-top: 10px;
	}
</style>

</head>
<body>
	
	<h1>상품 수정</h1>
	
	<form action="./ProductUpdateProAction.pr" method="post">
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
				<td><input type="text" name="model" value="${product.model}"
					required></td>
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
				<td><input type="file" name="product_image"></td>
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

</body>
</html>