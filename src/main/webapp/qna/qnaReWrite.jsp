<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.db.QnADTO"%>
<%@page import="com.itwillbs.db.MemberDTO"%>
<%@page import="com.itwillbs.db.MypageDAO"%>
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
<!-- <h1>qnaReWrite</h1> -->
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

	<%   
	
	String id = (String)session.getAttribute("id");
	int bno = Integer.parseInt(request.getParameter("bno"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	
	MemberDTO member = new MemberDAO().getMember(id);
	String nickname = member.getNickname();
	MypageDAO mdao = new MypageDAO();
	QnADTO qna = mdao.getBoard(bno);
// 	String qna_category = request.getParameter("qna_category");
 	String qna_category = qna.getQnaCategory();
	%>
	아이디 : <%=id %>

<!-- 		로그인 세션제어 -->
		<c:if test="${ empty sessionScope.id && !id.equals('admin@gmail.com')}">
		   <c:redirect url="./MemberLogin.me"/>
		</c:if>
		
		<h2><a href="./AdminQNAList.me"> 문의내역 </a></h2>
		
		<fieldset>
		   <form action="./QNAReWriteAction.qn" method="post" >
		   	<input type="hidden" name="bno" value="<%=bno %>">
			<input type="hidden" name="re_ref" value="<%=re_ref %>">
			<input type="hidden" name="re_lev" value="<%=re_lev %>">
			<input type="hidden" name="re_seq" value="<%=re_seq %>">
		    <input type="hidden" name="id" value="<%=id%>"><br>
		    <input type="hidden" name="qna_category" value="<%=qna_category%>"><br>
		   	  작성자(닉네임) : <input type="text" name="nickname" value="<%=nickname %>" readonly><br>
		      제목 : <input type="text" name="title" value="ㄴ[답글]" readonly> <br>
		      내용 : <textarea rows="15" cols="40" name="content"></textarea><br>
		      이미지첨부 : <input type="file" name="image"> <br>
		  		
		      <hr>
				<input type="submit" value="글쓰기">
				      
		   </form>		
		</fieldset>
		


<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>