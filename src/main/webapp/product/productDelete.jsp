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

	<h1>상품 삭제</h1>
	<form action="./ProductdeleteAction.me" method="post" >
		<table>
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
	

		</table>
		<input type="submit" value="삭제">
	</form>



</body>
</html>