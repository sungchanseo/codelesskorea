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
페이지번호 ${pageNum }
	<table border="1">
		   <tr>
		     <th>FAQ번호</th>
		     <td>${dto.faq_id }</td>
		   </tr> 
		   <tr>
		     <td>카테고리</td>
		     <td>${dto.category }</td>
		   </tr> 
		   <tr>
		     <td>제목</td>
		     <td>${dto.title }</td>
		   </tr> 
		   <tr>
		     <td>내용</td>
		     <td>${dto.content }</td>
		   </tr> 
		</table>


<a href="./FaqProUpdateAction.fa?faq_id=${dto.faq_id }&pageNum=${pageNum}">게시글 수정</a>
<a href="./FaqDelete.fa?faq_id=${dto.faq_id }">게시글 삭제</a>
<a href="./FaqList.fa?pageNum=${pageNum }">목록으로</a>
</body>
</html>
</body>
</html>