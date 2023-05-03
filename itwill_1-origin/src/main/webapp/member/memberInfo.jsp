
<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h1>memberInfo.jsp(MVC)</h1>
		
		<h2> 회원가입시 입력한 정보를 화면에 출력</h2>
		
<!-- 		로그인 세션 제어 (로그인 했을때만 사용) -->
<!-- 		로그인한 회원의 정보(DB)를 화면에 출력  -->
		<c:if test="${empty sessionScope.id }">
			<c:redirect url="./MemberLogin.me"/>
		</c:if>
		
		${dto }<br>
		${requestScope.dto }<br>
		
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>${dto.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${dto.pw }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.name }</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${dto.age }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.gender }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td>${dto.regdate }</td>
				</tr>
			</table>
			
			<h2><a href="./Main.me">메인페이지로</a></h2>
			<a href="./PasswordUpdate.me">비밀번호 변경</a>
			<input type="button" value="코드리스와 이별 하기" onclick=" location.href='./MemberDelete.me';">

		
	</body>
</html>