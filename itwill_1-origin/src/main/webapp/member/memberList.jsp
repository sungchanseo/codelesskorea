<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8"> 
		<script type="text/javascript">
		
		
		$(document).ready(function() {
			  $('.block-btn').change(function() {
			    var id = $(this).data('user-id');
			    var blocked = $(this).prop('checked');
			    $.ajax({
			      url: './AjaxBlockedAction.ta',
			      data: {id: id, blocked: blocked},
			      success: function(data) {
			        console.log(data);
			        alert('회원정보 변경 완료!');
			        location.reload();
			      }
			    });
			  });
			});



		</script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
<!-- 	<h1>memberList.jsp</h1> -->
	<!-- 사이드바 -->
	<%@ include file="../mySide.jsp"%>
	<!-- 사이드바 -->
	<h2>회원정보 목록페이지 (관리자용)</h2>
	<%
	// 세션제어 (로그인+관리자일때만 사용가능)
	%>	
	<c:if test="${ empty sessionScope.id || !id.equals('admin@gmail.com') }">
		<c:redirect url="./MemberLogin.me"/>
	</c:if>
	
	<div class="container" id="mright" style="margin-left: 250px;  height: 1000px;">
  <h1 align="center" style="font-family: 'TheJamsil5Bold';">공 지 사 항</h1>
<hr style="border: 0;height: 3px; background-color: black;">
	<!-- Action에서 받아온 정보(memberList) -->	
	<table class="table table-striped" style="height: 10px;">
	   <tr>
	      <td>아이디</td>
	      <td>비밀번호</td>
	      <td>이름</td>
	      <td>닉네임</td>
	      <td>전화번호</td>
	      <td>주소</td>
	      <td>사진</td>
	      <td>가입일</td>
	      <td>생년월일</td>
	      <td>회원상태</td>
	   </tr>
	   <!-- rs(데이터) <- DTO <- List -->
	   <c:forEach var="dto" items="${requestScope.memberList }">
		   <tr>
		      <td width="10px;">${dto.id }</td>
		      <td  width="10px;">${dto.password }</td>
		      <td  width="10px;">${dto.name }</td>
		      <td  width="10px;">${dto.nickname }</td>
		      <td>${dto.phone_number }</td>
		      <td  width="200px;">${dto.address }</td>
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
</html>