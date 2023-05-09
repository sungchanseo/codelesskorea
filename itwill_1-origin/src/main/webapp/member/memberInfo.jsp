
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="../head.jsp" %>
	
		<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
<!-- 		<h1>memberInfo.jsp(MVC)</h1> -->
		
<!-- 		<h2> 회원가입시 입력한 정보를 화면에 출력</h2> -->
		
		<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
		
		<%
		  // 로그인 세션 제어 (로그인 했을때만 사용)
		  // 로그인한 회원의 정보(DB)를 화면에 출력
		%>
		<c:if test="${ empty sessionScope.id }">
		   <c:redirect url="./MemberLogin.me"/>
		</c:if>
				 <div class="container" id="login-con">
		
			<div class="container" id="log-form" style="width: 400px;">
				<h2>
					<b>내정보 보기</b>
				</h2>

				아이디 <input type="email" class="form-control" id="id"
					value=${requestScope.dto.id } name="id" readonly> <br> 
					
				
				이름 <input type="text" class="form-control" name="name" id="name"  value="${dto.name }" readonly="readonly">
					 <br>
				
				닉네임 <input type="text" class="form-control" name="nickname" id="nickname"
						value="${dto.nickname }" readonly="readonly">	
				<span id="nickmsg"></span>
					 <br> 
				
				연락처 <input type="text" class="form-control"
					name="phone_number"  id="phone_number"
					value="${dto.phone_number }" readonly="readonly">
					 <br> 
				
				생년월일 <input type="date" class="form-control"
					name="birth_date" id="birth_date" value="${dto.birth_date }" readonly="readonly"> 
					<br>
			 	주소
				<table>
					<tr>
						<td><input type="text" name="address" id="address" size="45" onclick="addr();" value="${dto.address}" readonly="readonly"></td>
					<tr>
					<tr>
						<td><input type="text" name="address2" id="address2" size="45"  readonly="readonly"></td>
					<tr>
				</table>
				
				
				<br> 프로필사진 <input type="image" name="user_image" readonly="readonly" value="${dto.user_image} "> 

		</div>
		
		
      	<a href="./MemberUpdate.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >
										내정보 수정 하기</a>

		<a href="./PasswordUpdate.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >비밀번호 변경</a> 
										
		<a href="./MemberDelete.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >코드리스와 이별하기</a>  <br>
			</div>

<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
	</body>
</html>