package com.itwillbs.member.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateProAction_execute() 호출 ");

		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null ) {
			JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
			return forward;
		}
		
		// 전달된 정보 저장
		MemberDAO qdao = new MemberDAO();
		MemberDTO qdto = qdao.getMember(id);
		boolean blocked = qdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
			return forward;
		}

		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보(파라메터) 저장(DTO)
		MemberDTO dto = new MemberDTO();
		
//		dto.setId(rs.getString("id"));
//		dto.setPw(rs.getString("pw"));
//		dto.setName(rs.getString("name"));
//		dto.setNickname(rs.getString("nickname"));
//		dto.setTel(rs.getString("tel"));
//		dto.setAddress(rs.getString("address"));
//		dto.setPhoto(rs.getString("photo"));
//		dto.setRegdate(rs.getDate("regdate"));
		
		
		dto.setId(request.getParameter("id"));
		dto.setPassword(request.getParameter("password"));
		dto.setName(request.getParameter("name"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setPhone_number(request.getParameter("phone_number"));
		dto.setAddress(request.getParameter("address"));
		dto.setUser_image(request.getParameter("user_image"));
		dto.setRegdate(new Date(System.currentTimeMillis()));
		dto.setBirth_date(request.getParameter("birth_date"));
		
		System.out.println(dto);
		// DAO - 정보수정 메서드 호출 - memberUpdate(dto)
		MemberDAO dao = new MemberDAO();
		

		
		int result = dao.memberUpdate(dto);
		
		System.out.println(" M : 정보 수정결과 "+result);

		// 수정 처리 결과에 따른 페이지 이동 (JS)
		if(result == -1) { //아이디 없음
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>");
//			out.print(" alert('아이디 없음!'); ");
//			out.print(" history.back(); ");
//			out.print("</script>");
//			out.close();
			JSForward.alertAndBack(response, "아이디 없음!");
			return null;
		}
		if(result == 0) { // 비밀번호 오류
			// JS이동 처리 객체 동작 호출
			JSForward.alertAndBack(response, "수정 오류!!!");
			return null;
		}

		JSForward.alertAndMove(response, "수정완료!!", "./MemberInfo.me");
		return null;
	}

}