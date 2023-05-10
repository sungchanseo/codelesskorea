<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
<title>Insert title here</title>
</head>
<body>
<h1>faqContent</h1>
<<<<<<< HEAD
<a href="./FAQUpdate.me">�����ϱ�</a>
<a href="./FAQDelete.me">�����ϱ�</a>
=======
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
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>