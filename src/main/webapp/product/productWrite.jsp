<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<h1>상품 등록</h1>
	<form action="./ProductWriteAction.me" method="post" >
		<input type="hidden" name="user_id" value="${sessionScope.id} }"> <!-- user_id를 hidden으로 전송 -->
		<table>
			<tr>
				<td>판매자:</td> 
				<td>${sessionScope.id}</td> 
			</tr>
			<tr>
				<td>상품 제목:</td>
				<td><input type="text" placeholder="글 제목을 입력하세요" name="title" required></td>
			</tr>
			<tr>
				<td>상품 모델:</td>
				<td><input type="text" name="model" required></td>
			</tr>
			<tr>
				<td>상품 부품:</td>
				<td><select name="parts" required>
						<option value="left">좌</option>
						<option value="right">우</option>
						<option value="body">본체</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 내용:</td>
				<td><textarea name="content" placeholder="글 내용을 작성하세요" rows="5"
						cols="30"></textarea></td>
			</tr>
			<tr>
				<td>이미지 업로드 :</td>
				<td><input type="file" name="product_image" ></td>
			</tr>
			<tr>
				<td>상품 가격:</td>
				<td><input type="number" name="price" placeholder="가격을 입력해주세요" required></td>
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
				<td><input type="text" name="city" required></td>
			</tr>
			<tr>
				<td>거래 방식:</td>
				<td><select class="method" name="method">
						<option value="0">택배거래</option>
						<option value="1">직거래</option>
				</select><br></td>
			</tr>
			<tr>
				<td>결제방식 :</td>
				<td><input type="radio" name="charge" value="0" />계좌거래</td>
				<td><input type="radio" name="charge" value="1" />안전결제</td>
			</tr>
			<tr>
				<td>배송비 :</td>
				<td><input type="radio" name="fee" value="0" />배송비 포함</td>
				<td><input type="radio" name="fee" value="3000" />배송비 미포함</td>
			</tr>

		</table>
		<input type="submit" value="등록">
	</form>

</body>
</html>