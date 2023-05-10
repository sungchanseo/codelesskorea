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
<h1>자주하는 질문</h1>
<h2>검색창 들어가는 자리</h2>
<h2>카테고리 들어가는 자리</h2>
페이지번호 : ${pageNum }<br>
${requestScope.FaqList }<br>
<table border="1">
   <tr>
     <th>Faq번호</th>
     <td>카테고리</td>
     <td>제목</td>
     <td>토글버튼자리</td>
   </tr> 

   <c:forEach var="dto" items="${requestScope.faqList }">
   <tr>
     <td>${dto.faq_id }<input type="hidden" name="Faq_id" value="${dto.faq_id }"></td>
     <td>${dto.category}</td>
     <td><a href="./FaqContent.fa?faq_id=${dto.faq_id }&pageNum=${pageNum}">${dto.title }</a></td>
   </tr>
	</c:forEach>
</table>
<hr>
	
	<c:if test="${startPage > pageBlock }"> 
	<a href="./FaqList.fa?pageNum=${startPage-pageBlock} ">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	<a href="./FaqList.fa?pageNum=${i }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${endPage<pageCount }">
	<a href="./FaqList.fa?pageNum=${startPage+pageBlock} ">[다음]</a>
	</c:if>
<br>

<a href="./FaqWrite.fa">글쓰기</a>
<a href="./Main.me">메인으로</a>
</body>
</html>