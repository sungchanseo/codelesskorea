<%@page import="java.util.List"%>
<%@page import="com.itwillbs.db.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODE LESS - 공지사항</title>
<%@ include file="../head.jsp"%>
</head>
<body>
<%@ include file="../nav.jsp"%>

  <div class="container" id="left">
  <br>
  <h4> 공지게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./NoticeList.me'"> 공지사항</h5>
  <h5> 자주하는질문</h5>
  </div>
  <div class="container" id="right" style="margin-left: 350px;">
  <h1 align="center" style="font-family: 'TheJamsil5Bold';">공 지 사 항</h1>
<hr style="border: 0;height: 3px; background-color: black;">
페이지번호 : ${pageNum }<br>

  <table class="table">
   <thead style="background-color: #F6F6F6;">
   <tr>
     <th>NO.</th>
     <th style="text-align: center;">제목</th>
     <th>게시일</th>
     <th>조회수</th>
   </tr> 
	</thead>
	<tbody>
   <c:forEach var="dto" items="${requestScope.noticeList }">
<!-- rs <- DTO <- List -->
   <tr>
     <td width="30px;">${dto.notice_id }<input type="hidden" name="notice_id" value="${dto.notice_id }"></td>
     <td width="500px;" style="text-align: center;"><a href="./NoticeContent.me?notice_id=${dto.notice_id }&pageNum=${pageNum}">${dto.title }</a></td>
     <td width="100px;">${dto.date}</td>
     <td width="100px;">${dto.count }</td>
   </tr>
	</c:forEach>
	</tbody>
</table>
	
	<div class="container" style="margin: auto;">
	  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 50px;">
  	<c:if test="${startPage > pageBlock }"> 
	<li class="page-item"><a class="page-link" href="./NoticeList.me?pageNum=${startPage-pageBlock} "><sapn>다음</sapn></a></li>
	</c:if>
   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	<li class="page-item"><a class="page-link" href="./NoticeList.me?pageNum=${i }"><span>${i }</span></a></li>
	</c:forEach>
    <c:if test="${endPage<pageCount }">
	<li class="page-item"><a class="page-link" href="./NoticeList.me?pageNum=${startPage+pageBlock} "><span>다음</span></a></li>
	</c:if>
  </ul>
  </div>
<br>
<div style= "float: right;">
<!-- 관리자만 글작성할 수 있게 해주세요 -->
<button type="button" class="btn btn-primary" onclick="location.href='./NoticeWrite.no'">글작성</button>
<button type="button" class="btn btn-secondary" onclick="location.href='./Main.me'">메인으로</button>
</div>

</div>


<%@ include file="../footer.jsp"%>
</body>
</html>