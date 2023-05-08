<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>noticeWrite</h1>

<div class="container">
  <form action="./NoticeWriteAction.me" method="post">

   
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
 <a href="./NoticeList.no">목록으로</a>
</div>

</body>
</html>