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

<!-- <script>
$(function(){
	var formDate = {
			notice_id = $("#notice_id").val();
		};
	
	$.ajax({
		url:"./MemberFrontController.me",
		type:"POST",
		data:JSON.stringify(formData),
		dataType: 'json',
		success: function (result) {
		      // 성공한 경우 처리할 내용을 작성합니다.
		      alert("데이터가 성공적으로 전송되었습니다.");
		    },
		    error: function (e) {
		      // 실패한 경우 처리할 내용을 작성합니다.
		      alert("데이터 전송이 실패하였습니다.");
		    }
	}); 
</script>
 -->


<h1>noticeContent</h1>

<%-- ${requestScope.dto } --%>


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


<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }">게시글 수정</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }">게시글 삭제</a>
<a href="./NoticeList.no?pageNum=${pageNum }">목록으로</a>
</body>
</html>