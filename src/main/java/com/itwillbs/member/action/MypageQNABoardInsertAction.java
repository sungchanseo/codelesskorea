package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.member.db.QnADTO;
import com.itwillbs.member.db.MypageDAO;


public class MypageQNABoardInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 한글처리
				request.setCharacterEncoding("UTF-8");
				ActionForward forward = new ActionForward();
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("id");
				
				
				// 차단 사용자 세션제어
				MemberDAO dao = new MemberDAO();
				MemberDTO dto = dao.getMember(id);
				boolean blocked = dto.getBlocked();
				if(blocked == true) {
					JSForward.alertAndBack(response, "잘못된 접근입니다!");
					return forward;
				}
				
				if(id == null ) {
					JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
					return forward;
				}
				
				//2.전달되는 파라미터 정보저장 ->MemberDTO생성
				QnADTO qdto = new QnADTO();
				qdto.setTitle(request.getParameter("title"));
				qdto.setContent(request.getParameter("content"));
				qdto.setImage(request.getParameter("image"));
				qdto.setId(request.getParameter("id"));
				qdto.setNickname(request.getParameter("nickname"));
				qdto.setQnaCategory(request.getParameter("qna_category"));
				qdto.setIs_answered(Boolean.parseBoolean(request.getParameter("isanswered")));
//				mdto.setUserID(Integer.parseInt(request.getParameter("userID")));
//				mdto.setRe_Ref(Integer.parseInt(request.getParameter("re_ref")));
//				mdto.setRe_Lev(Integer.parseInt(request.getParameter("re_lev")));
//				mdto.setRe_Seq(Integer.parseInt(request.getParameter("re_seq")));
				System.out.println(qdto);
				//3.BoardDAO객체생성
				MypageDAO mdao = new MypageDAO();
				int result = mdao.insertQNABoard(qdto);
				
				//4페이지 이동
				 forward = new ActionForward();
				
		        if(result == 1){ // 글하나 작성완료
		        	JSForward.alertAndMove(response, "글작성 성공", "./UserQNAList.me");
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