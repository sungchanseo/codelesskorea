package com.itwillbs.action.qna;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;
import com.itwillbs.db.MypageDAO;
import com.itwillbs.db.QnADTO;

public class MypageQNABoardReInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 한글처리
				request.setCharacterEncoding("UTF-8");
				ActionForward forward = new ActionForward();
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("id");
				
				if(id == null || !id.equals("admin@gmail.com")) {
					JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
					return forward;
				}
				
				
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getMember(id);
				boolean blocked = dto.getBlocked();
				if(blocked == true) {
					JSForward.alertAndBack(response, "잘못된 접근입니다!");
					return forward;
				}
				
				//2.전달되는 파라미터 정보저장 ->MemberDTO생성
				QnADTO qdto = new QnADTO();
				qdto.setTitle(request.getParameter("title"));
				qdto.setContent(request.getParameter("content"));
				qdto.setImage(request.getParameter("image"));
				qdto.setId(request.getParameter("id"));
				qdto.setNickname(request.getParameter("nickname"));
//				mdto.setUserID(Integer.parseInt(request.getParameter("userID")));
				//hidden 에서 가져온것 저장
				qdto.setBno(Integer.parseInt(request.getParameter("bno")));
				qdto.setRe_Ref(Integer.parseInt(request.getParameter("re_ref")));
				qdto.setRe_Lev(Integer.parseInt(request.getParameter("re_lev")));
				qdto.setRe_Seq(Integer.parseInt(request.getParameter("re_seq")));
				qdto.setQnaCategory(request.getParameter("qna_category"));
				qdto.setIs_answered(Boolean.parseBoolean(request.getParameter("isanswered")));
				System.out.println(qdto);
				//3.BoardDAO객체생성
				MypageDAO mdao = new MypageDAO();
				int result = mdao.reInsertBoard(qdto);
				
				//4페이지 이동
				forward = new ActionForward();
				
		        if(result == 1){ // 글하나 작성완료
		        	JSForward.alertAndMove(response, "글작성 성공", "./AdminQNAList.qn");
//		        	forward.setPath("./MypageQNAList.me");
//		        	forward.setRedirect(true);
		        }else{
		        	//에러 상황( 자바스크립트 / 페이지 이동 )
		        	JSForward.alertAndBack(response, "글 작성 실패!");
//		        	forward.setPath("./Main.me");
//		        	forward.setRedirect(true);
//		        	
		        }
				return forward;

	}
	

}