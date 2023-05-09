<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
		  <div class="container" id="left">
		  <br>
		  <h4> 마이페이지</h4>
		  
		  <c:if test="${id!='admin' && id!='admin@gmail.com' }">
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberUpdate.me'"> 내정보수정</h5>
		  <h5 onclick="location.href='./MypageSalesList.my'"> 판매목록</h5>
		  <h5 onclick="location.href='./MypagePurchaselist.my'"> 구매목록</h5>
		  <h5 onclick="location.href='./LikeList.my'"> 찜목록</h5>
		  </c:if>
		  
		  <c:if test="${id=='admin' || id=='admin@gmail.com' }">
		  <hr style="border: 0;height: 1px; background-color: black;">
		  <h5 onclick="location.href='./MemberUpdate.me'"> 내정보수정</h5>
		  <h5 onclick="location.href='./MemberList.me'"> 회원관리</h5>
		  <h5 onclick="location.href='./AdminsaleListAction.my''"> 판매목록</h5>
		  <h5 onclick="location.href='./AdminQNAList.qn'"> 1:1문의관리</h5>
		  </c:if>
		  </div>