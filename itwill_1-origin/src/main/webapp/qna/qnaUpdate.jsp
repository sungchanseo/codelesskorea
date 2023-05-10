<%@page import="com.itwillbs.db.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
<!-- <h1>qnaUpdate</h1> -->
<%			String pageNum = (String) request.getParameter("pageNum");
			QnADTO qdto = (QnADTO) request.getAttribute("qdto");
			%>
			<fieldset>
			<legend> 게시판 수정하기 </legend>
				<form action="./QNAUpdateAction.qn?pageNum=<%=pageNum %>" method="post" name="fr">
				<input type="hidden" name="bno" value="<%=qdto.getBno() %>">
				<input type="hidden" name="pageNum" value="<%=pageNum %>">
				   작성자 : <input type="text" name="nickname" required value="<%=qdto.getNickname()%>" readonly="readonly"><br>
				   제목 : <input type="text" name="title" required value="<%=qdto.getTitle() %>" readonly="readonly"><br>
				   내용 : <br> 
				  <textarea rows="20" cols="45" name="content" required><%=qdto.getContent() %></textarea><br>
				  <input type="submit" value="글 수정하기" class="btn">
				  <input type="button" value="수정취소" class="btn" onclick="location.href='./AdminQNAList.me'"> 
				</form>
			</fieldset>


<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>