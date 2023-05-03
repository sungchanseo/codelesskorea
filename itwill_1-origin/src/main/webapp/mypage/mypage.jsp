<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:if test="${ empty sessionScope.id }">
		   <c:redirect url="./MemberLogin.me"/>
		</c:if>


	<h1>myPage.jsp</h1>
	
		<input type="button" value="내정보 조회하기" onclick=" location.href='./MemberInfo.me';"><br>
		<input type="button" value="1:1 게시판(QNA)" onclick=" location.href='./QNAList.me';"><br>
		if ( id == admin ) {<br>
		<a href="./MemberList.me">회원관리</a><br>
		<a href="./ProductList.me">상품관리</a><br>
		} else {<br>

		<input type="button" value="구매목록" onclick=" location.href='./MypagePurchaselist.me';"><br>
		<input type="button" value="판매목록" onclick=" location.href='./MypageSalesList.me';"><br>
		<a href="./LikeList.me">찜목록</a>
}		

	
	
	

</body>
</html>