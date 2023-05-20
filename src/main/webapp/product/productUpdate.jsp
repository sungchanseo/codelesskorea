<%@page import="com.itwillbs.db.MemberDTO"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.commons.JSForward"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편api -->
<%@include file="../head.jsp" %>
<link rel="stylesheet" href="path/to/bootstrap.min.css">
<!-- Bootstrap 5 JavaScript -->
<script src="path/to/bootstrap.min.js"></script>
</head>
<body>

<%@include file="../nav.jsp" %>

<%
//세션에서 아이디 받아옴
String id = (String)session.getAttribute("id");
MemberDAO mdao = new MemberDAO();
MemberDTO mdto = mdao.getMember(id);
if(mdto == null) {
	JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
}
boolean blocked = mdto.getBlocked();
//차단사용자 세션제어
if(blocked == true) {
	JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberInfo.my");
}
%>

<script type="text/javascript">

function addr() {
	new daum.Postcode({
		    oncomplete : function(data) {
			document.getElementById("address1").value = data.address; // 주소 넣기
		}
	}).open();
}; //우편주소창부르기

$('document').ready(function() {
	var modelList;
	var colorList
	$.ajax({
		type: "GET",
		url: "./GetModelList.pr",
		contentType : "application/json;charset=UTF-8",
		success: function(data) {
			modelList = data[0];
			colorList = data[1];
			console.log(data);
		},
		error: function(data) {
			alert("정보를 받아올 수 없습니다.");
		}
	});
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델</option>");
			$('#color').append("<option value=''>색상</option>");
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
			$('#model').append("<option value=''>모델</option>");
			$('#color').append("<option value=''>색상</option>");
			// add values
			$.each(modelList,function(idx, obj){
				if(obj.model_id<6) return true;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected samsung
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>모델</option>");
		}//미선택시
	});//특정 브랜드 선택시 모델옵션 변경
	
	 $('#model').change(function() {
		$('#color option').remove();
		$('#color').append("<option value=''>모델</option>");
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

});

function toggleAddressField() {
	  var methodSelect = document.getElementById("method");
	  var addressFields = document.getElementById("addressFields");
	  var deliveryMessage = document.getElementById("deliveryMessage");

	  if (methodSelect.value === "2") { // 택배를 선택한 경우
	    addressFields.style.display = "none";
	    deliveryMessage.style.display = "block";
	  } else {
	    addressFields.style.display = "block";
	    deliveryMessage.style.display = "none";
	  }
	}

  function comma(str) {
      str = String(str);
      return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
  }
  function uncomma(str) {
      str = String(str);
      return str.replace(/[^\d]+/g, '');
  }
  function inputNumberFormat(obj) {
      obj.value = comma(uncomma(obj.value));
  }
  function inputOnlyNumberFormat(obj) {
      obj.value = onlynumber(uncomma(obj.value));
  }
  function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
  function changeNumber() {
	  var price = document.getElementById('price');
	  inputOnlyNumberFormat(price);
  }
  
</script>

 <!-- 사이드바 -->

<div class="row" style="margin-left: 100px; ">
<%@include file="../mySide.jsp" %>
  
 <!--   사이드바 -->
 
 <div class="col-md-10">
 <div id="right">
  <div style="text-align:left; overflow-y: auto; height: 800px; ">
 <h1 style="font-family: 'TheJamsil5Bold';">상 품 수 정</h1>
<hr style="border: 0;height: 3px; background-color: black;">

	<form action="./ProductUpdateProAction.pr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="user_id" value="${product.user_id}"> <!-- user_id를 hidden으로 전송 -->
  <!-- user_id를 hidden으로 전송 -->

	<label for="seller"></label>
    <span id="seller">${sessionScope.id} 님</span>
	<br>
	<label for="productNo">No.</label>
	<input type="text" value="${ product.product_id }"name="product_id" style="width: 50px;" readonly>
   <label for="title"></label>
    <input type="text" value="${product.title }" name="title" style="width: 406px;"  maxlength="40">
	<br>
		<select name="brand" id="brand" required style="width: 122px;">			
			<option value="">브랜드</option>
			<option value="1">애플</option>
			<option value="2">삼성</option>
		</select>
		
		<select name="model" id="model" required style="width: 122px;">	
			<option value="">모델</option>
		</select>
		
		<select name="color" id="color" required style="width: 122px;">
			<option value="">색상</option>
		</select>
		<select name="parts" id="parts" required style="width: 122px;">
			<option value="">부품</option>
				<option value="left" ${product.parts == "left" ? "selected" : ""}>좌</option>
				<option value="right" ${product.parts == "right" ? "selected" : ""}>우</option>
				<option value="body" ${product.parts == "body" ? "selected" : ""}>본체</option>
			</select>
   <br>
   <label for="content"></label>
   <textarea name="content" placeholder="글 내용을 작성하세요"  rows="4" cols="50"  maxlength="400">${product.content}</textarea>
   <br>
	<table>
	  <tr>
	    <td class="file-input">
	    <hr>업로드한 이미지<br>
	    <img src="./upload/product/${product.product_image.split(',')[0]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[1]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[2]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[3]}" alt="이미지 없음" width="40px">
	    <img src="./upload/product/${product.product_image.split(',')[4]}" alt="이미지 없음" width="40px">
	    <br>
	      <input type="file" name="product_image1" id="product_image1" required>
	      <input type="file" name="product_image2" id="product_image2" required>
	      <input type="file" name="product_image3" id="product_image3" required>
	      <input type="file" name="product_image4" id="product_image4">
	      <input type="file" name="product_image5" id="product_image5">
	      </td>
	  </tr>
	</table>
	      <hr>

      <label for="price"></label>
       <input type="text" name="price" placeholder="가격을 입력해주세요" value="${product.price}" id="price" required onkeyup="inputNumberFormat(this);">

    <label for="grade">등급 </label>
      <select name="grade">
						<option value="1">상</option>
						<option value="2">중</option>
						<option value="3">하</option>
				</select>
		
  <label for="method">거래방법 </label>
		<select name="method" id="method" onchange="toggleAddressField()">
		  <option value="">거래방법을 선택하세요</option>
		  <option value="1" ${product.method == 1 ? "selected" : ""}>직거래</option>
		  <option value="2" ${product.method == 2 ? "selected" : ""}>택배</option>
		</select>
			<br>
<div id="addressFields">

  <label for="address"></label>
  주소 : ${product.city}<br>
	<input type="text" name="address1" placeholder="주소를 입력해주세요" id="address1" size="45" onclick="addr();" style="display: inline-block;" required>
	<input type="button" value="우편번호 찾기" onclick="addr();" id="postalCodeBtn" >
	<input type="text" name="address2" id="address2" size="45" placeholder="상세주소를 입력해주세요." style="display: inline-block;" required>
  <hr>
      <label style="padding-right: 10px;">결제방식</label>
    <input type="radio" name="charge" value="${product.charge}"checked="${product.charge==0}" required/>
    <label for="account" style="padding-left: 5px; padding-right:10px;"> 계좌거래 </label>
    <input type="radio" name="charge" id="payment" value="1" checked="${product.charge==1}"  required/>
    <label for="payment" style="padding: 5px;">안전결제 </label>
	<br>
    <label style="padding-right: 24.2px;">배송비</label>
        <input type="radio" name="fee" value="${product.fee}" checked="${product.fee == 0}" required/>
        <label for="fee">배송비 포함</label>
        <input type="radio" name="fee" value="3000"checked="${product.fee != 0}" required/>
    <label for="not_free" style="padding-left: 5px; " >배송비 미포함</label>
</div>
<p id="deliveryMessage" style="display: none; color: red;">(직거래만 가능합니다.)</p>
<hr>
		
	
		<div style="text-align: right; margin-top: 10px;">
  <div style="text-align: center; margin-top: 10px;">
	</div>
	  <hr>
	</div>
  <button type="submit" class="btn btn-primary" style="display: inline-block;">상품 수정</button>
	</form>
</div>
</div>
</div>
</div>
<script src="js/main.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>