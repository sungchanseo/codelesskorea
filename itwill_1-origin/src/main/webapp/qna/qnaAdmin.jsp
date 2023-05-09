<%@page import="com.itwillbs.db.MypageDAO"%>
<%@page import="com.itwillbs.db.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
	function check(){
		if(confirm('정말로 글을 삭제 하시겠습니까?')) {
		    return true;
			} else {
		    return false;
			}//글삭제전 확인
	};


</script>

<%@ include file="../head.jsp"%>
</head>

<body>
<%@ include file="../nav.jsp"%>

<!-- nav 삽입 -->
<!-- <a href="./QNAUpdate.me">수정하기</a> -->
<!-- <a href="./QNADelete.me">삭제하기</a> -->
<!-- <a href="./QNAReWrite.me">답글달기</a> -->
<!-- <a href="./QNAList.me">목록으로</a> -->

<%
//전달받은 정보를 저장
QnADTO qdto = (QnADTO) request.getAttribute("qdto"); //object -다운캐스팅-> BoardDTO
String pageNum = (String) request.getAttribute("pageNum"); //object -다운캐스팅-> String
int bno = Integer.parseInt(request.getParameter("bno"));
String id = (String)session.getAttribute("id"); 
int re_lev = qdto.getRe_Lev();
MypageDAO mdao = new MypageDAO();
QnADTO qna = mdao.getBoard(bno);
%>
<input type="hidden" name="bno" value="<%=bno%>">

<fieldset>
<legend>Q&A 상세보기</legend>
<table border="1">
  <tr>
    <th>글번호</th>
    <td><%=qdto.getBno()%></td>
    <% if(qdto.getRe_Lev()<1) {%><th>답변상태</th>
    <td>
      <% if (qna.isIs_answered()) { %>
        <span style="color: green;">답변완료</span>
      <% } else { %>
        <span style="color: red;">답변대기</span>
      <% } %>
    </td>
    <% } %>
    <th>카테고리</th>
    <td><%=qdto.getQnaCategory() %></td>
  </tr>
  <tr>
    <th>작성자</th>
    <td><%=qdto.getNickname()%></td>
    <th>작성일</th>
    <td><%=qdto.getRegdate()%></td>
  </tr>
  <tr>
    <th>제목</th>
    <td colspan="5"><%=qdto.getTitle()%></td>
  </tr>
  <tr>
    <th>이미지</th>
    <td colspan="5"><a href="D:\upfile\<%=qdto.getImage()%>"><%=qdto.getImage() %></a></td>
  </tr>
  <tr>
    <th>내용</th>
    <td colspan="5"><textarea rows="30" cols="50" name="content" maxlength="700" readonly="readonly"><%=qdto.getContent()%></textarea></td>
  </tr>
  <tr>
    <td colspan="6" style="text-align:center">
     <input type="button" value="목록으로" class="btn" onclick="location.href='./AdminQNAList.me?pageNum=<%=pageNum%>'">
     <input type="button" value="글삭제" class="btn" onclick="location.href='./QNADeleteAction.me?bno=<%=qdto.getBno()%>&pageNum=<%=pageNum%>'">
	 <input type="button" value="글수정" class="btn" onclick="location.href='./QNAUpdate.me?bno=<%=qdto.getBno()%>&pageNum=<%=pageNum%>'">
	 <input type="button" value="답변하기" class="btn" onclick="location.href='./QNAReWrite.me?bno=<%=qdto.getBno()%>&pageNum=<%=pageNum%>&re_ref=<%=qdto.getRe_Ref() %>&re_lev=<%=qdto.getRe_Lev()%>&re_seq=<%=qdto.getRe_Seq()%>'">
    </td>
  </tr>
</table>
</fieldset>


  <%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>