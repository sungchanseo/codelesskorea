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
   <c:set var="notice_id" property="${notice_id}"/>
<!-- rs <- DTO <- List -->
   <tr>
   <form action="./NoticeContent.me" method="post">
     <td>${dto.notice_id }<input type="hidden" value="${dto.notice_id }"></td>
     <td><a href="noticeContent.jsp?bno=${dto.notice_id}">${dto.title}</a></td>
     <td><a href="./NoticeContent.me">${dto.title}</a></td>
     <td><input type="submit" value="${dto.title}"></td>
     <td></td>
     <td>${dto.count }</td>
   </form> 
   </tr>
	</c:forEach>
	
</table>

<a href="./NoticeWrite.me">게시글 작성</a>
</body>
</html>