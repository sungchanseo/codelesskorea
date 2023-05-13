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
<h1>noticeContent</h1>
페이지번호 ${pageNum }
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
			 <td>이미지</td>   
   			<td><img src="./upload/${dto.notice_image }"/></td>
   			
		</table>

<c:if test="${id.equals('admin@gmail.com') }">
<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }&pageNum=${pageNum}">게시글 수정</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }&pageNum=${pageNum}">게시글 삭제</a>
</c:if>
<a href="./NoticeList.no?pageNum=${pageNum }">목록으로</a>
</body>
</html>