<%@page import="java.util.List"%>
<%@page import="com.itwillbs.member.db.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>noticeList</h1>
<h2>공지리스트</h2>
페이지번호 : ${pageNum }<br>
<table border="1">
   <tr>
     <th>공지번호</th>
     <td>제목</td>
     <td>게시일</td>
     <td>조회수</td>
   </tr> 

   <c:forEach var="dto" items="${requestScope.noticeList }">
<!-- rs <- DTO <- List -->
   <tr>
     <td>${dto.notice_id }<input type="hidden" name="notice_id" value="${dto.notice_id }"></td>
     <td><a href="./NoticeContent.me?notice_id=${dto.notice_id }&pageNum=${pageNum}">${dto.title }</a></td>
     <td>${dto.date}</td>
     <td>${dto.count }</td>
   </tr>
	</c:forEach>
</table>
<hr>
	
	<c:if test="${startPage > pageBlock }"> 
	<a href="./NoticeList.me?pageNum=${startPage-pageBlock} ">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	<a href="./NoticeList.me?pageNum=${i }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${endPage<pageCount }">
	<a href="./NoticeList.me?pageNum=${startPage+pageBlock} ">[다음]</a>
	</c:if>
<br>
<a href="./NoticeWrite.me">게시글 작성</a> 
<a href="./Main.me">메인으로</a>
</body>
</html>