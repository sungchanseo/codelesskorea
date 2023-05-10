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
<title>매칭된 리스트</title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f2f2f2;
	}
	h1 {
		text-align: center;
	}
	table {
		margin: 0 auto;
		border-collapse: collapse;
		width: 80%;
		background-color: #fff;
		box-shadow: 0 0 20px rgba(0,0,0,0.1);
	}
	th, td {
		text-align: center;
		padding: 10px;
	}
	th {
		background-color: #e6e6e6;

	}
	tr:nth-child(even) {
		background-color: #f2f2f2;
	}
	tr:hover {
		background-color: #e6e6e6;
	}
	a {
		color: #000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<h1>매칭된 리스트</h1>
	<!-- Action에서 받아온 정보(memberList) -->
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<!-- rs(데이터) <- DTO <- List -->
		<c:forEach var="product" items="${requestScope.productList }">
			<tr>
				<td>${product.product_id}</td>
				<td><a href="./ProductContent.pr?product_id=${product.product_id}" target="_blank">${product.title}</a></td>
				<td>${product.price}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>