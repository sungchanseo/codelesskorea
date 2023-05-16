<%@page import="com.itwillbs.db.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.ListDAO"%>
<%@page import="com.itwillbs.action.mypage.BuyListAction"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->




<div class=row style="margin-left: 100px;"> 
<%@ include file="../mySide.jsp"%> <!-- 사이드바 -->

	<%
	ListDAO li = new ListDAO();
	String id = (String)session.getAttribute("id"); 
	ArrayList buyList = (ArrayList) li.getBuyList(id);
	%>

	 <div class="col-md-10">
 <div id="right" style="width: 80%">
 <h1 style="font-family: 'TheJamsil5Bold';">구 매 목 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">

  <table class="table" id="nttable">
   <thead style="background-color: #F6F6F6;">
   <tr>
     <th style="text-align: center;">상품명</th>
     <th style="text-align: center;">가격</th>
     <th style="text-align: center;">판매자</th>
     <th style="text-align: center;">주문서번호</th>
     <th style="text-align: center;">결제일자</th>
     <th style="text-align: center;">주문진행상태</th>
   </tr> 
	</thead>
	<tbody>
   <c:forEach var="dto" items="${requestScope.buyList }">
<!-- rs <- DTO <- List -->
   <tr>
     <td width="500px;" style="text-align: center;"><a href="./ProductContent.pr?product_id=${dto.product_id }">${dto.title }</a></td>
     <td width="70px;" style="text-align: center;"><fmt:formatNumber value="${dto.price}" pattern="#,###"/></td>
     <td width="70px;" style="text-align: center;">${dto.seller_id}</td>
     <td width="300px;" style="text-align: center;"><a href="./ProductContent.pr?product_id=${dto.product_id }">${dto.title }</a></td>
     <td width="220px;" style="text-align: center;">${dto.order_date}</td>
     <td width="240px;" style="text-align: center;">
		  <c:choose>
		    <c:when test="${dto.order_status == 1}">
		      <c:out value="주문확인" />
		    </c:when>
		    <c:when test="${dto.order_status == 2}">
		      <c:out value="주문수락" />
		    </c:when>
		    <c:when test="${dto.order_status == 3}">
		      <c:out value="발송" />
		    </c:when>
		    <c:otherwise>
		      <c:out value="주문확정" />
		    </c:otherwise>
		  </c:choose>
	</td>
   </tr>
	</c:forEach>
	</tbody>
</table>

</div>
</div>
</div>
<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>