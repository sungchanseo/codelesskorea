<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODELESS - 공지사항 수정</title>
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
  <h5 onclick="location.href='./FaqList.fa'"> 자주하는질문</h5>
  </div>
	</div>	
  
 <!--   사이드바 -->

<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">공 지 수 정</h1>
<hr style="border: 0;height: 3px; background-color: black;">

  <form action="./NoticeUpdateAction.no" method="post" enctype="multipart/form-data">

   	글번호 ${dto.notice_id } 페이지번호 ${pageNum }
   	<input type="hidden" name="notice_id" value="${dto.notice_id }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<br>
    <label>글제목<br>
    <input type="text" name="title" value="${dto.title }" class="form-control" size="110">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content"  cols="110px;" rows="10px;" class="form-control">${dto.content }</textarea>
	</label>
	<br>
	<label>첨부 이미지 (이미지 화일만 업로드 가능합니다)
    <input type="file" name="notice_image" class="form-control" accept="image/*">
	</label>
	<br>

	<div style= "float: right;">
 <input type="submit" value="수정완료" class="btn btn-primary">
 <a href="./NoticeList.no?pageNum=${pageNum }" class="btn btn-secondary">목록으로</a>
	 </div>
  </form>
 
</div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>