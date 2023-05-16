package com.itwillbs.action.order;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class OrderContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderContentAction_execute() 호출");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		System.out.println("id: "+id +" / product_id: " +product_id+" / order_id: "+order_id);
		
		if(id == null) {
			JSForward jsf = new JSForward();
			jsf.alertAndMove(response, "로그인이 필요합니다", "./MemberLogin.me");
		}
		
		// dto 생성, 결제정보 저장
		OrderDTO dto = new OrderDTO();
		dto.setId(id);
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
		dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			
		// MemberDAO 객체 생성 - 주문정보 조회 메서드 getOrderContent()
		OrderDAO dao = new OrderDAO();
		dto = dao.getOrderContent(dto);
		
		// 회원정보 저장(request 영역)
		request.setAttribute("dto", dto);
		
		// 페이지 forward 이동(jsp) + 정보 출력
		ActionForward forward = new ActionForward();
		forward.setPath("./order/orderContent.jsp");
		forward.setRedirect(false);
		
		System.out.println("M : 주문정보 가져오기 완료");
		return forward;
	}
	

}
