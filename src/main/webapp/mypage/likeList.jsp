<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>

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
			  // 찜한 상품 정보를 로컬 스토리지에서 가져옵니다.
			  var likedProducts = JSON.parse(localStorage.getItem('likedProducts')) || {};

			  // 모든 찜하기 버튼을 돌며 찜한 상품인 경우 버튼에 liked 클래스를 추가합니다.
			  $('.like-btn').each(function() {
			    var $btn = $(this);
			    var productId = $btn.data('product-id');
			    var userId = $btn.data('user-id');
			    var key = productId + '_' + userId;
			    if (likedProducts[key]) {
			      $btn.addClass('liked');
			    }
			  });

			  // 찜하기 버튼을 클릭할 때 찜한 상품 정보를 로컬 스토리지에 저장합니다.
			  $('.like-btn').on('click', function() {
			    var $btn = $(this);
			    var productId = $btn.data('product-id');
			    var userId = $btn.data('user-id');
			    var key = productId + '_' + userId;
			    var isLiked = $btn.hasClass('liked');

			    if (!isLiked) {
			      $.ajax({
			        url: './AjaxLikedAction.aj',
			        data: { product_id: productId, id: userId },
			        success: function(response) {
			          if (response.success) {
			            $btn.addClass('liked');
			            // 찜한 상품 정보를 로컬 스토리지에 저장합니다.
			            likedProducts[key] = true;
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
			            // 로컬 스토리지에서 해당 상품 정보를 삭제합니다.
			            delete likedProducts[key];
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
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

<!-- LikeList -->

<div class="col-sm-8" style="margin:auto;">
 <div id="right" style="margin-left: 150px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">찜 목 록</h1>
<hr style="border: 0;height: 3px; background-color: black;">


	<!-- Action에서 받아온 정보(LikeList) -->	
	<div style="text-align:center;">
		  <table style="border-collapse: collapse;">
		    <c:forEach var="dto" items="${requestScope.LikeList}" varStatus="status">
		      <c:if test="${status.index % 3 == 0}">
		        <tr>
		      </c:if>
		        <td style="border: none; vertical-align: top; padding: 10px;">
		         <a href="./ProductContent.pr?product_id=${dto.product_id}">
		          <img src="${dto.product_image}" width="250px" height="200px">
		          <br>
		          <a href="./ProductContent.pr?product_id=${dto.product_id}">${dto.title}</a> 
					          	<!-- 찜 버튼 -->
				<button class="like-btn" data-product-id="${dto.product_id}" data-user-id="${sessionScope.id }">
					  <i class="fa fa-heart"></i>
				</button>
								<!-- 찜 버튼 -->
		          
		          <br>
		          ${dto.price}원
		        </td>
		      <c:if test="${status.index % 3 == 2}">
		        </tr>
		      </c:if>
		    </c:forEach>
		  </table>
		</div>
		</div>
		 </div>

		<div class="container" style="margin: auto;">
				  <ul class="pagination justify-content-center" id="pagination" style="margin-top: 20px;">
			  	<c:if test="${startPage > pageBlock }"> 
				<li class="page-item"><a class="page-link" href="./LikeList.my?pageNum=${startPage-pageBlock} "><sapn>이전</sapn></a></li>
				</c:if>
			   <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
				<li class="page-item"><a class="page-link" href="./LikeList.my?pageNum=${i }"><span>${i }</span></a></li>
				</c:forEach>
			    <c:if test="${endPage<pageCount }">
				<li class="page-item"><a class="page-link" href="./LikeList.my?pageNum=${startPage+pageBlock} "><span>다음</span></a></li>
				</c:if>
			  </ul>
			 
	  		</div>



<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>