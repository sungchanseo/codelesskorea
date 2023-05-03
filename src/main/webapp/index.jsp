<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>index.jsp</h1>
		<%
			// MVC 프로젝트의 시작지점
			// 해당 프로젝트에서 실행가능한 유일한 jsp 페이지
			
			// -> 만약, 실행시킨 페이지 주소가 ~.jsp 동작 => 잘못된 구현
			
// 			response.sendRedirect("./itwill.me");
// 			response.sendRedirect("./MemberJoin.me");
// 			response.sendRedirect("./MemberLogin.me");
			response.sendRedirect("./Main.me");
		%>
	</body>
</html>