<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
		  <div class="container" id="left">
		  <br>
		  
		  <c:if test="${id!='admin' && id!='admin@gmail.com' }">
		  <h4> 마이페이지</h4>
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberInfo.my'"> 내정보보기</h5>
		  <h5 onclick="location.href='./MypageSalesList.my'"> 판매목록</h5>
		  <h5 onclick="location.href='./MypagePurchaseList.my'"> 구매목록</h5>
		  <h5 onclick="location.href='./LikeList.my'"> 찜목록</h5>
		  <h5 onclick="location.href='./UserQNAList.qn'"> 1:1문의 </h5>
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
		  
	