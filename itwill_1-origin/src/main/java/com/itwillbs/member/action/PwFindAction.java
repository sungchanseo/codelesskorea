package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class PwFindAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : IdFindAction_execute() 호출 ");
		
		request.setCharacterEncoding("UTF-8");
		
		//전달정보(name, phone_number) - dto에 저장
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPhone_number(request.getParameter("phone_number"));
		
		//임시비밀번호 생성
		String randomPw = "";
		for (int i = 0; i < 12; i++) {
			randomPw += (char) ((Math.random() * 26) + 97);
		}
		
		//MemberDAO 객체 생성해서 dto전달
		MemberDAO dao = new MemberDAO();
		int result = dao.pwFind(dto,randomPw);
		


		
		if(result==0 || result==-1) {
			JSForward.alertAndBack(response, "정보를 잘못 입력하셨습니다.");
			return null;
		}
		 JSForward.alertAndMove(response, "임시비밀번호 : "+randomPw , "./MemberLogin.me");
		return null;
	}

}
