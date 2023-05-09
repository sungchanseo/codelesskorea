<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itwillbs.db.MypageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@page import="com.itwillbs.db.QnADTO"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

   <c:if test="${ empty sessionScope.id }">
      <c:redirect url="./MemberLogin.me" />
   </c:if>


<!--    <h1>qnaBoardList.jsp</h1> -->
   <h2>
      <a href="./UserQNAList.me"> 문의내역 </a>
   </h2>
   
   <h2>
      <a href="./MypageQNAInsert.me">1:1 문의 글쓰기</a>
   </h2>
   <hr>



	
	페이지번호 : ${pageNum }<br>
	아이디 : ${id }<br>
<%-- 	${requestScope.boardList } --%>
	<hr>
	
<table border="1">
   <tr>
     <th>작성일</th>
     <td>제목</td>
     <td>작성자</td>
     <td>처리상태</td>
   </tr> 

   <c:forEach var="qdto" items="${requestScope.boardList }">
<!-- rs <- DTO <- List -->
   <tr>
     <td>${qdto.regdate}</td>
     <td><a href="./QNAContent.me?bno=${qdto.bno }&pageNum=${pageNum}">${qdto.title }</a></td>
     
     <td>${qdto.nickname}</td>
      <c:if test="${qdto.re_Lev < 1}">
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
   </tr>
	</c:forEach>
</table>


	



  <c:if test="${startPage > pageBlock }"> 
   <a href="./UserQNAList.me?pageNum=${startPage-pageBlock} ">[이전]</a>
   </c:if>
   
   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
   <a href="./UserQNAList.me?pageNum=${i }">[${i }]</a>
   </c:forEach>
   
   <c:if test="${endPage<pageCount }">
   <a href="./UserQNAList.me?pageNum=${startPage+pageBlock} ">[다음]</a>
   </c:if>


 <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>