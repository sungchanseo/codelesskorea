<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
<title>Insert title here</title>
</head>
<body>
<h1>faqContent</h1>
<<<<<<< HEAD
<a href="./FAQUpdate.me">수정하기</a>
<a href="./FAQDelete.me">삭제하기</a>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>�옄二쇳븯�뒗 吏덈Ц</h1>

<%-- ${requestScope.dto } --%>

	<table border="1">
		   <tr>
		     <th>湲�踰덊샇</th>
		   </tr> 
		   <tr>
		     <td>�젣紐�</td>
		   </tr> 
		   <tr>
		     <td>�옉�꽦�씪</td>
		   </tr> 
		   <tr>
		     <td>議고쉶�닔</td>
		   </tr> 
		   <tr>
		     <td>�궡�슜</td>
		     <td>${dto.content }</td>
		   </tr> 
		</table>


<a href="./NoticeProUpdateAction.me?notice_id=${dto.notice_id }">寃뚯떆湲� �닔�젙</a>
<a href="./NoticeDelete.me?notice_id=${dto.notice_id }">寃뚯떆湲� �궘�젣</a>
<a href="./NoticeList.me?pageNum=${pageNum }">紐⑸줉�쑝濡�</a>
</body>
</html>


<a href="./FAQUpdate.me">�닔�젙�븯湲�</a>
<a href="./FAQDelete.me">�궘�젣�븯湲�</a>
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>