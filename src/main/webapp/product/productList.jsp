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
<meta charset="EUC-KR">
<title>productList</title>
</head>
<body>
	<h1>상품 리스트</h1>
<!-- Action에서 받아온 정보(memberList) -->
<table border="1">
	<tr>
		<th>상품번호</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
	
	<!-- rs(데이터) <- DTO <- List -->
	<c:forEach var="dto" items="${requestScope.productList }">
		<tr>
			<td>${dto.product_id}</td>
			<td><a href="./ProductContent.me?product_id=${dto.product_id}">${dto.title}</a></td>
			<td>${dto.price}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>