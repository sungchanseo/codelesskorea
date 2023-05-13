<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>faqUpdate</h1>

<div class="container">
 
  <form action="./FaqUpdateAction.fa" method="post">

   	글번호 ${dto.faq_id } 페이지번호 ${pageNum }
   	<input type="hidden" name="faq_id" value="${dto.faq_id }">
	<br>
	카테고리 
	<select name="category">
  		<option value="이용정책">이용정책</option>
  		<option value="구매">구매</option>
  		<option value="판매">판매</option>
  		<option value="신고">신고</option>
  		<option value="기타">기타</option>
  	</select><br>
    <label>글제목<br>
    <input type="text" name="title" value="${dto.title }">
	</label>
	<br>
    <label>글내용<br>
    <textarea name="content" style="height:200px">${dto.content }</textarea>
	</label>
	<br>
	<input type="hidden" name="pageNum" value="${pageNum }">
    <input type="submit" value="수정하기">
  </form>
 <a href="./FaqList.fa?pageNum=${pageNum }">목록으로</a>
</div>
</body>
</html>