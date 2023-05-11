<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp" %>
</head>
<body>
<%@include file="../nav.jsp" %>

<div class="container">
  <form action="./NoticeWriteAction.no" enctype="multipart/form-data" method="post">
  
    <label>글제목
    <input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" size="110">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content" placeholder="공지사항 내용을 작성하세요" cols="110px;" rows="10px;" class="form-control"></textarea>
	</label>
	<br>
	<label>첨부 이미지
    <input type="file" name="notice_image">
	</label>
	<br>
    <input type="submit" value="작성완료">
	
 <div style= "float: right; margin-top: 60px;">
<!-- 관리자만 글작성할 수 있게 해주세요 -->
 <input type="submit" value="작성완료" class="btn btn-primary">
 <a href="./NoticeList.no" class="btn btn-secondary">목록으로</a>
</div>

 </form>
 
</div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>