<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../head.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">

$('document').ready(function() {
	//吏 蹂
	
	 var area0 = ["/ ","명밸","몄愿�","�愿�","愿二쇨�","援ш�","몄곌�","遺곌�","寃쎄린","媛","異⑹껌遺","異⑹껌⑤","�쇰","�쇰⑤","寃쎌遺","寃쎌⑤","�二쇰"];
	  var area1 = ["媛④뎄","媛援","媛遺援","媛援","愿援","愿吏援","援щ援","湲泥援","몄援","遊援","臾멸뎄","援","留ш뎄","臾멸뎄","珥援","깅援","깅援","≫援","泥援","깊ш뎄","⑹곌뎄","援","醫濡援","以援","以援"];
	   var area2 = ["怨援","④뎄","⑤援","援","遺援","援","곗援","以援","媛援","뱀援"];
	   var area3 = ["援","援","援","깃뎄","以援"];
	   var area4 = ["愿곌뎄","④뎄","援",     "遺援","援"];
	   var area5 = ["④뎄","ъ援","援","遺援","援","깃뎄","以援","ъ깃뎔"];
	   var area6 = ["④뎄","援","遺援","以援","몄＜援"];
	   var area7 = ["媛援","湲�援","④뎄","援","援","遺곗援","遺援","ъ援","ы援","援","援","곗援","援","以援","댁대援","湲곗κ뎔"];
	   var area8 = ["怨","怨쇱","愿紐","愿二쇱","援щ━","援고ъ","源ъ","⑥二쇱","泥","遺泥","깅⑥","","μ","곗","깆","","二쇱","ㅼ곗","⑹몄","","�遺","댁","二쇱","","ъ","⑥","깆","媛援","援","ъ＜援","곗援"];
	   var area9 = ["媛由","댁","쇱","珥","二쇱","異泥","諛깆","怨깃뎔","援ш뎔","援","援","몄援","�援","泥援","李쎄뎔","泥援","泥援","≪깃뎔"];
	   var area10 = ["�泥","泥�＜","異⑹＜","愿댁곌뎔","⑥援","蹂댁援","援","μ援","깃뎔","利援","吏泥援","泥�援"];
	   var area11 = ["怨猷≪","怨듭＜","쇱곗","蹂대뱀","곗","곗","泥","湲곌뎔","뱀援","遺ш뎔","泥援","곌린援","곌뎔","泥�援","援","깃뎔"];
	   var area12 = ["援곗곗","源�","⑥","듭곗","�二쇱","�","怨李쎄뎔","臾댁＜援","遺援","李쎄뎔","二쇨뎔","ㅺ뎔","μ援","吏援"];
	   var area13 = ["愿","二쇱","紐⑺ъ","泥","ъ","媛吏援","怨κ뎔","怨≪깃뎔","援щ援","댁援","臾댁援","蹂댁깃뎔","援","愿援","援","援","μ깃뎔","νκ뎔","吏援","⑦援","대④뎔","援"];
	   var area14 = ["寃쎌곗","寃쎌＜","援щ�","源泥","臾멸꼍","二쇱","","二쇱","泥","ы�","怨�밴뎔","援곗援","遊援","깆＜援","援","援","泥援","몃援","몄援","깃뎔","泥�援","泥�↔뎔","移怨↔뎔"];
	   var area15 = ["嫄곗","源댁","留곗","諛","ъ","곗","吏二쇱","吏댁","李쎌","듭","嫄곗갹援","怨깃뎔","⑦닿뎔","곗껌援","�밴뎔","李쎈援","援","⑥援","⑥援","⑹援"];
	   var area16 = ["洹ъ","�二쇱","⑥二쇨뎔","遺�二쇨뎔"];

	 

	 // /  諛 珥湲고

	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>援/援 </option>");
	 });

	 

	 // /  援/援 ㅼ

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 吏� 援ш뎔 Array
	  var $gugun = $(this).next(); //  援곌뎄 媛泥
	  $("option",$gugun).remove(); // 援ш뎔 珥湲고

	  if(area == "area0")
	   $gugun.append("<option value=''>援/援 </option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	 
	 //뱀 釉  紐⑤몄듭 蹂寃
	 var apple = ["댄 1몃","댄 2몃","댄 3몃","댄濡","댄濡 2몃"];
	 var samsung = ["踰利","踰利 ъ","踰利 쇱대","踰利 濡","踰利2","踰利2 濡"];
	 
	 //쇱 釉 
	 var color1=  ["釉","濡","댄"];
	 var color2 = ["釉猷","釉","댄","�",""];
	 var color3 = ["誘몄ㅽ 釉","誘몄ㅽ 댄","誘몄ㅽ 釉濡利","�","ㅻ"];
	 var color4 = ["ы 諛댁щ","ы 釉","ы ㅻ","ы 댄"];
	 var color5 = ["쇰깽","щ━釉","댄","洹몃쇳댄"];
	 var color6 = ["쇳","洹몃쇳댄","댄"];
	 
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>紐⑤몃 몄</option>");
			$('#color').append("<option value=''> 몄</option>");
			$('#color').append("<option value='1'>댄</option>");			
			$.each(apple,function(idx,model){
			$('#model').append("<option value='"+idx+"'>"+model+"</option>");
			});// 紐⑤ 
		}else if($('#brand').val() == "2"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>紐⑤몃 몄</option>");
			$('#color').append("<option value=''> 몄</option>");
			$.each(samsung,function(idx,model){
			$('#model').append("<option value='"+idx+"'>"+model+"</option>");
			});//쇱 紐⑤
				 
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>紐⑤몃 몄</option>");
		}//誘몄
	});//뱀 釉  紐⑤몄듭 蹂寃
	 
	
	 $('#model').change(function() {
			if($('#brand').val() == "2")  {
			var color = "color"+$("option",$(this)).index($("option:selected",$(this)));
		    $('#color option').remove();
		    $('#color').append("<option value=''> 몄</option>");
		    $.each(eval(color), function() {
			$('#color').append("<option value='"+this+"'>"+this+"</option>");
		    });
		    }
	});//쇱 紐⑤  듭
	
	
	$('#trade').change(function() {
		if($('#trade').val()=="1"){
			$('#trmsg').hide();
			$('#sido1').show();
			$('#gugun1').show();
		}else{
			$('#trmsg').show();
			$('#trmsg').text(" (吏嫄곕留 媛ν⑸.)");
			$('#sido1').hide();
			$('#gugun1').hide();
		}//諛곌굅  吏� 紐삵寃
	});

	});//script

	//紐⑤ 李 닿린 ⑥
	function openModal() {
	  document.getElementById("myModal").style.display = "block";
	}

	// 紐⑤ 李 リ린 ⑥
	function closeModal() {
	  document.getElementById("myModal").style.display = "none";
	}
	
</script>

<!-- 紐⑤ъ갹 ㅽ -->
<style>
/* 紐⑤ 李 ㅽ */
.modal {
  display: none; /* 珥湲곗 ④  */
  position: fixed; /* 댁  ㅽщ· μ 諛吏 濡 怨� 移 */
  z-index: 9999; /* 댁 �댁 留  移濡  媛쇰 吏� */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4); /* 諛곌꼍 吏� */
}

.modal-content {
    width: 600px; 
  height: 400px;
  position: absolute; /* 紐⑤ 李 댁 � 移 */
  top: 50%; /*   50% 移 */
  left: 50%; /*   50% 移 */
  transform: translate(-50%, -50%); /* 媛대 �� */
  width: 80%;
  max-height: 90%;
  overflow-y: auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 0 20px rgba(0,0,0,0.3);
}

/* iframe ㅽ */
iframe {
  width: 100%;
  height: 100%;
  border: none;
}

</style>

</head>

<%@ include file="../nav.jsp"%><!-- nav 쎌 -->

<!-- END head -->

<section class="site-hero overlay"
	style="background-image: url(images/background-g70cf72a56_1920.png)"
	data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade-up">
				<h2>CODE LESS</h2>
				<h1 class="heading">肄由ъ</h1>
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

<section class="section bg-light pb-0">
	<div class="container">

		<div class="row check-availabilty" id="next">
			<div class="block-32" data-aos="fade-up" data-aos-offset="-200">

				<form action="#">
					
					<div class="row">
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">�議곗</label>
								<select name="" id="brand" class="form-control">
									
									<option value="">�議곗щ� 몄</option>
									<option value="1"></option>
									<option value="2">쇱</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">紐⑤몃</label>
								<select name="" id="model" class="form-control" style="">	
								<option value="">紐⑤몃 몄</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black"></label>
								<select name="" id="color" class="form-control">
									<option value=""> 몄</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">醫곗</label>
								<select name="" id="direc" class="form-control">
									<option value="">醫곕� 몄</option>
									<option value="">醫</option>
									<option value=""></option>
								</select>
							
						</div>
						<hr>
						<div class="col-md-12 mb-0 mb-md-0 col-lg-0"
							style="margin-top: 40px;">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adults" class="font-weight-bold text-black">嫄곕諛⑸</label>

										<select name="" id="trade" class="form-control">
											<option value="">嫄곕諛⑸ 몄</option>
											<option value="1">吏嫄곕</option>
											<option value="2">諛</option>
								
										</select>
									
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="" class="font-weight-bold text-black">吏�</label></label><span id="trmsg" style="color: red;"> </span>
									 
										<select name="sido1" id="sido1" class="form-control"></select>	 
										<select name="gugun1" id="gugun1" class="form-control" style="margin-top: 10px;"></select>			
								</div>
							</div>
						</div>
						<br>
						<input type="button" value="寃湲" class="btn btn-primary text-white" style="width: 500px; margin:auto; margin-top: 50px;" onclick="openModal();">


					</div>
				</form>
			</div>


		</div>
	</div>
</section>

<section class="py-5 bg-light">
	<div class="container">
		<div class="row align-items-center">
			<div
				class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5"
				data-aos="fade-up">
				<figure class="img-absolute">
					<img src="" alt="Image" class="img-fluid">
				</figure>
				<!-- <img src="images/chat.jpg" alt="Image" class="img-fluid rounded" > -->
			</div>
			<div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
				<h2 class="heading">肄由ъㅼ由ъ</h2>
				<p style="font-size: 18px;">肄由ъㅼ由ъㅼ由ъㅼ由ъㅼ由ъㅼ由ъ</p>
				<p>
					<a href="#" class="btn btn-primary text-white py-2 mr-3">留ш굅몄</a>
				</p>
			</div>

		</div>
	</div>
</section>

<!--  <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Rooms &amp; Suites</h2>
            <p data-aos="fade-up" data-aos-delay="100">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="#" class="room">
              <figure class="img-wrap">
                <img src="images/img_1.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Single Room</h2>
                <span class="text-uppercase letter-spacing-1">90$ / per night</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="#" class="room">
              <figure class="img-wrap">
                <img src="images/img_2.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Family Room</h2>
                <span class="text-uppercase letter-spacing-1">120$ / per night</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="#" class="room">
              <figure class="img-wrap">
                <img src="images/img_3.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Presidential Room</h2>
                <span class="text-uppercase letter-spacing-1">250$ / per night</span>
              </div>
            </a>
          </div>


        </div>
      </div>
    </section>
    
    
    <section class="section slider-section bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Photos</h2>
            <p data-aos="fade-up" data-aos-delay="100">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
              <div class="slider-item">
                <a href="images/slider-1.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-1.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-2.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-2.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-3.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-3.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-4.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-4.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-5.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-5.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-6.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-6.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-7.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-7.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
            </div>
            END slider
          </div>
        
        </div>
      </div>
    </section>
    END section
    
    <section class="section bg-image overlay" style="background-image: url('images/hero_3.jpg');">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading text-white" data-aos="fade">Our Restaurant Menu</h2>
            <p class="text-white" data-aos="fade" data-aos-delay="100">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
        <div class="food-menu-tabs" data-aos="fade">
          <ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active letter-spacing-2" id="mains-tab" data-toggle="tab" href="#mains" role="tab" aria-controls="mains" aria-selected="true">Mains</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="desserts-tab" data-toggle="tab" href="#desserts" role="tab" aria-controls="desserts" aria-selected="false">Desserts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="drinks-tab" data-toggle="tab" href="#drinks" role="tab" aria-controls="drinks" aria-selected="false">Drinks</a>
            </li>
          </ul>
          <div class="tab-content py-5" id="myTabContent">
            
            
            <div class="tab-pane fade show active text-left" id="mains" role="tabpanel" aria-labelledby="mains-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$20.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Murgh Tikka Masala</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$35.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Fish Moilee</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$15.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Safed Gosht</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$10.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">French Toast Combo</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$8.35</span>
                    <h3 class="text-white"><a href="#" class="text-white">Vegie Omelet</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$22.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Chorizo &amp; Egg Omelet</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
              </div>
              

            </div> .tab-pane

            <div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$11.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Banana Split</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$72.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Sticky Toffee Pudding</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$26.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Pecan</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$42.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Apple Strudel</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$7.35</span>
                    <h3 class="text-white"><a href="#" class="text-white">Pancakes</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$22.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Ice Cream Sundae</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
              </div>
            </div> .tab-pane
            <div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$32.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Spring Water</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$14.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Coke, Diet Coke, Coke Zero</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$93.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Orange Fanta</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$18.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Lemonade, Lemon Squash</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$38.35</span>
                    <h3 class="text-white"><a href="#" class="text-white">Sparkling Mineral Water</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$69.00</span>
                    <h3 class="text-white"><a href="#" class="text-white">Lemon, Lime &amp; Bitters</a></h3>
                    <p class="text-white text-opacity-7">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
                </div>
              </div>
            </div> .tab-pane
          </div>
        </div>
      </div>
    </section>
    
    END section
    <section class="section testimonial-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">People Says</h2>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_1.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; Jean Smith</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_2.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="images/person_3.jpg" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; John Doe</em></p>
            </div>

          </div>
            END slider
        </div>

      </div>
    </section>
    

    <section class="section blog-post-entry bg-light">
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
    </section>

    <section class="section bg-image overlay" style="background-image: url('images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="reservation.html" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
            </div>
          </div>
        </div>
      </section> -->

	<%@include file="../footer.jsp"%>

<div id="myModal" class="modal">
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