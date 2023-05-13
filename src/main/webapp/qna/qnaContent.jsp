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

<style type="text/css">
table {
  margin: auto;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
  border: 1px solid #ddd;
}

th {
  background-color: #F2F2F2;
}

th:first-child, td:first-child {
  min-width: 100px;
}

th:nth-child(2), td:nth-child(2) {
  min-width: 100px;
}

th:nth-child(3), td:nth-child(3) {
  min-width: 120px;
}

th:nth-child(4), td:nth-child(4) {
  min-width: 120px;
}

td:last-child {
  text-align: center;
}

textarea {
  width: 100%;
  margin: auto;
  padding: 10px;
  border: 1px solid #ddd;
  resize: none;
  overflow: auto;
}

th:nth-of-type(3), td:nth-of-type(4) {
  width: 80px; !important;
}

</style>


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
 <h1 style="font-family: 'TheJamsil5Bold';">내용보기</h1>
<hr style="border: 0;height: 3px; background-color: black;">

<input type="hidden" name="bno" value="${qdto.bno }">
<input type="hidden" name="pageNum" value="${pageNum }">
<fieldset style="margin: auto; ">
<table border="1"  style="margin: auto;" >
  <tr>
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
<c:if test="${qdto.re_Lev < 1}">
    <th>카테고리</th>
    <td>${qdto.qnaCategory}</td>
</c:if>
  </tr>
  <tr>
    <th>작성자</th>
    <td>${qdto.nickname}</td>
    <th>작성일</th>
    <td>${qdto.regdate}</td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="5">${qdto.title}</td>
  </tr>
  <tr>
<th>이미지</th>
<td colspan="3"><img src="./upload/${qdto.image}" alt="첨부사진" style="max-width: 300px; max-height: 300px;"></td>
  </tr>
  <tr>
    <th>내용</th>
    <td colspan="5"><textarea cols="60" rows="15" readonly="readonly" style="border: none;">${qdto.content}</textarea></td>
  </tr>
  </table>


	<div style= "float: right; margin-top: 30px;">
     <input type="button" value="목록으로" class="btn btn-secondary" onclick="location.href='./UserQNAList.qn?pageNum=${pageNum }'">
	<c:if test="${id eq qdto.id}">
	<input type="button" value="글삭제" class="btn btn-primary" onclick="location.href='./UserQNADeleteAction.qn?bno=${qdto.bno}&pageNum=${pageNum}'">
	</c:if>
	
	</div>
</fieldset>
</div></div>
<br>
  <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>