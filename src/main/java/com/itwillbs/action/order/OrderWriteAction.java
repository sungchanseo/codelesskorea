package com.itwillbs.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class OrderWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderWriteAction_execute()");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("id: "+id);
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("id: "+id +" / product_id: " +product_id);
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			System.out.println("ID 정보가 없습니다.");
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// MemberDAO 객체 생성 - 회원정보 조회 메서드 getMember()
		OrderDAO dao = new OrderDAO();
		System.out.println("OrderWriteAction1");
		OrderDTO dto = dao.addOrder(id, product_id);
		System.out.println("OrderWriteAction2 : DAO 메서드 완료");
		// 회원정보 저장(request 영역)
		request.setAttribute("dto", dto);
		
		// 페이지 forward 이동(jsp) + 정보 출력
		forward.setPath("./order/orderWrite.jsp");
		forward.setRedirect(false);
		
		System.out.println("M : 주문정보 가져오기 완료");
		return forward;
	}
	

}