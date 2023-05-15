<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> <!-- 간편로그인 sdk -->
<script type="text/javascript">

	Kakao.init('d024657e59f07ee69d6d1407441dfe53'); // 카카오 API 초기화
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	alert('로그아웃 되었습니다.');
        	location.href='./MemberLogout.me';
        
        },
        fail: function (error) {
        	alert(error);
        },
      })
      Kakao.Auth.setAccessToken(null);
  	
    }else {
    	location.href='./MemberLogout.me'; //일반회원일 때 로그아웃
    }
  }  //카카오 간편로그인 로그아웃. (간편로그인 토큰때문에 따로 로그아웃 처리를 해주어야한다!)

</script>




	 <nav class="navbar navbar-expand-lg fixed-top" style="  background-color: transparent !important;box-shadow: none !important;">
	    <div class="container">
	      <a class="navbar-brand" href="./Main.me">CODE<span>LESS</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
				<c:if test="${empty id}">
					<li class="nav-item"><a href="./MemberLogin.me" class="nav-link"><b>로그인</b></a></li>
					<li class="nav-item"><a href="./MemberJoin.me" class="nav-link"><b>회원가입</b></a></li>
				</c:if>
				<c:if test="${!empty id }">

					<li class="nav-item"><a href="#" class="nav-link" onclick="kakaoLogout();"><b>로그아웃</b></a></li>
					
	 <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       <c:if test="${id!='admin' && id!='admin@gmail.com' }">
        <b>마이페이지</b>
        </c:if>
         <c:if test="${id=='admin' || id=='admin@gmail.com' }">
          <b>관리자페이지</b>
         </c:if>
        
      </a>
      <div class="dropdown-menu">
            <c:if test="${id!='admin' && id!='admin@gmail.com' }">
		   <a class="dropdown-item" href="./MemberInfo.my"> 내정보보기</a>
		   <a class="dropdown-item" href="./MypageSalesList.my"> 판매목록</a>
		   <a class="dropdown-item" href="./MypagePurchaseList.my">구매목록</a>
		   <a class="dropdown-item" href="./UserQNAList.qn"> 1:1 문의 </a>
		   <a class="dropdown-item" href="./LikeList.my"> 찜목록 </a>
		   <a class="dropdown-item" href="./ChatBox.ch"> 채팅목록 </a>
		  </c:if>
		  
		  <c:if test="${id=='admin' || id=='admin@gmail.com' }">
		   <a class="dropdown-item" href="./MemberInfo.my"> 내정보보기</a>
		   <a class="dropdown-item" href="./MemberList.me"> 회원관리</a>
		   <a class="dropdown-item" href="./AdminProductList.my"> 상품관리 </a>
		   <a class="dropdown-item" href="./AdminQNAList.qn"> 1:1문의관리</a>	
		  </c:if>
      </div>
   	  </li>
				</c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
