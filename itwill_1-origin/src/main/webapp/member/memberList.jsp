<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
		<h1>memberList.jsp(MVC)</h1>
		<h2> 회원정보 목록페이지 (관리자용)</h2>
		
		<c:if test="${empty id || !id.equals('admin') }">
			<c:redirect url="./MemberLogin.me"/>
		</c:if>
		
		<!-- Action에서 받아온 정보(memberList) -->
				<table border="1">
					<tr>
						<th>ID</th>
						<th>name</th>
						<th>gender</th>
						<th>age</th>
						<th>email</th
						><th>regdate</th>
					</tr>
					
					<!-- rs(데이터) <- DTO <- List -->
					<c:forEach var="dto" items="${requestScope.memberList }">
						<tr>
						<td>${dto.id }</td>
						<td>${dto.name }</td>
						<td>${dto.gender }</td>
						<td>${dto.age }</td>
						<td>${dto.email }</td>
						<td>${dto.regdate }</td>
						</tr>
					</c:forEach>	
				</table>
	</body>
</html>