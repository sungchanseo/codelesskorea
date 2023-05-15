<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<%@ include file="../head.jsp"%>
<script type="text/javascript">

$('document').ready(function() {
	//지역 변수생성
	
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	 

	 // 시/도 선택 박스 초기화

	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	 
	 //특정 브랜드 선택시 모델옵션 변경
	 var apple = ["에어팟 1세대","에어팟 2세대","에어팟 3세대","에어팟프로","에어팟프로 2세대"];
	 var samsung = ["버즈","버즈 플러스","버즈 라이브","버즈 프로","버즈2","버즈2 프로"];
	 
	 //삼성 브랜드 색상
	 var color1=  ["블랙","옐로우","화이트"];
	 var color2 = ["블루","블랙","화이트","레드","핑크"];
	 var color3 = ["미스틱 블랙","미스틱 화이트","미스틱 브론즈","레드","오닉스"];
	 var color4 = ["팬텀 바이올렛","팬텀 블랙","팬텀 실버","팬텀 화이트"];
	 var color5 = ["라벤더","올리브","화이트","그라파이트"];
	 var color6 = ["퍼플","그라파이트","화이트"];
	 
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			$('#color').append("<option value='1'>화이트</option>");			
			$.each(apple,function(idx,model){
			$('#model').append("<option value='"+idx+"'>"+model+"</option>");
			});//애플 모델 
		}else if($('#brand').val() == "2"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			$.each(samsung,function(idx,model){
			$('#model').append("<option value='"+idx+"'>"+model+"</option>");
			});//삼성 모델
				 
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
		}//미선택시
	});//특정 브랜드 선택시 모델옵션 변경
	 
	
	 $('#model').change(function() {
			if($('#brand').val() == "2")  {
			var color = "color"+$("option",$(this)).index($("option:selected",$(this)));
		    $('#color option').remove();
		    $('#color').append("<option value=''>색상을 선택하세요</option>");
		    $.each(eval(color), function() {
			$('#color').append("<option value='"+this+"'>"+this+"</option>");
		    });
		    }
	});//삼성 모델 색상 옵션
	
	
	$('#trade').change(function() {
		if($('#trade').val()=="1"){
			$('#trmsg').hide();
			$('#sido1').show();
			$('#gugun1').show();
		}else{
			$('#trmsg').show();
			$('#trmsg').text(" (직거래만 가능합니다.)");
			$('#sido1').hide();
			$('#gugun1').hide();
		}//택배거래 선택시 지역선택 못하게함
	});

	});//script끝

	function openModal() {
	  document.getElementById("mainModal").style.display = "block";
	}

	function closeModal() {
	  document.getElementById("mainModal").style.display = "none";
	}
	
</script>


</head>
<body style="font-family: 'TheJamsil5';">
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

<!-- END head -->

<section class="site-hero overlay"
	style="background-image: url(images/background-6556414_1920.jpg)"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade-up">
				<h1 style=" font-family: 'Noto Sans KR', sans-serif; color: #262626;"><b>새로운 매칭서비스의 시작</b></h1>
				<h1 style=" font-family: 'Noto Sans KR', sans-serif; color: #262626;"><b>코드리스</b></h1>
			<!-- 	<h5 class="heading"></h5> -->
			</div>
		</div>
	</div>

</section>
<!-- END section -->

<section class="section pb-0">
	<div class="container">

		<div class="row check-availabilty" id="next">
			<div class="block-32" data-aos="fade-up" data-aos-offset="-200" style="border: 3px solid;">
					<h5 style=" font-family: 'TheJamsil5Bold'; text-align: center; color:#262626;">새로운 짝을 매칭해보세요!</h5><br>
				<form action="#">
					
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">제조사</label>
								<select name="" id="brand" class="form-control">
									
									<option value="">제조사를 선택하세요</option>
									<option value="1">애플</option>
									<option value="2">삼성</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">모델명</label>
								<select name="" id="model" class="form-control" style="">	
								<option value="">모델명을 선택하세요</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">색상</label>
								<select name="" id="color" class="form-control">
									<option value="">색상을 선택하세요</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">좌우선택</label>
								<select name="" id="direc" class="form-control">
									<option value="">좌우를 선택하세요</option>
									<option value="">좌</option>
									<option value="">우</option>
								</select>
							
						</div>
						<hr>
						<div class="col-md-12 mb-0 mb-md-0 col-lg-0"
							style="margin-top: 40px;">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adults" class="font-weight-bold text-black">거래방법</label>

										<select name="" id="trade" class="form-control">
											<option value="">거래방법을 선택하세요</option>
											<option value="1">직거래</option>
											<option value="2">택배</option>
								
										</select>
									
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="" class="font-weight-bold text-black">지역선택</label></label><span id="trmsg" style="color: red;"> </span>
									 
										<select name="sido1" id="sido1" class="form-control"></select>	 
										<select name="gugun1" id="gugun1" class="form-control" style="margin-top: 10px;"></select>			
								</div>
							</div>
						</div>
						<br>
						<input type="button" value="검색하기" class="btn btn-primary text-white" style="width: 500px; margin:auto; margin-top: 50px;" onclick="openModal();">

					</div>
				</form>
			</div>


		</div>
	</div>
</section>

<!-- <section class="py-5 bg-light">
	<div class="container">
		<div class="row align-items-center">
			<div
				class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5"
				data-aos="fade-up">

			</div>
			<div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up" style="text-align: center;">
				<h2 class="heading"  style="text-align: center;">코드리스코드리스</h2>
				<p style="font-size: 18px;">코드리스코드리스코드리스코드리스코드리스코드리스</p>
				<p>
					<a href="#" class="btn btn-primary text-white py-2 mr-3">링크거세요</a>
				</p>
			</div>

		</div>
	</div>
</section> -->

  <section class="section">
      <div class="container">
        <div class="row justify-content-left text-left mb-5">
          <div class="col-md-7" style="margin-bottom: 50px;">
            <h3 class="heading" data-aos="fade-up" style="font-family:'TheJamsil5';">어떻게 이용하나요?</h3>
           <!--  <p data-aos="fade-up" data-aos-delay="100"></p> -->
          </div>
        </div>
        <div class="row">
        
                  <div class="col-md-6 col-lg-3" data-aos="fade-up">
           
             <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185655.png" alt="your-image">
  <h2>매칭하기</h2>
  <p>원하는 옵션을 선택하여 매칭을 시작하세요.</p>
</div>
            
          </div>
        
          <div class="col-md-6 col-lg-3" data-aos="fade-up">
          
                      <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185572.png" alt="your-image">
  <h2>주문서작성</h2>
  <p>원하는 상품을 선택후, 주문서를 작성하세요(택배거래만 해당)</p>
</div>
            
          </div>


          <div class="col-md-6 col-lg-3" data-aos="fade-up">
        
                             <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185633.png" alt="your-image">
  <h2>채팅하기</h2>
  <p>판매자와 소통할 수 있는 채팅이 가능합니다</p>
</div>
              </div>
           
          
          
                    <div class="col-md-6 col-lg-3" data-aos="fade-up">
           <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185445.png" alt="your-image">
  <h2>거래완료</h2>
  <p></p>
</div>
          </div>


        </div>
      </div>
    </section>
    
  
    <section class="section testimonial-section">
      <div class="container">
        <div class="row justify-content-left text-left mb-5">
          <div class="col-md-7">
            <h3 class="heading" data-aos="fade-up" style="font-family:'TheJamsil5';">코드리스 이용자 후기</h3>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001799.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;코드리스와 함께하면서</p>
                <p>제 인생의 반이 채워졌어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;최*원</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001775.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;한쪽만 잃어버렸는데</p>
                 <p>한쪽만 구매할 수 있어서 편해요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;서*찬</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001817.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;한쪽만 없어서 팔고싶었는데</p>
                 <p>코드리스덕에 편하게 팔았어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;양*영</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001799.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;직거래와 택배거래 둘다 가능해서</p>
                 <p>편하게 거래할 수 있었어요!&rdquo;</p>
             </blockquote>
              <p><em>&mdash; 이*연</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001775.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;새거 사기는 부담스러웠는데</p>
                 <p>중고로 싸게사서 좋았어요!&rdquo;</p>	
              </blockquote>
              <p><em>&mdash; 임*희</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001758.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;원하는 옵션으로만 매칭이 가능해서</p>
                 <p>편하게 이용했어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash; 나*우</em></p>
            </div>

          </div>
        </div>

      </div>
    </section>
    

   <!--  <section class="section blog-post-entry bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Events</h2>
            <p data-aos="fade-up">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="100">

            <div class="media media-custom d-block mb-4 h-100">
              <a href="#" class="mb-4 d-block"><img src="images/img_1.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">Travel Hacks to Make Your Flight More Comfortable</a></h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              </div>
            </div>

          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="200">
            <div class="media media-custom d-block mb-4 h-100">
              <a href="#" class="mb-4 d-block"><img src="images/img_2.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">5 Job Types That Aallow You To Earn As You Travel The World</a></h2>
                <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="300">
            <div class="media media-custom d-block mb-4 h-100">
              <a href="#" class="mb-4 d-block"><img src="images/img_3.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">February 26, 2018</span>
                <h2 class="mt-0 mb-3"><a href="#">30 Great Ideas On Gifts For Travelers</a></h2>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. t is a paradisematic country, in which roasted parts of sentences.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <section class="section bg-image overlay" style="background-color: FFFFCC;">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white"  style="font-family:'TheJamsil5';">지금 바로 상품을 등록해보세요!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="" class="btn btn-outline-white-primary py-3 text-white px-5">상품 올리기</a>
            </div>
          </div>
        </div>
      </section> 

	<%@include file="../footer.jsp"%>

<div id="mainModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <iframe src="./ProductList.pr"></iframe>
  </div>
</div>

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