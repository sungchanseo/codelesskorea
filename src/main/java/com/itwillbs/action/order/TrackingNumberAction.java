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
		System.out.println("주문번호 : "+request.getParameter("order_id"));
		System.out.println("운송장정보 :" +request.getParameter("tracking_number"));
		System.out.println("택배사정보 : "+request.getParameter("delivery_company"));
				
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null ) {
			forward.setPath(".MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 전달정보(파라메터) 저장(DTO)
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int tracking_number = Integer.parseInt(request.getParameter("tracking_number"));
		String delivery_company = request.getParameter("delivery_company");
		
		// dto 에 담을 정보
		OrderDTO dto = new OrderDTO();
		dto.setTracking_number(tracking_number);
		dto.setDelivery_company(delivery_company);
		dto.setOrder_id(Integer.parseInt(request.getParameter("order_id")));
//		dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		dto.setId(id);
		System.out.println(" M : "+dto);
		// 운송장 정보 저장
		OrderDAO dao = new OrderDAO();
		dto= dao.trackingNumber(dto);
		// 주문서 정보 dto에 담기
		dto = dao.getOrderContent(dto);
		 
		 // 돌아가기
		JSForward jsf = new JSForward();
		jsf.alertAndMove(response, "운송장정보 등록완료", "./OrderContent.or?product_id="+product_id+"&order_id="+order_id);
//		jsf.alertAndBack(response, "운송장번호 수정완료");
		System.out.println("M : 운송장 변경 완료");
		return null;
		
		
	}

}