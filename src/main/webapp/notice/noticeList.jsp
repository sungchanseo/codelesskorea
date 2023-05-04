<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>noticeList</h1>
<h2>공지리스트</h2>

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
     <td><a href="./NoticeContent.me?notice_id=${dto.notice_id }">${dto.title }</a></td>
     <td>${dto.date}</td>
     <td>${dto.count }</td>
   </tr>
	</c:forEach>
	
</table>

<a href="./NoticeWrite.me">게시글 작성</a>
</body>
</html>