<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>faqUpdate</h1>

<div class="container">
 
  <form action="./FaqUpdateAction.fa" method="post">

   	글번호 ${dto.faq_id }
   	<input type="hidden" name="faq_id" value="${dto.faq_id }">
	<br>
    <label>글제목<br>
    <input type="text" name="title" value="${dto.title }">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content" style="height:200px">${dto.content }</textarea>
	</label>
	<br>


    <input type="submit" value="작성완료">
	
  </form>
 <a href="./FaqList.fa?pageNum="${pageNum }>목록으로</a>
</div>
</body>
</html>