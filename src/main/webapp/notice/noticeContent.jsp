<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp" %>
</head>
<body>
<%@include file="../nav.jsp" %>

 <!-- 사이드바 -->

  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> 공지게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./NoticeList.no'"> 공지사항</h5>
  <h5> 자주하는질문</h5>
  </div>
	</div>	
  
 <!--   사이드바 -->
 
<%-- ${requestScope.dto } --%>

<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">${dto.title }</h1>
<hr style="border: 0;height: 3px; background-color: black;">
${dto.notice_image }
${realpath }
	<table class="table" id="nttable">
		   <tr>
		     <td>NO. ${dto.notice_id }</td>
		     <td>작성일</td>
		     <td>${dto.date }</td>
		     <td>조회수</td>
		     <td>${dto.count }</td>
		   </tr> 
		   <tr>
		     <td>내용</td>
		     <td colspan="4">${dto.content }</td>
		   </tr> 
			 <td>이미지</td>   
   			<td colspan="4"><img src="./upload/${dto.notice_image }"/></td>
   			
		</table>

<div style= "float: right; margin-top: 80px;">
<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }" class="btn btn-primary">게시글 수정</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }" class="btn btn-primary">게시글 삭제</a>
<a href="./NoticeList.no?pageNum=${pageNum }" class="btn btn-secondary">목록으로</a>
</div>
</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>