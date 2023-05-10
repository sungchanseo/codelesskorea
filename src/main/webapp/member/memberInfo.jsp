
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
<<<<<<< HEAD
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<%@ include file="../head.jsp" %>
	
		<meta charset="UTF-8">
	<title>CODELESS - 내정보보기</title>
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
		
		
		  <!-- 사이드바 -->
		  <div class="container" id="left">
		  <br>
		  <h4> 마이페이지</h4>
		  
		  <c:if test="${id!='admin' && id!='admin@gmail.com' }">
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberUpdate.me'"> 내정보수정</h5>
		  <h5 onclick="location.href='./MypageSalesList.my'"> 판매목록</h5>
		  <h5 onclick="location.href='./MypagePurchaselist.my'"> 구매목록</h5>
		  <h5 onclick="location.href='./LikeList.my'"> 찜목록</h5>
		  </c:if>
		  
		  <c:if test="${id=='admin' || id=='admin@gmail.com' }">
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberUpdate.me'"> 내정보수정</h5>
		  <h5 onclick="location.href='./MemberList.me'"> 회원관리</h5>
		  <h5 onclick="location.href='./AdminsaleListAction.my''"> 판매목록</h5>
		  <h5 onclick="location.href='./AdminQNAList.qn'"> 1:1문의관리</h5>
		  </c:if>
		  </div>
		  <!-- 사이드바 -->
				
				 <div class="container" id="login-con" style="width: 800px;">
		
			<div class="container" id="log-form" >
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

		
		
      	<a href="./MemberUpdate.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >
										내정보 수정 하기</a>

		<a href="./PasswordUpdate.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >비밀번호 변경</a> 
										
		<a href="./MemberDelete.me" class="btn btn-secondary btn-block"
										style="margin-top: 40px;" >코드리스와 이별하기</a>  <br>
			</div>
</div>
		
<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
=======
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

		
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
	</body>
</html>