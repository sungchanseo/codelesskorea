<%@page import="com.itwillbs.db.ProductDTO"%>
<%@page import="com.itwillbs.db.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<meta charset="UTF-8"> 
	<title>상품 보기</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			color: #333;
		}
		
		table {
			border-collapse: collapse;
			margin-top: 20px;
		}
		
		th, td {
			padding: 10px;
			border: 1px solid #ccc;
			text-align: center;
			vertical-align: middle;
		}
		
		th {
			background-color: #ddd;
		}
		
		img {
			display: block;
			margin: 0 auto;
			max-width: 100%;
			height: auto;
		}
		
		form {
			display: inline-block;
			margin: 10px;
			padding: 10px 20px;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: 1px solid #333;
			transition: all 0.3s ease;
		}
		
		form:hover {
			background-color: #fff;
			color: #333;
		}
		
		form:hover input[type="submit"] {
			background-color: #fff;
			color: #333;
		}
		
		input[type="submit"] {
			display: inline-block;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: none ;
			transition: all 0.3s ease;
			font-size: 16px;
		}

		a {
			display: inline-block;
			margin: 10px;
			padding: 10px 20px;
			background-color: #333;
			color: #fff;
			text-decoration: none;
			border-radius: 4px;
			border: 1px solid #333;
			transition: all 0.3s ease;
		}
		
		a:hover {
			background-color: #fff;
			color: #333;
		}
		
		.like-btn {
		  border: none;
		  background: none;
		  cursor: pointer;
		  font-size: 1.2em;
		  transition: transform 0.3s ease-in-out;
		}
		
		.like-btn i {
		  font-size: 1.5em;
		  color: #999;
		  transition: color 0.3s ease-in-out;
		}
		
		.like-btn.liked i {
		 color: #ff6969;
		}
		
		.like-btn:hover {
		  transform: scale(1.1);
		}
		
		.like-btn:hover i {
		  color: #ff6969;
		}
						
	</style>
	

		<script type="text/javascript">
		$(document).ready(function() {
			  // 사용자 식별자를 얻어오는 로직이 필요합니다. 예시로 'userId' 변수에 사용자 식별자를 할당합니다.

			  var userId = '<%= session.getAttribute("id") %>';
			  // 찜한 상품 정보를 로컬 스토리지에서 가져옵니다.
			  var likedProducts = JSON.parse(localStorage.getItem('likedProducts')) || {};
			  // 사용자의 찜한 상품 정보를 가져옵니다.
			  var userLikedProducts = likedProducts[userId] || {};

			  // 모든 찜하기 버튼을 돌며 찜한 상품인 경우 버튼에 liked 클래스를 추가합니다.
			  $('.like-btn').each(function() {
			    var $btn = $(this);
			    var productId = $btn.data('product-id');
			    var key = productId.toString(); // 찜 상품 키로 사용할 문자열로 변환합니다.
			    if (userLikedProducts[key]) {
			      $btn.addClass('liked');
			    }
			  });

			  // 찜하기 버튼을 클릭할 때 찜한 상품 정보를 로컬 스토리지에 저장합니다.
			  $('.like-btn').on('click', function() {
			    var $btn = $(this);
			    var productId = $btn.data('product-id');
			    var key = productId.toString(); // 찜 상품 키로 사용할 문자열로 변환합니다.
			    var isLiked = $btn.hasClass('liked');

			    if (!isLiked) {
			      $.ajax({
			        url: './AjaxLikedAction.aj',
			        data: { product_id: productId, id: userId },
			        success: function(response) {
			          if (response.success) {
			            $btn.addClass('liked');
			            // 사용자의 찜한 상품 정보를 업데이트합니다.
			            userLikedProducts[key] = true;
			            likedProducts[userId] = userLikedProducts;
			            localStorage.setItem('likedProducts', JSON.stringify(likedProducts));
			            location.reload();
			            alert('찜 추가완료!');
			          } else {
			            alert('추가 실패!');
			          }
			        }
			      });
			    } else { 
			      $.ajax({
			        url: './AjaxUnLikedAction.aj',
			        data: { product_id: productId, id: userId },
			        success: function(response) {
			          if (response.success) {
			            $btn.removeClass('liked');
			            // 사용자의 찜한 상품 정보에서 해당 상품을 삭제합니다.
			            delete userLikedProducts[key];
			            likedProducts[userId] = userLikedProducts;
			            localStorage.setItem('likedProducts', JSON.stringify(likedProducts));
			            location.reload();
			            alert('찜 해제완료!');
			          } else {
			            alert('삭제 실패!');
			          }
			        }
			      });
			    }
			  });
			});

		</script>

</head>
<body>
<h1>상품 보기</h1>
	<table border="1">
		<tr>
			<th>판매자</th>
			<td>${product.user_id}</td>
		</tr>
		<tr>
			<th>No.</th>
			<td>${product.product_id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${product.title}</td>
		</tr>
		<tr>
			<th>모델</th>
			<td>${product.model}</td>
		</tr>
		<tr>
			<th>부품명</th>
			<td>${product.parts}</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><img src="${product.product_image}" alt="이미지 없음" width="300px"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${product.content}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${product.price}원</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>${product.grade}등급</td>
		</tr>
		<tr>
			<th>판매지역</th>
			<td>${product.city}</td>
		</tr>
		<tr>
			<th>배송방법</th>
			<td>${product.method}</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td>${product.charge}원</td>
		</tr>
		<tr>
			<th>수수료</th>
			<td>${product.fee}원</td>
		</tr>
	</table>
	<a href="./ProductList.pr">상품 리스트로 이동</a>
	<a href="./OrderWrite.pr">구매하기</a>
	<a href="./MypageQNAInsert.qn?product_id=${product.product_id}">신고하기</a>
	<c:if test="${ sessionScope.id != product.user_id }">
		<a href="./ChatToSeller.ch?toID=${product.user_id }">채팅하기</a>
	</c:if>
					<!-- 찜 버튼 -->
	<button class="like-btn" data-product-id="${product.product_id}" data-user-id="${sessionScope.id }">
		  <i class="fa fa-heart"></i>
	</button>
					<!-- 찜수 -->
					<span style="font-size: 0.8em; color: gray;">찜수: ${product.like_count }</span>
	<br>
	<br>
	<c:if test="${ sessionScope.id eq 'admin' or product.user_id eq sessionScope.id }">
    <a href="./ProductUpdate.pr?product_id=${product.product_id}" >상품글 수정</a>
		<form method="post" action="./ProductDeleteAction.pr"
			onsubmit="if(!confirm('상품을 삭제하시겠습니까?')) return false;">
			<input type="hidden" name="product_id" value="${product.product_id}">
			<input type="submit" value="상품글 삭제">
			
		</form>
		<a href="./ProductList.pr">판매완료test</a>
	</c:if>


			

</body>
</html>