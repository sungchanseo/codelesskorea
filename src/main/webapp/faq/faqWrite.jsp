<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
<title>Insert title here</title>
</head>
<body>
<h1>faqWrite</h1>
<<<<<<< HEAD
=======
<h1>자주묻는 질문 작성하기 페이지(성찬스키)</h1>
<div class="container">
  <form action="./NoticeWriteAction.me" method="post">

   	<label>카데고리
 	<select>
  		<option value="policy">이용정책</option>
  		<option value="purchase">구매</option>
  		<option value="sell">판매</option>
  		<option value="report">신고</option>
  		<option value="etc">기타</option>
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
 <a href="./FAQList.me">목록으로</a>
</div>

>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>