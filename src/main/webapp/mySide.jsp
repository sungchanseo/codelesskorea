<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!-- 판매목록 drop 기능 -->
	<script type="text/javascript">
	  $(document).ready(function() {
	    $('#sDrop').hide();
	    $("#sale").click(function() {
	      if ($('#sDrop').is(':visible')) {
	        $('#sDrop').hide();
	      } else {
	        $('#sDrop').show();
	      }
	    });
	  });
	</script>

	<!-- 1:1문의 drop 기능 -->
	<script type="text/javascript">
	  $(document).ready(function() {
	    $('#qDrop').hide();
	    $("#qna").click(function() {
	      if ($('#qDrop').is(':visible')) {
	        $('#qDrop').hide();
	      } else {
	        $('#qDrop').show();
	      }
	    });
	  });
	</script>


			 <div class="col-md-10">
		  <div class="container" id="left">
		  <br>
		  
		  <c:if test="${id!='admin' && id!='admin@gmail.com' }">
		  <h4> 마이페이지</h4>
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberInfo.my'"> 내정보보기</h5>
		  <h5 id="sale"> 판매목록 <small>▼</small></h5>
			<ul id="sDrop">
				<li onclick="location.href='./MypageSalesList.my'" style="cursor: pointer; color: #ffffff;"
				onmouseover="this.style.color='#ffba5a'" 
    			onmouseout="this.style.color='#ffffff'">
				판매목록 보기
				</li>
				<li onclick="location.href='./ProductWrite.pr'" style="cursor: pointer; color: #ffffff;"
				onmouseover="this.style.color='#ffba5a'" 
    			onmouseout="this.style.color='#ffffff'">
				상품 등록
				</li>
			</ul>
		  <h5 onclick="location.href='./MypagePurchaseList.my'"> 구매목록</h5>
		  <h5 onclick="location.href='./LikeList.my'"> 찜목록</h5>
		  <h5 id="qna"> 1:1문의 <small>▼</small></h5>
		    <ul id="qDrop">
		    	<li onclick="location.href='./UserQNAList.qn'" style="cursor: pointer; color: #ffffff;"
				onmouseover="this.style.color='#ffba5a'" 
    			onmouseout="this.style.color='#ffffff'">
		  		1:1문의 보기
		  		</li>
		    	<li onclick="location.href='./MypageQNAInsert.qn'" style="cursor: pointer; color: #ffffff;"
				onmouseover="this.style.color='#ffba5a'" 
    			onmouseout="this.style.color='#ffffff'">
		  		1:1문의 작성
		  		</li>
		    </ul>
		 
		  <h5 onclick="location.href='./ChatBox.ch'"> 채팅목록  </h5>
		  </c:if>
		  
		  <c:if test="${id=='admin' || id=='admin@gmail.com' }">
		  <h4> 관리자페이지</h4>
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberInfo.my'"> 내정보보기</h5>
		  <h5 onclick="location.href='./MemberList.me'"> 회원관리</h5>
		  <h5 onclick="location.href='AdminProductList.my'"> 상품관리  </h5>
		  <h5 onclick="location.href='./AdminQNAList.qn'"> 1:1문의관리</h5>
		  </c:if>
		  </div>
		  </div>
		  