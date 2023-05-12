<%@page import="com.itwillbs.db.MypageDAO"%>
<%@page import="com.itwillbs.db.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
// 	function check(){
// 		if(confirm('정말로 글을 삭제 하시겠습니까?')) {
// 		    return true;
// 			} else {
// 		    return false;
// 			}//글삭제전 확인
// 	};
	
	


</script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../head.jsp"%>
</head>

<body>
<%@ include file="../nav.jsp"%>


	<c:if test="${ empty sessionScope.id || !id.equals('admin@gmail.com') }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>


	 <!--   사이드바 -->
	  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> QnA 게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./AdminQNAList.qn'"> 질문 목록  </h5>
  </div>
	</div>	
	
	
	 <!--   사이드바 -->
<div class="container" style="margin: auto; margin-bottom: 300px;">	 
<div class="col-sm-8" style="margin:auto;">
<div id="right" style="margin-left: 50px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">QnA 상세보기</h1>
<hr style="border: 0;height: 3px; background-color: black;">



<input type="hidden" name="bno" value="${qdto.bno }">
<input type="hidden" name="pageNum" value="${pageNum }">




<fieldset style="margin: auto; ">
<table border="1"  style="margin: auto;" class="table" id="nttable">
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
    <td colspan="5"><textarea rows="15" cols="60" name="content" maxlength="700" readonly="readonly" style="margin: auto;">${qdto.content}</textarea></td>
  </tr>
  </table>
 
  
	<div style= "float: right; margin-top: 50px;">
     <input type="button" value="목록으로" class="btn btn-secondary" onclick="location.href='./AdminQNAList.qn'">
     <input type="button" value="글삭제" class="btn btn-primary" onclick="location.href='./QNADeleteAction.qn?bno=${qdto.bno }&pageNum=${pageNum}'">
     <c:if test="${id eq qdto.id}">
	<input type="button" value="글수정" class="btn btn-primary" onclick="location.href='./QNAUpdate.qn?bno=${qdto.bno }&pageNum=${pageNum}'">
	</c:if>
	 
	<c:if test="${qdto.re_Lev < 1 }">
  <c:choose>
    <c:when test="${qdto.is_answered eq true}">
      <input type="button" value="답변하기" class="btn btn-primary" onclick="alert('이미 처리된 답변입니다!');">
    </c:when>
    <c:otherwise>
      <input type="button" value="답변하기" class="btn btn-primary" onclick="location.href='./QNAReWrite.qn?bno=${qdto.bno }&pageNum=${pageNum}&re_ref=${qdto.re_Ref }&re_lev=${qdto.re_Lev }&re_seq=${qdto.re_Seq }'">
    </c:otherwise>
  </c:choose>
</c:if>

</fieldset>
</div>	
</div>
</div>


  <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>