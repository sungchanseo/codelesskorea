<%@page import="com.itwillbs.db.ListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.db.ListDAO"%>
<%@page import="com.itwillbs.action.mypage.BuyListAction"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

	<%
	ListDAO li = new ListDAO();
	String id = (String)session.getAttribute("id"); 
	ArrayList buyList = (ArrayList) li.getBuyList(id);
	%>
	
	


<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">구 매 목 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">
<table border="1">
	<tr>
      <th>상품명</th>
      <th>가격</th>
      <th>판매자</th>
      <th>주문서번호</th>
      <th>결제일자</th>
      <th>주문진행상태</th>
   </tr>

      
	<%
      for(int i=0;i<buyList.size();i++){
	      	//  ArrayList -> DTO -> 변수
	      	ListDTO dto = (ListDTO) buyList.get(i);
    %>
    
		  <tr>
			<td><a href="./ProductContent.pr?product_id=<%=dto.getProduct_id() %>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getPrice() %></td>
			<td><%=dto.getSeller_id() %></td>
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