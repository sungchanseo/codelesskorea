package com.itwillbs.action.order;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class OrderContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderContentAction_execute()");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("id: "+id +" / product_id: " +product_id);
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			System.out.println("ID 정보가 없습니다.");
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		// dto 생성, 결제정보 저장
		OrderDTO dto = new OrderDTO();
		dto.setId(id);
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
		dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		String order_date = request.getParameter("order_date");
		System.out.println(order_date);
		dto.setOrder_date(order_date);
		// 아래는 결제정보, 일단은 넘어오는지 확인만 함.
		dto.setImp_uid(request.getParameter("imp_uid"));
		dto.setMerchant_uid(request.getParameter("merchant_uid"));
		dto.setPaid_amount(request.getParameter("paid_amount"));
		dto.setApply_num(request.getParameter("apply_num"));
		
		// MemberDAO 객체 생성 - 주문정보 조회 메서드 getOrderContent()
		OrderDAO dao = new OrderDAO();
		dto = dao.getOrderContent(dto);
		
		// 회원정보 저장(request 영역)
		request.setAttribute("dto", dto);
		
		// 페이지 forward 이동(jsp) + 정보 출력
		forward.setPath("./order/orderContent.jsp");
		forward.setRedirect(false);
		
		System.out.println("M : 결제정보 저장, 주문정보 가져오기 끝");
		return forward;
	}
	

}
