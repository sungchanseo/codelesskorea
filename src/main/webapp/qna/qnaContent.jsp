<%@page import="com.itwillbs.db.QnADTO"%>
<%@page import="com.itwillbs.db.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	
	  function openModal() {
		    var modal = document.getElementById("myModal");
		    modal.style.display = "block";
		  }

		  function closeModal() {
		    var modal = document.getElementById("myModal");
		    modal.style.display = "none";
		  }

		  // When the user clicks anywhere outside of the modal, close it
		  window.onclick = function(event) {
		    var modal = document.getElementById("myModal");
		    if (event.target == modal) {
		      closeModal();
		    }
	 }

	</script>
	
	<%@ include file="../head.jsp" %>
	
		<meta charset="UTF-8">
	<style>
    .profile-img {
        display: inline-block;
        width: 150px;
        height: 150px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 10px;
    }

    .profile-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .profile-img img:hover {
        cursor: pointer;
        transform: scale(1.1);
        transition: transform 0.2s ease-in-out;
    }
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  display: block;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  max-width: 50%;
  max-height: 70%;
  overflow: auto;
}

.modal-content img {
  width: 100%;
  height: auto;
  display: block;
}

.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 24px;
  font-weight: bold;
  color: white;
  z-index: 9999;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
table {
  margin: auto;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
  border: 1px solid #ddd;
}

th {
  background-color: #F2F2F2;
}

th:first-child, td:first-child {
  min-width: 100px;
}

th:nth-child(2), td:nth-child(2) {
  min-width: 100px;
}

th:nth-child(3), td:nth-child(3) {
  min-width: 120px;
}

th:nth-child(4), td:nth-child(4) {
  min-width: 120px;
}

td:last-child {
  text-align: center;
}

textarea {
  width: 100%;
  margin: auto;
  padding: 10px;
  border: 1px solid #ddd;
  resize: none;
  overflow: auto;
}

th:nth-of-type(3), td:nth-of-type(4) {
  width: 80px; !important;
}

fieldset {
  margin-bottom: 130px; !important;
}


</style>


</head>

<body>
<%@ include file="../nav.jsp"%>


	 <!--   사이드바 -->
	  <div class="col-sm-4">
 <div class="container" id="left">
  <br>
  <h4> QnA 게시판</h4>
  <hr style="border: 0;height: 1px; background-color: black;">
  <h5 onclick="location.href='./UserQNAList.qn'"> 질문 목록 </h5>
  <h5 onclick="location.href='./MypageQNAInsert.qn'"> 1:1 문의 </h5>

  </div>
	</div>	
	

	
	 <!--   사이드바 -->
<div class="col-sm-8" style="margin:auto;">
	 

 <div id="right" style="margin-left: 50px; width: 100%;">
 <h1 style="font-family: 'TheJamsil5Bold';">내용보기</h1>
<hr style="border: 0;height: 3px; background-color: black;">

<input type="hidden" name="bno" value="${qdto.bno }">
<input type="hidden" name="pageNum" value="${pageNum }">
<fieldset style="margin: auto; ">
<table border="1"  style="margin: auto;" >
  <tr>
<c:if test="${qdto.re_Lev < 1}">
  <th>답변상태</th>
  <td>
    <c:choose>
      <c:when test="${qdto.is_answered}">
        <span style="color: green;">답변완료</span>
      </c:when>
      <c:otherwise>
        <span style="color: red;">답변대기</span>
      </c:otherwise>
    </c:choose>
  </td>
</c:if>
<c:if test="${qdto.re_Lev < 1}">
    <th>카테고리</th>
    <td>${qdto.qnaCategory}</td>
</c:if>
  </tr>
  <tr>
    <th>작성자</th>
    <td>${qdto.nickname}</td>
    <th>작성일</th>
    <td>${qdto.regdate}</td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="5">${qdto.title}</td>
  </tr>
<c:if test="${not empty qdto.image}">
  <tr>
    <th>이미지</th>
							<td colspan="3">	<img src="./upload/${qdto.image}" alt="사진"
									style="max-width: 200px; max-height: 200px; cursor: pointer;"
									onclick="openModal()"> </td>
	</tr>
</c:if>
  <tr>
    <th>내용</th>
    <td colspan="5"><textarea cols="60" rows="15" readonly="readonly" style="border: none;">${qdto.content}</textarea>
    	<c:if test="${qdto.productId ne 0}">
    <a href="./ProductContent.pr?product_id=${qdto.productId}" style="color: red">신고된 상품링크로 가기 상품번호 : ${qdto.productId}번</a>
		</c:if>
    
    </td>
  </tr>
  </table>

	<div style= "float: right; margin-top: 30px;">
     <input type="button" value="목록으로" class="btn btn-secondary" onclick="location.href='./UserQNAList.qn?pageNum=${pageNum }'">
	<c:if test="${id eq qdto.id}">
	<input type="button" value="글삭제" class="btn btn-primary" onclick="location.href='./UserQNADeleteAction.qn?bno=${qdto.bno}&pageNum=${pageNum}'">
	</c:if>
	

	
</fieldset>

</div></div></div>

	
<!-- 	모달 -->
	<div id="myModal" class="modal">
		  <span class="close" onclick="closeModal()">&times;</span>
		  <img class="modal-content" src="./upload/${qdto.image}" alt="사진">
		</div>
<!-- 	모달 -->

<div style="padding-bottom: 50px;"></div>

<br>
  <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>