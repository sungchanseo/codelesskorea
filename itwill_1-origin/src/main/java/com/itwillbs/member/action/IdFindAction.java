package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class IdFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : IdFindAction_execute() 호출 ");
		
		request.setCharacterEncoding("UTF-8");
		
		//전달정보(name, phone_number) - dto에 저장
		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setPhone_number(request.getParameter("phone_number"));
		
		//MemberDAO 객체 생성해서 dto전달
		MemberDAO dao = new MemberDAO();
		String result = dao.idFind(dto);
		
		if(result=="none") {
			JSForward.alertAndBack(response, "정보를 잘못 입력하셨습니다.");
			return null;
		}
		 JSForward.alertAndMove(response, "아이디는 "+result+" 입니다.", "./MemberLogin.me");
		return null;
	}
	


}
