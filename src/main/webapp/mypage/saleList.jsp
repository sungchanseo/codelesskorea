<%@page import="com.itwillbs.db.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

	<input type="button" value="판매 목록 보기" onclick="location.href='./MypageSalesList.my'">
	<input type="button" value="판매글 등록하기" onclick="location.href='./ProductWrite.pr'">

	<%
	ListDAO li = new ListDAO();
	String id = (String)session.getAttribute("id"); 
	ArrayList saleList = (ArrayList) li.getSaleList(id);
	%>
	
	 <!--   사이드바 -->


<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">판 매 목 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">
<table border="1">
	<tr>
      <th>상품명</th>
      <th>가격</th>
      <th>구매자</th>
      <th>주문서번호</th>
      <th>결제일자</th>
      <th>주문진행상태</th>
   </tr>
      
	<%
      for(int i=0;i<saleList.size();i++){
	      //  ArrayList -> DTO -> 변수
	      ListDTO dto = (ListDTO) saleList.get(i);
	%>
	
		<tr>
			<td><a href="./ProductContent.pr?product_id=<%=dto.getProduct_id() %>">s<%=dto.getTitle() %></a></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getBuyer_id() %></td>
			
			<!-- 주문서번호 링크 수정 필요합니다 -->
			<td><a href="./ProductContent.pr?product_id=<%=dto.getProduct_id() %>"><%=dto.getOrder_id() %></a></td>
			
			<td><%=dto.getOrder_date() %></td>
			<td>
				<!-- int값인 order_satus를 변환하기 위한 코드 -->
				<% int orderStatus = dto.getOrder_status();
			    String statusString = "";
			    if (orderStatus == 1) {
			        statusString = "주문확인";
			    } else if (orderStatus == 2) {
			        statusString = "주문수락";
			    } else if (orderStatus == 3) {
			        statusString = "발송";
			    } else if (orderStatus == 4) {
			        statusString = "구매확정";
			    }
			    out.print(statusString); %>
		    </td>
			
		</tr>
	<% } %>
</table>
</div>
</div>
<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>