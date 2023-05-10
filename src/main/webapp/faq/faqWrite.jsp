<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>faqWrite</h1>
<h1>자주묻는 질문 작성하기 페이지(성찬스키)</h1>
<div class="container">
  <form action="./FaqWriteAction.fa" method="post">

   	<label>카데고리
 	<select name="category">
  		<option value="이용정책">이용정책</option>
  		<option value="구매">구매</option>
  		<option value="판매">판매</option>
  		<option value="신고">신고</option>
  		<option value="기타">기타</option>
  	</select><br>
	</label>
    <label>글제목
    <input type="text" name="title" placeholder="글제목을 입력하세요">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content" placeholder="글 내용을 작성하세요" style="height:200px"></textarea>
	</label>
	<br>
    <input type="submit" value="작성완료">
  </form>
 <a href="./FaqList.fa">목록으로</a>
</div>
</body>
</html>