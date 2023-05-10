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

<div class="container">
  <form action="action_page.php" method="post">

    <label for="fname">브랜드
    <select name="brand">
    <option value="notice">애플</option>
    <option value="notice">삼성</option>
    </select>
    </label>
    
    <label for="fname">모델
    <select name="model">
    
    <option value="">에어팟1세대</option>
   
    </select>
    </label>
    
    <label for="fname">부분
    <select name="part">
    <option value="notice">좌</option>
    <option value="notice">우</option>
    <option value="notice">본체</option>
    </select>
    </label>
    <br>

    <label for="lname">글제목</label>
    <input type="text" id="lname" name="lastname" placeholder="글제목을 입력하세요">

    <label for="subject">글 내용</label>
    <textarea id="subject" name="subject" placeholder="글 내용을 작성하세요" style="height:200px"></textarea>

	<label>이미지 업로드 : <input type="file" name="product_image"></label><br>
    
    판매가격 : <input type="text" name="price"><br>
	거래방식 : <select class="charge" name="method">
			<option value="1">택배거래</option>
			<option value="2">직거래</option>
			</select><br>
	결재방식 : <label><input type="radio" name="charge" value=""/>계좌거래</label>
	<label><input type="radio" name="charge" value=""/>안전결재</label><br>
	배송비 : <label><input type="radio" name="fee" value=""/>배송비포함</label>
	<label><input type="radio" name="fee" value=""/>배송비미포함</label><br>
    
    <input type="submit" value="등록완료">

  </form>
</div>


</body>
</html>