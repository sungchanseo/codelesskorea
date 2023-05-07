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
	<% 
	
	String id = (String)session.getAttribute("id");
	
	%>

		<c:if test="${ empty sessionScope.id }">
		   <c:redirect url="./MemberLogin.me"/>
		</c:if>
	

<!-- 	<h1>myPage.jsp</h1> -->
		<br>
		<h2>마이페이지</h2>
		<input type="button" value="내정보 조회하기" onclick=" location.href='./MemberInfo.me';"><br><br>

		<%if ( !id.equals("admin@gmail.com") ){  %><br>
		<input type="button" value="1:1 게시판(QNA)" onclick=" location.href='./UserQNAList.me';">
		<%} %>
	
	
		<%if ( id.equals("admin@gmail.com") ){  %>
		<a href="./MemberList.me">회원관리</a>
		<a href="./ProductList.me">상품관리</a>
		<input type="button" value="1:1 게시판" onclick=" location.href='./AdminQNAList.me';">
		<%} %>
		
		<input type="button" value="구매목록" onclick=" location.href='./MypagePurchaselist.me';">
		<input type="button" value="판매목록" onclick=" location.href='./MypageSalesList.me';">
		<a href="./LikeList.me">찜목록</a><br>
		<a href="./ChatBox.me">채팅목록</a><br>

	
	
	
<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>