package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.member.db.OrderDAO;
import com.itwillbs.member.db.OrderDTO;

public class OrderWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderWriteAction_execute()");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
//		int product_id = (int) session.getAttribute("product_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			System.out.println("ID 정보가 없습니다.");
//			response.sendRedirect("");
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// MemberDAO 객체 생성 - 회원정보 조회 메서드 getMember()
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = dao.addOrder(id);
//		OrderDTO dto = dao.addOrder(id, product_id);
		
		// 회원정보 저장(request 영역)
		request.setAttribute("dto", dto);
		
		// 페이지 forward 이동(jsp) + 정보 출력
		forward.setPath("./order/orderWrite.jsp");
		forward.setRedirect(false);
		
		System.out.println("M : 주문정보 가져오기 완료");
		return forward;
	}
	

}