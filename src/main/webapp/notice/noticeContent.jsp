<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>noticeContent</h1>
<a href="./NoticeUpdate.no">게시글 수정</a>
<a href="./NoticeDelete.no">게시글 삭제</a>
<a href="./NoticeList.no">목록으로</a>
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

<!-- <script>
$(function(){
	var formDate = {
			notice_id = $("#notice_id").val();
		};
	
	$.ajax({
		url:"./MemberFrontController.me",
		type:"POST",
		data:JSON.stringify(formData),
		dataType: 'json',
		success: function (result) {
		      // �꽦怨듯븳 寃쎌슦 泥섎━�븷 �궡�슜�쓣 �옉�꽦�빀�땲�떎.
		      alert("�뜲�씠�꽣媛� �꽦怨듭쟻�쑝濡� �쟾�넚�릺�뿀�뒿�땲�떎.");
		    },
		    error: function (e) {
		      // �떎�뙣�븳 寃쎌슦 泥섎━�븷 �궡�슜�쓣 �옉�꽦�빀�땲�떎.
		      alert("�뜲�씠�꽣 �쟾�넚�씠 �떎�뙣�븯����뒿�땲�떎.");
		    }
	}); 
</script>
 -->


<h1>noticeContent</h1>

<%-- ${requestScope.dto } --%>


	<table border="1">
		   <tr>
		     <th>湲�踰덊샇</th>
		     <td>${dto.notice_id }</td>
		   </tr> 
		   <tr>
		     <td>�젣紐�</td>
		     <td>${dto.title }</td>
		   </tr> 
		   <tr>
		     <td>�옉�꽦�씪</td>
		     <td>${dto.date }</td>
		   </tr> 
		   <tr>
		     <td>議고쉶�닔</td>
		     <td>${dto.count }</td>
		   </tr> 
		   <tr>
		     <td>�궡�슜</td>
		     <td>${dto.content }</td>
		   </tr> 
		</table>


<a href="./NoticeProUpdateAction.no?notice_id=${dto.notice_id }">寃뚯떆湲� �닔�젙</a>
<a href="./NoticeDelete.no?notice_id=${dto.notice_id }">寃뚯떆湲� �궘�젣</a>
<a href="./NoticeList.no?pageNum=${pageNum }">紐⑸줉�쑝濡�</a>
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
</body>
</html>