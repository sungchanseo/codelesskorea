<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../head.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function addr() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zipcode").value = data.zonecode; // 우편 번호 넣기
				document.getElementById("address").value = data.address; // 주소 넣기
			}
		}).open();
	}; //주소창부르기

	function checkData() {
		if (document.fr.id.value == "") {
			alert(" 아이디를 입력하세요! ");
			document.fr.id.focus();
			return false;

			if (document.fr.password.value == "") {
				alert(" 비밀번호를 입력하세요! ");
				document.fr.password.focus();
				return false;
			}
		}
	};//아이디 체크
</script>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include> <!-- nav 삽입 -->


	<div class="container" id="login-con"
		style="width: 800px; color: black;">


		<form action="./MemberJoinAction.me" name="fr" method="post"
			onsubmit="return checkData();">

			<div class="form-group" id="log-form" style="width: 400px;">
				<h2>
					<b>회원가입을 위해</b>
				</h2>
				<h2 style="margin-bottom: 50px;">
					<b>정보를 입력해주세요:)</b>
				</h2>

				아이디 <input type="email" class="form-control" id="id"
					placeholder="이메일 형식으로 입력해주세요." name="id"> <br> 비밀번호 <input
					type="password" class="form-control" id="password"
					placeholder="비밀번호를 입력해주세요." name="password"> <br> 비밀번호
				확인 <input type="password" class="form-control"
					placeholder="비밀번호를 한번 더 입력해주세요." id="password2"> <br>
				이름 <input type="text" class="form-control" name="name"> <br>
				닉네임 <input type="text" class="form-control" name="nickname">
				<br> 연락처 <input type="text" class="form-control"
					name="phone_number" placeholder="010-0000-0000 형태로 입력해주세요.">
				<br> 생년월일 <input type="date" class="form-control"
					name="birth_date"> <br> 주소
				<table>
					<tr>
						<td><input type="text" name="zipcode" id="zipcode" size="15">
							<input type="button" value="우편번호찾기" onclick="addr();"></td>
					</tr>
					<tr>
						<td><input type="text" name="address" id="address" size="45"></td>
					<tr>
				</table>
				<br> 프로필사진 <input type="text" name="user_image">
				 <br><br>
				<label><input type="checkbox" data-toggle="modal"
					data-target="#myModal"><b>이용약관 개인정보 수집 및 정보이용에
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
 <jsp:include page="../footer.jsp"></jsp:include> <!-- footer 삽입 -->
</body>
</html>