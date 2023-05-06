package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

// 로그인 정보 처리
public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : MemberLoginAction_execute() 호출 ");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// MemberDTO 객체
		MemberDTO dto = new MemberDTO();
		// 전달된 정보 저장
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		System.out.println(" M : " + dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 로그인체크 메서드 호출 => 결과확인
		int result = dao.memberLogin(dto);
		
		// 페이지 이동
		if(result == -1 || result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			if(result == -1) {
				out.print("alert('아이디 없음!');");
			}else {
				out.print("alert('비밀번호 오류!');");
			}
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null; // 컨트롤러에서는 이동X
		}
		
		// 로그인 성공! (result == 1)
		HttpSession session = request.getSession();
		session.setAttribute("id", dto.getId());
		
		// 페이지 이동 - ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.me");
		forward.setRedirect(true);
		
		System.out.println(" M : 데이터 처리완료! 티켓 가지고 이동 ");
		
		return forward;
	}

}
