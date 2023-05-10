<%@page import="com.itwillbs.db.MemberDTO"%>
<%@page import="com.itwillbs.db.MemberDAO"%>
<%@page import="com.itwillbs.db.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp"%>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

		$('textarea').keyup(function(){

			var tmpLength = 700 - $(this).val().length;
			$('h3').html(tmpLength);
			
			if( tmpLength < 0 ){
				$('h3').css('color','red');
			}  		
			else{
				$('h3').css('color','black');
			}
		});
		
</script>



</head>
<body>
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->
	
	<%   
	String pageNum = (String)request.getAttribute("pageNum");
	String id =(String)session.getAttribute("id");
	MemberDTO member = new MemberDAO().getMember(id);
	String nickname = member.getNickname();
	boolean isAnswered = false; 
	%>
	
<!-- 	<h1>qnaBoardInsert.jsp</h1> -->
<!-- 		로그인 세션제어 -->
		<c:if test="${ empty sessionScope.id }">
		   <c:redirect url="./MemberLogin.me"/>
		</c:if>
		
			<h2><a href="./UserQNAList.qn"> 문의내역 </a></h2>
		<c:if test="${ empty sessionScope.id  && !id.equals('admin@gmail.com') }">  
				<!-- 관리자 계정은 확인 불가능한 버튼 -->
			<h2>
			<a href="./MypageQNAInsert.qn">1:1 문의</a>
			</h2>
		</c:if>  
		
		<fieldset>
		   <form action="./MypageQNAInsertAction.qn" method="post" >
		   <input type="hidden" name="id" value="<%=id%>"><br>
		   <input type="hidden" name="isAnswered" value="<%=isAnswered%>">
<!-- 		회원정보, 상품, 신고, 결제, 기타 -->
		   카테고리 <select name="qna_category">
					  <option value='회원정보'>회원정보</option>
					  <option value='상품'>상품</option>
					  <option value='신고'>신고</option>
					  <option value='결제' >결제</option>
					  <option value='기타'>기타</option>
					</select>
		   	  작성자(닉네임) : <input type="text" name="nickname" value="<%=nickname%>" readonly><br>
		      제목 : <input type="text" name="title" required> <br> <br>
		      내용 : <br>
		      <textarea rows="30" cols="50" name="content" maxlength="700">
■ 주문관련 문의시 하단양식을 꼭 작성해 주세요 ■ 
		      
*주문자 성함 : 
*주문 번호 : 
*문의 내용 : 
		      
* 사이트 이용관련(주문,취소,배송 등) 각종궁금하신 사항은 
[고객센터] - [자주하는질문] 으로 들어가시면 자세하게 답변이
남겨져있으니 참고 바랍니다.
		      </textarea><br>
		      이미지첨부 : <input type="file" name="image"> <br>
		  		
		      <hr>
				<input type="submit" value="글쓰기">
				      
		   </form>		
		</fieldset>
		





<%@ include file="../footer.jsp"%> <!-- footer 삽입 -->
</body>
</html>