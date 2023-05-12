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

<!-- 관리자페이지의 [상품관리]탭을 누르면 판매 상태여부에 관계 없이 모든 거래 리스트를 볼 수 있다. -->
<!-- 최신순으로 모든 상품의 리스트가 한 페이지 20개씩 출력됨 -->
<!-- 리스트로 출력되는 내용은 상품번호, 상품명, 판매가, 판매자, 구매자, 등록일시, 판매 상태(판매중, 판매완료) -->
<!-- 상품 링크를 클릭하면 해당 상품 페이지로 이동할 수 있음 -->

<table border="1">
	<thead>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>판매자</th>
			<th>구매자</th>
			<th>등록일시</th>
			<th>주문진행상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dto" items="${requestScope.adminProductList}">
			<tr>
				<td>${dto.product_id}</td>
				<td><a href="./ProductContent.pr?product_id=${dto.product_id}">${dto.title}</a></td>
				<td>${dto.price}</td>
				<td>${dto.seller_id}</td>
				<td>${dto.buyer_id}</td>
				<td>${dto.order_date}</td>
				<td>
					<c:set var="status" value="${dto.order_status}" />
					<c:choose>
						<c:when test="${status == 1}">주문확인</c:when>
						<c:when test="${status == 2}">주문수락</c:when>
						<c:when test="${status == 3}">발송</c:when>
						<c:when test="${status == 4}">구매확정</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


			<div class="container" style="margin: auto;">
			  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 50px;">
		  	<c:if test="${startPage > pageBlock }"> 
			<li class="page-item"><a class="page-link" href="./AdminProductList.my?pageNum=${startPage-pageBlock} "><sapn>이전</sapn></a></li>
			</c:if>
		   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<li class="page-item"><a class="page-link" href="./AdminProductList.my?pageNum=${i }"><span>${i }</span></a></li>
			</c:forEach>
		    <c:if test="${endPage<pageCount }">
			<li class="page-item"><a class="page-link" href="./AdminProductList.my?pageNum=${startPage+pageBlock} "><span>다음</span></a></li>
			</c:if>
		  </ul>
		 
  		</div>






 <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>