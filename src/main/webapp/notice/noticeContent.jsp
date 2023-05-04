<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>noticeContent</h1>

${requestScope.dto }


	<table border="1">
		   <tr>
		     <th>글번호</th>
		     <td>${dto.notice_id }</td>
		   </tr> 
		   <tr>
		     <td>제목</td>
		     <td>${dto.title }</td>
		   </tr> 
		   <tr>
		     <td>작성일</td>
		     <td>${dto.date }</td>
		   </tr> 
		   <tr>
		     <td>조회수</td>
		     <td>${dto.count }</td>
		   </tr> 
		   <tr>
		     <td>내용</td>
		     <td>${dto.content }</td>
		   </tr> 
		</table>


<a href="./NoticeUpdate.me">게시글 수정</a>
<a href="./NoticeDelete.me">게시글 삭제</a>
<a href="./NoticeList.me">목록으로</a>
</body>
</html>