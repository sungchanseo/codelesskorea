<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
<!-- 	<h1>memberList.jsp</h1> -->
	<h2>회원정보 목록페이지 (관리자용)</h2>
	<%
	// 세션제어 (로그인+관리자일때만 사용가능)
	%>
	
	<c:if test="${ empty sessionScope.id || !id.equals('admin@gmail.com') }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	<!-- Action에서 받아온 정보(memberList) -->	
	<table border="1">
	   <tr>
	      <td>아이디</td>
	      <td>비밀번호</td>
	      <td>이름</td>
	      <td>닉네임</td>
	      <td>전화번호</td>
	      <td>주소</td>
	      <td>사진</td>
	      <td>가입일</td>
	      <td>생년월일</td>
	      <td>회원상태</td>
	   </tr>
	   <!-- rs(데이터) <- DTO <- List -->
	   <c:forEach var="dto" items="${requestScope.memberList }">
		   <tr>
		      <td>${dto.id }</td>
		      <td>${dto.password }</td>
		      <td>${dto.name }</td>
		      <td>${dto.nickname }</td>
		      <td>${dto.phone_number }</td>
		      <td>${dto.address }</td>
		      <td>${dto.user_image }</td>
		      <td>${dto.regdate }</td>
		      <td>${dto.birth_date }</td>
		      <td><input type="checkbox" name="blocked"></td>
		   </tr>
	   	</c:forEach>
	</table>
	
	
	
	
		  <c:if test="${startPage > pageBlock }"> 
		   <a href="./MemberList.me?pageNum=${startPage-pageBlock} ">[이전]</a>
		   </c:if>
		   
		   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		   <a href="./MemberList.me?pageNum=${i }">[${i }]</a>
		   </c:forEach>
		   
		   <c:if test="${endPage<pageCount }">
		   <a href="./MemberList.me?pageNum=${startPage+pageBlock} ">[다음]</a>
		   </c:if>



<!--     <h2><a href="./Main.me">메인 페이지로</a></h2> -->



<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>