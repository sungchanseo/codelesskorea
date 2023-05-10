<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8"> 
		<script type="text/javascript">
		
		
		$(document).ready(function() {
		    $('.block-btn').change(function() {
		        var id = $(this).data('user-id');
		        var blocked = $(this).prop('checked');
		        $.ajax({
		            url: './AjaxBlockedAction.aj',
		            data: {id: id, blocked: blocked},
		            success: function(data) {
		                console.log(data);
		                alert('회원정보 변경 완료!');
		                location.reload();
		            }
		        });
		    });

		    $('button[name="adminsaleList"]').click(function() {
		    	  var id = $(this).val();
		    	  window.open('./AdminsaleListAction.my?id=' + id, '_blank', 'width=800,height=600');
		    });

		    	$('button[name="adminbuyList"]').click(function() {
		    	  var id = $(this).val();
		    	  window.open('./AdminbuyListAction.my?id=' + id, '_blank', 'width=800,height=600');
		    });
		    
		});

		</script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
<!-- 	<h1>memberList.jsp</h1> -->

   <!--  사이드바 -->
   <%@ include file="../mySide.jsp"%>
   <!--  사이드바 -->
	<h2>회원정보 목록페이지 (관리자용)</h2>
	<%
	// 세션제어 (로그인+관리자일때만 사용가능)
	%>
	
	<c:if test="${ empty sessionScope.id || !id.equals('admin@gmail.com') }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	<div class="container">
	<!-- Action에서 받아온 정보(memberList) -->	
	<table class="table" style="font-size: 12px;">
	<thead>
	   <tr style="height: 10px;">
	      <th>아이디</th>
	      <th>비밀번호</th>
	      <th>이름</th>
	      <th>닉네임</th>
	      <th>전화번호</th>
	      <th>주소</th>
	      <th>사진</th>
	      <th>가입일</th>
	      <th>생년월일</th>
	      <th>회원상태</th>
	     <th>구매목록</th>
	     <th>판매목록</th>
	   </tr>
	   </thead>
	   <!-- rs(데이터) <- DTO <- List -->
	   <c:forEach var="dto" items="${requestScope.memberList }">
		   <tr style="height: 5px;">
		      <td>${dto.id }</td>
		      <td>${dto.password }</td>
		      <td>${dto.name }</td>
		      <td>${dto.nickname }</td>
		      <td>${dto.phone_number }</td>
		      <td>${dto.address }</td>
		      <td>${dto.user_image }</td>
		      <td>${dto.regdate }</td>
		      <td>${dto.birth_date }</td>
		      <td><input type="checkbox" name="blocked" id="blocked" class="block-btn" value="false" data-user-id="${dto.id}"
		      <c:if test="${dto.blocked}">checked</c:if>>
				  <c:if test="${dto.blocked}">
				    <span style="color:red">차단</span>
				  </c:if>
				  <c:if test="${!dto.blocked}">
				    <span style="color:green">정상</span>
				  </c:if>
		      </td>
		    <td><button type="button" name="adminbuyList" value="${dto.id}">구매목록</button></td>
			<td><button type="button" name="adminsaleList" value="${dto.id}">판매목록</button></td>
		   </tr>
	   	</c:forEach>
	</table>
	
	
	
	
		  <c:if test="${startPage > pageBlock }"> 
		   <a href="./MemberList.me?pageNum=${startPage-pageBlock} ">[이전]</a>
		   </c:if>
		   
		   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		   <a href="./MemberList.me?pageNum=${i }">[${i }]</a>
		   </c:forEach>
		   
		   <c:if test="${endPage<pageCount }">
		   <a href="./MemberList.me?pageNum=${startPage+pageBlock} ">[다음]</a>
		   </c:if>

</div>

<!--     <h2><a href="./Main.me">메인 페이지로</a></h2> -->



<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
=======
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
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</html>