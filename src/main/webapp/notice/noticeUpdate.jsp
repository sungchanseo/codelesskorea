<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<title>CODELESS - 공지사항 수정</title>
<%@include file="../head.jsp" %>
</head>
<body>
<%@include file="../nav.jsp" %><!-- nav -->

  <div class="row" style="margin-left: 100px;">
  <!-- 사이드바 -->
 <%@ include file="../noSide.jsp"%>	
  
 <!--   사이드바 -->
  
 <div class="col-md-10">
 <div id="right">
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
</div>
<%@include file="../footer.jsp" %>
</body>
</html>