<%@page import="com.itwillbs.db.QnADTO"%>
<%@page import="com.itwillbs.db.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../head.jsp"%>
</head>

<body>
<%@ include file="../nav.jsp"%>


	 <!--   사이드바 -->
	  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> QnA 게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./UserQNAList.qn'"> 질문 목록 </h5>
  <h5 onclick="location.href='./MypageQNAInsert.qn'"> 1:1 문의 </h5>

  </div>
	</div>	
	

	
	 <!--   사이드바 -->
<div class="col-sm-8" style="margin:auto;">
	 

 <div id="right" style="margin-left: 50px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">QnA 질문목록</h1>
<hr style="border: 0;height: 3px; background-color: black;">

<input type="hidden" name="bno" value="${qdto.bno }">
<input type="hidden" name="pageNum" value="${pageNum }">
<fieldset>
<legend>글 내용 보기</legend>


<fieldset>
<legend>Q&A 상세보기</legend>
<table border="1">
  <tr>
    <th>글번호</th>
    <td>${qdto.bno }</td>
<c:if test="${qdto.re_Lev < 1}">
  <th>답변상태</th>
  <td>
    <c:choose>
      <c:when test="${qdto.is_answered}">
        <span style="color: green;">답변완료</span>
      </c:when>
      <c:otherwise>
        <span style="color: red;">답변대기</span>
      </c:otherwise>
    </c:choose>
  </td>
</c:if>
    <th>카테고리</th>
    <td>${qdto.qnaCategory }</td>
  </tr>
  <tr>
    <th>작성자</th>
    <td>${qdto.nickname }</td>
    <th>작성일</th>
    <td>${qdto.regdate }</td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="5">${qdto.title }</td>
  </tr>
  <tr>
<tr>
  <th>이미지</th>
  <td colspan="3"><img src="./upload/${qdto.image}" alt="첨부사진" width="300" height="300"></td>
</tr>
  <tr>
    <th>내용</th>
    <td colspan="5"><textarea rows="15" cols="50" name="content" maxlength="700" readonly="readonly">${qdto.content }</textarea></td>
  </tr>
  <tr>
    <td colspan="6" style="text-align:center">
      <input type="button" value="목록으로" class="btn" onclick="location.href='./UserQNAList.qn?pageNum=${pageNum }'">
	<c:if test="${id eq qdto.id}">
	<input type="button" value="글삭제" class="btn" onclick="location.href='./UserQNADeleteAction.qn?bno=${qdto.bno}&pageNum=${pageNum}'">
	</c:if>
    </td>
  </tr>
</table>
</fieldset>
</div></div>

  <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>