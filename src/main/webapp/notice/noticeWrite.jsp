<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<%@ include file="../head.jsp"%>
</head>
<body>
<%@ include file="../nav.jsp"%>

<h1>noticeWrite</h1>
  <!-- 사이드바 -->
  <div class="container" id="left">
  <br>
  <h4> 공지게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./NoticeList.me'"> 공지사항</h5>
  <h5> 자주하는질문</h5>
  </div>
  <!-- 사이드바 -->

<div class="container" id="right" style="margin-left: 400px;">
<h1 align="center" style="font-family: 'TheJamsil5Bold';">공 지 작 성</h1>
<hr style="border: 0;height: 3px; background-color: black;">
  <div class="container" style="padding: 20px;">
  <form action="./NoticeWriteAction.no" method="post">
    <label>글제목
    <input type="text" name="title" placeholder="글제목을 입력하세요" class="form-control" size="91%">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content" placeholder="글 내용을 작성하세요" class="form-control" rows="10" cols="93"></textarea>
	</label>
	<br>
	
	<div style= "float: right; margin-top: 10px;">
	<!-- 관리자만 글작성할 수 있게 해주세요 -->
	<button type="submit" class="btn btn-primary">작성완료</button>
	<button type="button" class="btn btn-secondary" onclick="location.href='./NoticeList.no'">목록</button>
	</div>

	
  </form>
 </div>
</div>
<%@ include file="../footer.jsp"%>
=======
</head>
<body>
<h1>noticeWrite</h1>

<div class="container">
  <form action="./NoticeWriteAction.me" method="post">

   
    <label>글제목
    <input type="text" name="title" placeholder="글제목을 입력하세요">
	</label>
	<br>
    <label>글 내용<br>
    <textarea name="content" placeholder="글 내용을 작성하세요" style="height:200px"></textarea>
	</label>
	<br>


    <input type="submit" value="작성완료">
	
  </form>
 <a href="./NoticeList.no">목록으로</a>
</div>

>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>