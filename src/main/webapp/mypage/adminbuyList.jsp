<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../head.jsp" %>
</head>

<body>

	<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
	회원 : ${requestScope.id} 의 구매목록
	<table border="1">
			<tr>
		      <th>상품명</th>
		      <th>가격</th>
		      <th>판매자</th>
		      <th>구매자</th>
		      <th>주문서번호</th>
		      <th>결제일자</th>
		      <th>주문진행상태</th>
		   </tr>
	   <!-- rs(데이터) <- DTO <- List -->
	   <c:forEach var="dto" items="${requestScope.buyList }">
		   <tr>
		      <td>${dto.title }</td>
		      <td>${dto.price }</td>
		      <td>${dto.seller_id }</td>
		      <td>${dto.buyer_id }</td>
		      <td>${dto.order_id }</td>
		      <td>${dto.order_date }</td>
		      <td>${dto.order_status }</td>

		   </tr>
	   	</c:forEach>
	</table>
	
	
<%-- <%@ include file="../footer.jsp"%> <!-- footer 삽입 --> --%>
</body>
</html>