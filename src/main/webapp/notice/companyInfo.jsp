<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CODELESS - 공지사항 내용</title>
<%@include file="../head.jsp" %>
</head>
<body>
<%@include file="../nav.jsp" %>

  <div class="row" style="margin-left: 100px;">
  <!-- 사이드바 -->
  <div class="col-12 col-md-2 col-lg-2">
 	<div class="container" id="left">
	  <br>
	  <h4> 회사소개</h4>
	  <hr style="border: 0;height: 1px; background-color: black;">
	  <h5 onclick="location.href='./CompanyInfo.no'"> 회사소개</h5>
	  <h5 onclick="location.href='./PrivacyPolicy.no'"> 개인정보보호정책</h5>
	  </div>
	</div>	
 <!--   사이드바 -->
  
 <div class="col-md-10">
 <div id="right">
 <h1 style="font-family: 'TheJamsil5Bold';">CODELESS를 이용해주신 여러분 감사합니다.</h1>
<hr style="border: 0;height: 3px; background-color: black;">
<div style="float:right; padding:0 30px 30px 30px;" >
<img src="./images/103693_131764_5019.png"style="height:480px;" ><br>
<div style="font-size:30px; text-align:center; color:black;">CEO 강진석</div> 
</div>
<p style="font-size:20px; word-break:break-all; word: ">
<i style="font-size:45px;">CODELESS는 국내 최초로 무선 이어폰을 전문으로<br> 다루는 업체입니다.</i>
 <br>
 CODELESS는 탁월한 서비스와 혁신적인 솔루션을 제공하고 있습니다. 

CODELESS의 주요 서비스 중 하나는 잊어버린 이어폰의 한 쪽을 구매하는 것입니다.  사용자들은 편리하고 신속하게 이어폰을 보충할 수 있으며, 잃어버린 이어폰으로 인한 불편함을 최소화할 수 있습니다.

CODELESS의 목표는 무선 이어폰 시장에서 혁신을 선도하는 것입니다. 
 CODELESS는 고객들의 편의를 최우선으로 생각하며, 혁신적인 솔루션과 탁월한 서비스로 고객들에게 귀중한 경험을 선사하고자 합니다.

감사합니다.
</p>
<div style= "float: right; margin-top: 80px;">

<c:if test="${id.equals('admin@gmail.com') }">
<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }&pageNum=${pageNum}" class="btn btn-primary">게시글 수정</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }&pageNum=${pageNum}" class="btn btn-primary">게시글 삭제</a>
</c:if>
</div>
</div>
</div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>