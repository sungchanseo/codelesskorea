<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../head.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<script src="../js/jquery-3.6.4.js"></script>
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
		
		$('#fr').submit(function() {
			if($('#id').val() == ""){
				alert('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			}//아이디 입력 제어
			
			if($('#password').val() == ""){
				alert('비밀번호를 입력하세요.');
				$('#password').focus();
				return false;
			}//비밀번호 입력 제어
			
			if($('#password2').val() == ""){
				alert('확인 비밀번호를 입력하세요.');
				$('#password2').focus();
				return false;
			}//비밀번호확인 입력 제어
			
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
			
			if($('#checkbox').is(':checked') == false){
				alert('약관에 동의해주세요.');
				$('#checkbox').focus();
				return false;
			}//약관동의 제어
			
			if($('#password').val() != $('#password2').val()){
				alert('확인 비밀번호가 다릅니다.');
				$('#password2').focus();
				return false;
			}
		});
		
	});

</script>
</head>
<body>
	<%@ include file="../nav.jsp"%><!-- nav 삽입 -->


	<div class="container" id="login-con"
		style="width: 800px; color: black;">


		<form action="./MemberJoinAction.me" id="fr" method="post">

			<div class="form-group" id="log-form" style="width: 400px;">
				<h2>
					<b>회원가입을 위해</b>
				</h2>
				<h2 style="margin-bottom: 50px;">
					<b>정보를 입력해주세요:)</b>
				</h2>

				아이디 <input type="email" class="form-control" id="id"
					placeholder="이메일 형식으로 입력해주세요." name="id"> <br> 
					
				비밀번호 <input type="password" class="form-control" id="password"
					placeholder="비밀번호를 입력해주세요." name="password">
					 <br> 
				
				비밀번호 확인 <input type="password" class="form-control"
					placeholder="비밀번호를 한번 더 입력해주세요." id="password2">
					 <br>
					 <span id="pwcheck">d</span>
					
					 <br>
				
				이름 <input type="text" class="form-control" name="name" id="name">
					 <br>
				
				닉네임 <input type="text" class="form-control" name="nickname" id="nickname">
					 <br> 
				
				연락처 <input type="text" class="form-control"
					name="phone_number" placeholder="010-0000-0000 형태로 입력해주세요." id="phone_number">
					 <br> 
				
				생년월일 <input type="date" class="form-control"
					name="birth_date" id="birth_date"> 
					<br>
			 	주소
				<table>
					<tr>
						<td><input type="text" name="zipcode" id="zipcode" size="15">
							<input type="button" value="우편번호찾기" onclick="addr();"></td>
					</tr>
					<tr>
						<td><input type="text" name="address" id="address" size="45"></td>
					<tr>
				</table>
				<br> 프로필사진 <input type="file" name="user_image">
				 <br><br>
				<label><input type="checkbox" data-toggle="modal"
					data-target="#myModal" id="checkbox"><b>이용약관 개인정보 수집 및 정보이용에
					동의합니다.</b></label>


				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h3 class="modal-title">이용약관 동의</h3>
								<button type="button" class="close" data-dismiss="modal"></button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">

								<%@include file="joinAccept.jsp" %> <!-- 모달창 내용 삽입 -->
        
							</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary"
									data-dismiss="modal">확인하였습니다.</button>
        </div>
        
      </div>
    </div>
  </div>	
      <button type="submit" class="btn btn-primary btn-block"
										style="margin-top: 40px;">회원가입</button><hr>


								   </div>
  </form>
</div>
	<!-- 로그인 컨테이너박스 끝 -->
 <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>