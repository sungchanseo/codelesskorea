<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="./Main.me">CODE<span>LESS</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
				<c:if test="${empty id }">
					<li class="nav-item"><a href="./MemberLogin.me" class="nav-link"><b>로그인</b></a></li>
					<li class="nav-item"><a href="./MemberJoin.me" class="nav-link"><b>회원가입</b></a></li>
				</c:if>
				<c:if test="${!empty id }">
					<li class="nav-item"><a href="./MemberLogout.me" class="nav-link"><b>로그아웃</b></a></li>
					<li class="nav-item"><a href="./member/mypage.jsp" class="nav-link"><b>마이페이지</b></a></li><!-- 수정요 -->
				</c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>