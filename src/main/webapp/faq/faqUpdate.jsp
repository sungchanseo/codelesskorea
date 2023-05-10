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

   	湲�踰��� ${dto.faq_id }
   	<input type="hidden" name="faq_id" value="${dto.faq_id }">
	<br>
    <label>湲���紐�<br>
    <input type="text" name="title" value="${dto.title }">
	</label>
	<br>
    <label>湲� �댁��<br>
    <textarea name="content" style="height:200px">${dto.content }</textarea>
	</label>
	<br>


    <input type="submit" value="���깆��猷�">
	
  </form>
 <a href="./FaqList.fa?pageNum="${pageNum }>紐⑸��쇰�</a>
</div>
</body>
</html>