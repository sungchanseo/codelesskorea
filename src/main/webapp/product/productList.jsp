<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭된 리스트</title>
<%@ include file="../head.jsp"%>
<style>
  h2, p, button {
    font-family: 'TheJamsil5Bold';
  }

  .product-wrapper {
    display: flex;
    width: 400px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  }

  .product-wrapper:hover {
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
  }

  .product-image {
    flex: 1;
    text-align: center;
  }

  .product-image img {
    width: 250px;
    height: 250px;
    object-fit: contain;
  }

  .product-details {
    flex: 1;
    padding: 20px;
    text-align: left;
  }

  .product-details p {
    margin: 0;
    font-size: 16px;
    line-height: 1.5;
  }

</style>
</head>
<body style="margin: 10px; padding: 10px; max-width: 900px;">
  <div style="text-align: center;">
    <h2>매칭된 리스트</h2>
    <div class="product-list-wrapper" style="display: flex; flex-wrap: wrap; justify-content: center;">
      <c:forEach var="product" items="${requestScope.productList}" varStatus="status">
        <div class="product-wrapper" style="margin: 10px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; width: 420px;">
          <div class="product-image">
            <a href="./ProductContent.pr?product_id=${product.product_id}" target="_blank">
            <img src="./upload/product/${product.product_image.split(',')[0] }" onerror="this.src='https://via.placeholder.com/250x250?text=No Image :('" alt="${product.title}" style="max-width: 250px;">
            </a>
          </div>
          <div class="product-details" style="margin-top: 10px;">
          	<p><b>등록일:</b> ${product.reg_date}</p>
            <p><a href="./ProductContent.pr?product_id=${product.product_id}" target="_blank">${product.title}</a></p>
            <p><b>상품번호:</b> ${product.product_id}</p>
            <p><b>가격:</b> ${product.price} 원</p>
            <p><b>조회수:</b> ${product.read_count}</p>
            <p><b>찜수:</b> ${product.like_count}</p>
            <p><b>채팅수:</b> ${product.chat_count}</p>
          </div>
        </div>
      </c:forEach>
    </div>
    <div style="margin-top: 20px;">
      <button onclick="window.location.reload();" type="button" class="btn btn-secondary">새로운 매칭 보기</button>
    </div>
  </div>
</body>

</head>
</html>