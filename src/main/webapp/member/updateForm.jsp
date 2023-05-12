<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->

<script type="text/javascript">

	function addr() {
		new daum.Postcode({
			    oncomplete : function(data) {
				document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
				document.getElementById("address").value = data.address; // 주소 넣기
			}
		}).open();
	}; //우편주소창부르기
	
	
	$(document).ready(function () {
		
		$('#nickname').keyup(function(){

			  $.ajax({
				  url : "./AjaxNickAction.aj",
				  data: {"nickname": $('#nickname').val()},
				  success:function(data){
					  const result = $.trim(data);
					  if(result=="yes" && !$('#nickname').val() == ""){
					
					  $('#nickmsg').css('color','green');
					  $('#nickmsg').text("사용가능한 닉네임입니다.");
					  $('#submit').removeAttr('disabled');
					  return;
					  }else if ( result=="no" && !$('#nickname').val() == ""){
					 
					  $('#nickmsg').css('color','red');
					  $('#nickmsg').text("이미 존재하는 닉네임입니다.");  
					  $('#submit').attr('disabled','disabled');
					  return;
					  }
				  }//success 
			  });// ajax
		  }); // 닉네임중복확인 
				
		
		$('#alert-success').hide();
		$('#alert-danger').hide();
		
		
		$('#fr').submit(function() {
			if($('#id').val() == ""){
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			}//아이디 입력 제어
			
			if($('#name').val() == ""){
				alert('이름을 입력하세요.');
				$('#name').focus();
				return false;
			}//이름 입력 제어
			
			if($('#nickname').val() == ""){
				alert('닉네임을 입력하세요.');
				$('#nickname').focus();
				return false;
			}//닉네임 입력 제어
						
			if($('#phone_number').val() == ""){
				alert('연락처를 입력하세요.');
				$('#phone_number').focus();
				return false;
			}//연락처 입력 제어
			
			if($('#birth_date').val() == ""){
				alert('생년월일을 입력하세요.');
				$('#birth_date').focus();
				return false;
			}//생일 입력 제어
			
			if($('#address').val() == ""){
				alert('주소를 입력하세요.');
				$('#address').focus();
				return false;
			}//주소 입력 제어
			


		});//정보 입력안하면 submit기능 제어 끝
		
		  
	});//총function끝
	

		
		

</script>

</head>
<body>



<!-- 		<h1>updateForm.jsp(ITWILL)</h1> -->
<!-- 		이름, 연락처,  닉네임(중복불가), 사진(선택사항), 주소 수정가능-->

			<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
			
<!--  사이드바 -->
<div>
<div class="col-sm-4">
<%@ include file="../mySide.jsp"%>
</div>
</div>
<!--  사이드바 -->
			

	 <div class="col-sm-8" style="margin:auto;">
	<div class="container" id="login-con"
		style="width: 900px; color: black;">


		<form action="./MemberUpdateProAction.me" id="fr" method="post">

			<div class="form-group" id="log-form" style="width: 400px;">
				<h2>
					<b>정보수정을 위해</b>
				</h2>
				<h2 style="margin-bottom: 50px;">
					<b>수정정보를 입력해주세요:)</b>
				</h2>

				아이디 <input type="email" class="form-control" id="id"
					value=${requestScope.dto.id } name="id" readonly> <br> 
					
				
				이름 <input type="text" class="form-control" name="name" id="name"  value="${dto.name }">
					 <br>
				
				닉네임 <input type="text" class="form-control" name="nickname" id="nickname"
						value="${dto.nickname }">	
				<span id="nickmsg"></span>
					 <br> 
				
				연락처 <input type="text" class="form-control"
					name="phone_number" placeholder="010-0000-0000 형태로 입력해주세요." id="phone_number"
					value="${dto.phone_number }">
					 <br> 
				
				생년월일 <input type="date" class="form-control"
					name="birth_date" id="birth_date" value="${dto.birth_date }" readonly="readonly"> 
					<br>
			 	
			 	주소
				<table>
					<tr>
						<td><input type="text" name="zipcode" id="zipcode" size="15">
							<input type="button" value="우편번호찾기" onclick="addr();"></td>
					</tr>
					<tr>
						<td><input type="text" name="address" id="address" size="45" onclick="addr();" value="${dto.address}"></td>
					<tr>
					<tr>
						<td><input type="text" name="address2" id="address2" size="45" placeholder="상세주소를 입력해주세요."></td>
					<tr>
				</table>
				
				
				<br> 프로필사진 <input type="file" name="user_image">
				 <br><br>


      	<button type="submit" class="btn btn-primary btn-block"
										style="margin-top: 40px;" id="submit">내정보 수정 완료</button>

		<a href="./PasswordUpdate.me" class="btn btn-primary btn-block"
										style="margin-top: 40px;" >비밀번호 변경</a>
										
		<a href="./MemberDelete.me" class="btn btn-secondary btn-block"style="margin-top: 40px;" >코드리스와 이별하기</a> 
  	</div>
  </form>
  
</div>
</div>
	<!-- 업데이트 컨테이너박스 끝 -->
	
	
 <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
	
		
</body>
</html>