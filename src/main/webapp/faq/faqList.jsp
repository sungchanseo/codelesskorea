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
<a href="./FAQContent.me">글보기</a>
<a href="./FAQWrite.me">글쓰기</a>
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
<h1>�옄二쇳븯�뒗 吏덈Ц</h1>
<h2>寃��깋李� �뱾�뼱媛��뒗 �옄由�</h2>
<h2>移댄뀒怨좊━ �뱾�뼱媛��뒗 �옄由�</h2>
�럹�씠吏�踰덊샇 : ${pageNum }<br>
${requestScope.faqList }<br>
<table border="1">
   <tr>
     <th>FAQ踰덊샇</th>
     <td>移댄뀒怨좊━</td>
     <td>�젣紐�</td>
     <td>�넗湲�踰꾪듉�옄由�</td>
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
	<a href="./FAQList.me?pageNum=${startPage-pageBlock} ">[�씠�쟾]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
	<a href="./FAQList.me?pageNum=${i }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${endPage<pageCount }">
	<a href="./FAQList.me?pageNum=${startPage+pageBlock} ">[�떎�쓬]</a>
	</c:if>
<br>


<a href="./FAQWrite.me">湲��벐湲�</a>
<a href="./Main.me">硫붿씤�쑝濡�</a>
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>