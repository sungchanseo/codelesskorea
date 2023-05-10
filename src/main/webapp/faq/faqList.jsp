<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>faqList</h1>
<a href="./FAQContent.me">�ۺ���</a>
<a href="./FAQWrite.me">�۾���</a>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
${requestScope.faqList }<br>
<table border="1">
   <tr>
     <th>FAQ번호</th>
     <td>카테고리</td>
     <td>제목</td>
     <td>토글버튼자리</td>
   </tr> 

   <c:forEach var="dto1" items="${requestScope.faqList }">
   <tr>
     <td>${dto.faq_id }<input type="hidden" name="faq_id" value="${dto.faq_id }"></td>
     <td>${dto.category}</td>
     <td><a href="./FAQContent.me?faq_id=${dto.faq_id }&pageNum=${pageNum}">${dto.title }</a></td>
   </tr>
	</c:forEach>
</table>
<hr>
	
	<c:if test="${startPage > pageBlock }"> 
	<a href="./FAQList.me?pageNum=${startPage-pageBlock} ">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	<a href="./FAQList.me?pageNum=${i }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${endPage<pageCount }">
	<a href="./FAQList.me?pageNum=${startPage+pageBlock} ">[다음]</a>
	</c:if>
<br>


<a href="./FAQWrite.me">글쓰기</a>
<a href="./Main.me">메인으로</a>
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>