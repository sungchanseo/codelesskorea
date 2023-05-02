<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
  <%@ include file="layout/head.jsp" %>
  </head>    
<body>
 <%@ include file="layout/nav.jsp" %><!-- nav 삽입 -->
	
 <div class="container" id="login-con">
  <form action="./MemberLoginAction.me"> 
    <div class="form-group" id="log-form">
     <div style="text-align: center;"><a class="navbar-brand" href="./Main.me" style="font-size: 40px;"><span>CODELESS</span></a></div>
     
      <input type="email" class="form-control"  placeholder="아이디를 입력해주세요." name="id" style="margin-bottom: 10px;">
	 
      <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." name="password">

      <button type="submit" class="btn btn-primary btn-block" style="margin-top: 30px;" >로그인</button>
      <hr>
               
      <span onclick="location.href='./IdFind.me'" style="margin-left:85px; cursor:pointer;" >아이디 찾기</span>  |
      
      <span onclick="location.href='./PwFind.me'" style="cursor:pointer;" >비밀번호 찾기</span>  
      

    
   </div>
  </form>
</div><!-- 로그인 컨테이너박스 끝 -->
 <%@ include file="layout/footer.jsp" %> <!-- footer 삽입 -->
</body>
</html>