<%@page import="com.itwillbs.member.db.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.member.db.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>SaleList</h1>
<hr>
	<input type="button" value="판매 목록 보기" onclick="location.href='./MypageSalesList.me'">
	<input type="button" value="판매글 등록하기" onclick="location.href='./ProductWrite.me'">
<hr>

	<%
	ListDAO li = new ListDAO();
	String id = (String)session.getAttribute("id"); 
	ArrayList saleList = (ArrayList) li.getSaleList(id);
	%>


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
			<td><a href="<%=dto.getProductLink() %>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getBuyer_id() %></td>
			
			<!-- 주문서번호 링크 수정 필요합니다 -->
			<td><a href="./OrderContent.me"><%=dto.getOrder_id() %></a></td>
			
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


</body>
</html>