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

 <!-- 사이드바 -->

  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> 공지게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./NoticeList.no'"> 공지사항</h5>
  <h5> 자주하는질문</h5>
  </div>
	</div>	
  
 <!--   사이드바 -->

<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">공 지 작 성</h1>
<hr style="border: 0;height: 3px; background-color: black;">

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
    <input type="file" name="notice_image" class="form-control">
	</label>
	
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