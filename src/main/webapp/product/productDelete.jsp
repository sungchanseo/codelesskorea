<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>productDelete.jsp(MVC)</h1>

<h2> ��ǰ���� ����</h2>

	<c:if test="${empty id }">
		<c:redirect url="/MemberLogin.me" />
	</c:if>


	<fieldset>
		<legend>ī�װ��� �������ּ���</legend>
		<form action="./ProductDeleteAction.me" method="post">
			<input type="hidden" name="product_id" value=${id }> ��й�ȣ : <input
				type="password" name="pw" placeholder="��й�ȣ�� �Է��ϼ���."> <br>
			<input type="submit" value="��ǰ ����">
		</form>
	</fieldset>

</body>
</html>