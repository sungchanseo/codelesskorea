<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>��ǰ���� ����</h1>

	<c:if test="${empty id }">
		<c:redirect url="/MemberLogin.me" />
	</c:if>
	
	
</body>
</html>