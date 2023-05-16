package com.itwillbs.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : OrderAddAction_execute()");
		
		// 세션정보 가져오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("id: "+id +" / product_id: " +product_id);
		
		if(id == null) {
			JSForward jsf = new JSForward();
			jsf.alertAndMove(response, "로그인이 필요합니다", "./MemberLogin.me");
		}
		
		
		// dto 생성, 결제정보 저장
		OrderDTO dto = new OrderDTO();
		dto.setId(id);
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
		dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		dto.setReceiver_name(request.getParameter("name"));
		dto.setReceiver_phone(request.getParameter("receiver_phone"));
		dto.setReceiver_addr1(request.getParameter("receiver_addr1"));
		dto.setReceiver_addr2(request.getParameter("receiver_addr2"));
		dto.setReceiver_post(Integer.parseInt(request.getParameter("receiver_post")));
		System.out.println("dto : "+dto);
		String order_date = request.getParameter("order_date");
		System.out.println(order_date);
		// 아래는 결제정보, 일단은 넘어오는지 확인만 함.
		dto.setImp_uid(request.getParameter("imp_uid"));
		dto.setMerchant_uid(request.getParameter("merchant_uid"));
		dto.setPaid_amount(request.getParameter("paid_amount"));
		dto.setApply_num(request.getParameter("apply_num"));
		
		// MemberDAO 객체 생성 
		OrderDAO dao = new OrderDAO();
		// 주문정보 저장 메서드 getOrderContent()
		dao.addOrder(dto);
		int order_id = dto.getOrder_id();
		// 주문서 출력 메서드 getOrderContent()
		dto = dao.getOrderContent(dto);
		
		// 회원정보 저장(request 영역)
		request.setAttribute("dto", dto);
		System.out.println("id: "+id +" / product_id: " +product_id);
		
		System.out.println("M : 결제정보 저장, 주문정보 가져오기 끝");
		return null;
	}
	

}
