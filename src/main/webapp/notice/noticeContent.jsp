<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>noticeContent</h1>
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


<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }">게시글 수정</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }">게시글 삭제</a>
<a href="./NoticeList.no?pageNum=${pageNum }">목록으로</a>
</body>
</html>