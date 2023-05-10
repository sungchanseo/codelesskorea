<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>faqContent</h1>
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

<%-- ${requestScope.dto } --%>

	<table border="1">
		   <tr>
		     <th>글번호</th>
		   </tr> 
		   <tr>
		     <td>제목</td>
		   </tr> 
		   <tr>
		     <td>작성일</td>
		   </tr> 
		   <tr>
		     <td>조회수</td>
		   </tr> 
		   <tr>
		     <td>내용</td>
		     <td>${dto.content }</td>
		   </tr> 
		</table>


<a href="./NoticeProUpdateAction.me?notice_id=${dto.notice_id }">게시글 수정</a>
<a href="./NoticeDelete.me?notice_id=${dto.notice_id }">게시글 삭제</a>
<a href="./NoticeList.me?pageNum=${pageNum }">목록으로</a>
</body>
</html>


<a href="./FAQUpdate.me">수정하기</a>
<a href="./FAQDelete.me">삭제하기</a>
</body>
</html>