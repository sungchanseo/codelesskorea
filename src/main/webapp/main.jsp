<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>CODE LESS</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="" />
		<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" href="css/owl.carousel.min.css">
		<link rel="stylesheet" href="css/aos.css">
		<link rel="stylesheet" href="css/bootstrap-datepicker.css">
		<link rel="stylesheet" href="css/jquery.timepicker.css">
		<link rel="stylesheet" href="css/fancybox.min.css">
		<link rel="stylesheet" type="text/css" href="css/_custom.css">
		<link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
	
		<!-- Theme Style -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

	</head>    
	<body>
<!-- 		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar"> -->
<!-- 		<div class="container"> -->
<!-- 			<a class="navbar-brand" href="./Main.me">CODE<span>LESS</span></a> -->
<!-- 			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"> -->
<!-- 				<span class="oi oi-menu"></span> Menu -->
<!-- 			</button> -->

<!-- 			<div class="collapse navbar-collapse" id="ftco-nav"> -->
<!-- 				<ul class="navbar-nav ml-auto"> -->
<%-- 				<c:if test="${empty id }"> --%>
<!-- 					<li class="nav-item"><a href="./MemberLogin.me" class="nav-link"><b>로그인</b></a></li> -->
<!-- 					<li class="nav-item"><a href="about.html" class="nav-link"><b>회원가입</b></a></li> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${!empty id }"> --%>
<!-- 					<li class="nav-item"><a href="./MemberLogout.me" class="nav-link"><b>로그아웃</b></a></li> -->
<!-- 					<li class="nav-item"><a href="about.html" class="nav-link"><b>마이페이지</b></a></li> -->
<%-- 				</c:if> --%>
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		</nav> -->

<jsp:include page="nav.jsp"></jsp:include>

		<section class="site-hero overlay" style="background-image: url(images/background-g70cf72a56_1920.png)" data-stellar-background-ratio="0.5">
			<div class="container">
				<div class="row site-hero-inner justify-content-center align-items-center">
					<div class="col-md-10 text-center" data-aos="fade-up">
						<h2>CODE LESS</h2>
						<h1 class="heading">코드리스</h1>
					</div>
				</div>
			</div>

			<a class="mouse smoothscroll" href="#next">
			<div class="mouse-icon">
				<span class="mouse-wheel"></span>
			</div>
			</a>
		</section>
<!-- END section -->

		<section class="section bg-light pb-0"  >
			<div class="container">
				<div class="row check-availabilty" id="next">
					<div class="block-32" data-aos="fade-up" data-aos-offset="-200">
						<form action="#">
							<div class="row">
								<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
									<label for="checkin_date" class="font-weight-bold text-black">제조사</label>
										<div class="field-icon-wrap">
										<div class="icon"><span class="ion-ios-arrow-down"></span></div>
											<select name="" id="" class="form-control">
												<option value="">애플</option>
												<option value="">삼성</option>
											</select>
										</div>
									</div>
									<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
										<label for="checkin_date" class="font-weight-bold text-black">모델명</label>
										<div class="field-icon-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
							                     <select name="" id="" class="form-control">
							                       <option value="">에어팟 1세대</option>
							                       <option value="">에어팟 2세대</option>
							                       <option value="">에어팟 3세대</option>
							                       <option value="">에어팟 프로</option>
							                       <option value="">에어팟 프로 2세대</option>
							                     </select>
											</div>
										</div>
									<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
										<label for="checkout_date" class="font-weight-bold text-black">색상</label>
										<div class="field-icon-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
							                     <select name="" id="" class="form-control">
							                       <option value="">화이트</option>
							                       <option value=""></option>
							                     </select>
											</div>
										</div>
										<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
											<label for="checkout_date" class="font-weight-bold text-black">좌우선택</label>
											<div class="field-icon-wrap">
											<div class="icon"><span class="ion-ios-arrow-down"></span></div>
                     <select name="" id="" class="form-control">
                       <option value="">좌</option>
                       <option value="">우</option>
                     </select>
               </div>
             </div>
               <br>
               <div class="col-md-12 mb-0 mb-md-0 col-lg-0" style="margin-top: 40px;">
  <div class="row">
    <div class="col-md-6 mb-3 mb-md-0">
      <label for="adults" class="font-weight-bold text-black">거래방법</label>
      <div class="field-icon-wrap">
        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
        <select name="" id="adults" class="form-control">
        
          <option value="">직거래</option>
          <option value="">택배</option>
          
        </select>
      </div>
    </div>
    <div class="col-md-6 mb-3 mb-md-0">
      <label for="children" class="font-weight-bold text-black">지역선택</label>
      <div class="field-icon-wrap">
        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
        <select name="" id="" class="form-control">
          <option value="">에어팟 1세대</option>
          <option value="">에어팟 2세대</option>
          <option value="">에어팟 3세대</option>
          <option value="">에어팟 프로</option>
          <option value="">에어팟 프로 2세대</option>
        </select>
      </div>
    </div>
  </div>
</div>

	<br>
<input type="button" value="물품검색하기" class="btn btn-primary text-white" style="width: 500px; margin:auto; margin-top: 50px;" onclick="location.href='./ProductList.pr';">

          </div>
        </form>
      </div>


    </div>
  </div>
</section>

<section class="py-5 bg-light">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5" data-aos="fade-up">
        <figure class="img-absolute">
          <img src="images/chat.jpg" alt="Image" class="img-fluid" style="width: 300px;">
</figure>
<!-- <img src="images/chat.jpg" alt="Image" class="img-fluid rounded" > -->
</div>
<div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
  <h2 class="heading">코드리스에 대하여 ..</h2>
  <p style="font-size: 18px;">잃어버린 내 이어폰의 짝을 찾아주고 싶다면 어서 이용해보세요!</p>
        <p><a href="#" class="btn btn-primary text-white py-2 mr-3">더 보기</a></p>
      </div>
      
    </div>
  </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<!-- <footer class="section footer-section"> -->
<!--   <div class="container"> -->
<!--     <div class="row mb-4"> -->
<!--       <div class="col-md-3 mb-5"> -->
<!--         <ul class="list-unstyled link"> -->
<!--           <li><a href="#">회사정보</a></li> -->
<!--           <li><a href="#">개인정보정책</a></li> -->
   
<!--         </ul> -->
<!--       </div> -->
<!--       <div class="col-md-3 mb-5" > -->

<!--       </div> -->
<!--       <div class="col-md-3 mb-5 pr-md-5 contact-info"> -->
<!--         <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
<!--             <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span>부산광역시 부산진구 부전동 112-3 삼한골든게이트 7층</span></p> -->
<!--             <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span>051-803-0909</span></p> -->
<!--             <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span>itwill@domain.com</span></p> -->
<!--           </div> -->
<!--           <div class="col-md-3 mb-5"> -->
          
<!--               <ul class="list-unstyled link"> -->
<!--               <li><a href="#">공지사항</a></li> -->
<!--               <li><a href="#">자주하는질문</a></li> -->
<!--               <li><a href="#">1:1문의</a></li> -->
       		  
<!--             </ul> -->
           
 
<!--         </div> -->
        
<!--       </div> -->
<!--     </footer> -->
    
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    
    
    <script src="js/aos.js"></script>
    
    <script src="js/bootstrap-datepicker.js"></script> 
    <script src="js/jquery.timepicker.min.js"></script> 

    

    <script src="js/main.js"></script>
  </body>
</html>