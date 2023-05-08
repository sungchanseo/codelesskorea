package com.itwillbs.action.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;

// 회원가입 처리(인코딩,정보저장,디비연결,페이지이동)
public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberJoinAction_execute() 실행");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		// MemberDTO 객체 생성
		MemberDTO dto = new MemberDTO();
		// 전달된 정보 저장
		MemberDAO qdao = new MemberDAO();
		MemberDTO qdto = qdao.getMember(id);
		boolean blocked = qdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}
		
		dto.setId(request.getParameter("id"));
		dto.setAddress(request.getParameter("address"));
		dto.setName(request.getParameter("name"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setPhone_number(request.getParameter("phone_number"));
		dto.setPassword(request.getParameter("password"));
		dto.setRegdate(new Date(System.currentTimeMillis()));
		dto.setUser_image(request.getParameter("user_image"));
		dto.setBirth_date(request.getParameter("birth_date"));
		
		
		System.out.println(" M : "+dto);
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 회원가입 메서드
		dao.memberJoin(dto);
		
		// 페이지 이동
		JSForward.alertAndMove(response, "회원가입이 완료되었습니다.", "./MemberLogin.me");
		
		System.out.println(" M : 데이터 처리완료! 티켓 가지고 이동");
		
		return null;
	}
	
	
}