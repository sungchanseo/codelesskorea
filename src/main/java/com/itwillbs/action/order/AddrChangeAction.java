package com.itwillbs.action.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class AddrChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : AddrChangeAction_execute() 호출");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null ) {
			forward.setPath(".MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		System.out.println(" M : 한글처리 완료");
		System.out.println(request.getParameter("order_id"));
		
		// 전달정보(파라메터) 저장(DTO)
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
		dto.setId(request.getParameter("id"));
		dto.setReceiver_name(request.getParameter("receiver_name"));
		dto.setReceiver_phone(request.getParameter("receiver_phone"));
		dto.setReceiver_addr1(request.getParameter("receiver_addr1"));
	
		System.out.println(" M : "+dto);
		// DAO - 배송지 변경 메서드 호출 
		 dto = dao.AddrChange(dto);
		
		forward.setPath("./order/orderWrite.jsp");
		forward.setRedirect(false);
		
		System.out.println("M : 배송지 변경 완료");
		return forward;
		
		
	}

}