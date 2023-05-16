<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<%@include file="../head.jsp" %>


</head>
<body>

<%@include file="../nav.jsp" %>
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

	const modelList = JSON.parse('${modelList}');
	const colorList = JSON.parse('${colorList}');
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			$.each(modelList,function(idx, obj){
				console.log(obj.model_id);
				console.log(obj.model);
				if(obj.model_id>5) return false;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected apple
		}else if($('#brand').val() == "2"){
			// Init selectBox
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			// add values
			$.each(modelList,function(idx, obj){
				if(obj.model_id<6) return true;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected samsung
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
		}//미선택시
	});//특정 브랜드 선택시 모델옵션 변경
	
	 $('#model').change(function() {
		$('#color option').remove();
		$('#color').append("<option value=''>모델명을 선택하세요</option>");
		 var color = "";
		$.each(modelList,function(idx, obj){
// 			alert("color : " + obj.color+ "/ model id : " + obj.model_id + "/ model val : " + $('#model').val());
			if(obj.model_id == $('#model').val()) {
				color = obj.color;
				return false;
			}
		}); // get Colors by Model
		var colorArr = color.split("/");
		$.each(colorList,function(idx, obj){
			$.each(colorArr, function(idx, colorEle){
				if(obj.color_id == colorEle) {
					$('#color').append("<option value='"+obj.color_id+"'>"+obj.color+"</option>");
				}
			});
		});
	 });
	
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
</script>

 <!-- 사이드바 -->

  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> 마이페이지 </h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./ProductList.pr'"> 판매 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 구매 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 찜 목록</h5>
  <h5 onclick="location.href='./ProductList.no'"> 1대1 문의</h5>
  <h5 onclick="location.href='./ProductList.no'"> 내 정보 보기</h5>
  </div>
	</div>	
  
 <!--   사이드바 -->
 
<div class="col-sm-8" style="margin:auto;">
 <div class="container" id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 등 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductWriteAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${sessionScope.id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->
  
<table>
  <tr>
    <td><label for="seller">판매자:</label></td>
    <td><span id="seller">${sessionScope.id}</span></td>
  </tr>
  <tr>
    <td><label for="title">상품 제목:</label></td>
    <td><input type="text" placeholder="글 제목을 입력하세요" name="title" id="title" required></td>
  </tr>
  <tr>
<!--     <td><label for="model">상품 모델:</label></td> -->
<!--     <td> -->
<!--       <select name="model" id="model" required> -->
<!--         <option value="">카테고리를 선택해주세요</option> -->
<!--         <option value="samsung">SAMSUNG</option> -->
<!--         <option value="apple">APPLE</option> -->
<!--         <option value="etc">etc</option> -->
<!--       </select> -->
<!--     </td> -->
		<select name="" id="brand" class="form-control">			
			<option value="">제조사를 선택하세요</option>
			<option value="1">애플</option>
			<option value="2">삼성</option>
		</select>
		<select name="" id="model" class="form-control" style="">	
			<option value="">모델명을 선택하세요</option>
		</select>
		<select name="" id="color" class="form-control">
			<option value="">색상을 선택하세요</option>
		</select>
		
		<select name="" id="parts" class="form-control">
			<option value="">좌우를 선택하세요</option>
			<option value="left">좌</option>
			<option value="right">우</option>
			<option value="body">본체</option>
		</select>

  </tr>
  <tr>
    <td><label for="parts">상품 부품:</label></td>
    <td>
      <select name="parts" id="parts" required>
        <option value="left">좌</option>
        <option value="right">우</option>
        <option value="body">본체</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label for="content">상품 내용:</label></td>
    <td><textarea name="content" placeholder="글 내용을 작성하세요" id="content" rows="5" cols="30"></textarea></td>
  </tr>
  
      <tr>
    <td>
      <label for="product_image1">상품 이미지 1:</label>
    </td>
    <td>
      <input type="file" name="product_image1" id="product_image1" required>
    </td>
    <td>
      <label for="product_image2">상품 이미지 2:</label>
    </td>
    <td>
      <input type="file" name="product_image2" id="product_image2">
    </td>
  </tr>
  <tr>
    <td>
      <label for="product_image3">상품 이미지 3:</label>
    </td>
    <td>
      <input type="file" name="product_image3" id="product_image3">
    </td>
    <td>
      <label for="product_image4">상품 이미지 4:</label>
    </td>
    <td>
      <input type="file" name="product_image4" id="product_image4">
    </td>
    
  </tr>
  <tr>
    <td>
      <label for="price">상품 가격:</label>
    </td>
    <td>
      <input type="number" name="price" placeholder="가격을 입력해주세요" id="price" required>
    </td>
  </tr>
 <tr>
    <td><label for="grade">상품 등급:</label></td>
    <td>
      <select name="grade" id="grade">
        <option value="1">상</option>
        <option value="2">중</option>
        <option value="3">하</option>
      </select>
    </td>
  </tr>
  <tr>
    <td><label for="city">지역:</label></td>
    <td><input type="text" placeholder="지역을 입력하세요" name="city" id="city" required></td>
  </tr>
  <tr>
    <td><label for="method">거래 방식:</label></td>
    <td>
<!--       <select name="method" id="method"> -->
<!--         <option value="0">택배거래</option> -->
<!--         <option value="1">직거래</option> -->
<!--       </select> -->
			<select name="" id="trade" class="form-control">
				<option value="">거래방법을 선택하세요</option>
				<option value="1">직거래</option>
				<option value="2">택배</option>
			</select>
			<select name="sido1" id="sido1" class="form-control"></select>	 
			<select name="gugun1" id="gugun1" class="form-control" style="margin-top: 10px;"></select>
    </td>
  </tr>
  <tr>
    <td><label>결제방식:</label></td>
    <td>
      <div>
        <input type="radio" name="charge" id="account" value="0" required>
        <label for="account">계좌거래</label>
      </div>
      <div>
        <input type="radio" name="charge" id="payment" value="1" required>
        <label for="payment">안전결제</label>
      </div>
    </td>
  </tr>
  <tr>
    <td><label>배송비:</label></td>
    <td>
      <div>
        <input type="radio" name="fee" id="free" value="0" required>
        <label for="free">배송비 포함</label>
      </div>
      <div>
        <input type="radio" name="fee" id="not_free" value="3000" required>
        <label for="not_free">배송비 미포함</label>
      </div>
    </td>
  </tr>
</table>
		<input type="submit" value="등록">
	</form>
</div>
</div>

<script src="js/aos.js"></script>

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>

<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>