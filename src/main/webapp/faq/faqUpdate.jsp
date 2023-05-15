<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODELESS - 자주묻는 질문 수정</title>
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
 <h1 style="font-family: 'TheJamsil5Bold';">자주묻는 질문 수정</h1>
<hr style="border: 0;height: 3px; background-color: black;">
 
  <form action="./FaqUpdateAction.fa" method="post">

   	글번호 ${dto.faq_id } 페이지번호 ${pageNum }
   	<input type="hidden" name="faq_id" value="${dto.faq_id }">
	<br>
	카테고리 
	<select name="category" class="form-control">
  		<option value="이용정책">이용정책</option>
  		<option value="구매">구매</option>
  		<option value="판매">판매</option>
  		<option value="신고">신고</option>
  		<option value="기타">기타</option>
  	</select><br>
    <label>글제목<br>
    <input type="text" name="title" value="${dto.title }" class="form-control" size="110">
	</label>
	<br>
    <label>글내용<br>
    <textarea name="content"  cols="110px;" rows="10px;" class="form-control">${dto.content }</textarea>
	</label>
	<br>
	
	<div style= "float: right;">
	<input type="hidden" name="pageNum" value="${pageNum }">
    <input type="submit" value="수정하기" class="btn btn-primary">
 	<a href="./FaqList.fa?pageNum=${pageNum }" class="btn btn-secondary">목록으로</a>
	</div>
  </form>
</div>
</div>

<%@include file="../footer.jsp" %></body>
</html>