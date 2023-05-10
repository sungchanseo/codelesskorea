<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="wirteFAQ.css" rel="stylesheet">
</head>
<body>

	<h1>상품 등록</h1>
	<form action="./ProductWriteAction.pr" method="post" >
		<input type="hidden" name="user_id" value="${sessionScope.id}"> <!-- user_id를 hidden으로 전송 -->
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


</body>
</html>