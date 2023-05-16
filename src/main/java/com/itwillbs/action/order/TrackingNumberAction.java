package com.itwillbs.action.order;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.OrderDAO;
import com.itwillbs.db.OrderDTO;

public class TrackingNumberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : TrackingNumberAction_execute() 호출");
		
		// 한글처리(인코딩)
				request.setCharacterEncoding("UTF-8");
				System.out.println(" M : 한글처리 완료");
				System.out.println(request.getParameter("order_id"));
				System.out.println(request.getParameter("receiver_addr1"));
				
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
//		int product_id = Integer.parseInt(request.getParameter("product_id"));
		ActionForward forward = new ActionForward();
		if(id == null ) {
			forward.setPath(".MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		
		// 전달정보(파라메터) 저장(DTO)
		int tracking_number = Integer.parseInt(request.getParameter("tracking_number"));
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		dto.setTracking_number(tracking_number);
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
		dto.setId(id);
		
//		dto.setReceiver_post(Integer.parseInt(request.getParameter("receiver_post")));
	
		System.out.println(" M : "+dto);
		// DAO - 배송지 변경 메서드 호출 
		 dto = dao.trackingNumber(dto);
		 dto = dao.getOrderContent(dto);
		 int product_id = Integer.parseInt(request.getParameter("product_id"));
		
//		forward.setPath("./order/orderWrite.jsp");
//		forward.setRedirect(false);
		JSForward jsf = new JSForward();
		jsf.alertAndMove(response, "운송장 등록 완료", "./OrderContent.or?product_id="+product_id);
//		jsf.alertAndBack(response, "운송장 등록 완료");
		System.out.println("M : 운송장 변경 완료");
		return null;
		
		
	}

}