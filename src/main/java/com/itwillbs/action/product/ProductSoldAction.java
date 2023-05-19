package com.itwillbs.action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;
import com.itwillbs.db.ProductDAO;

public class ProductSoldAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" P : ProductSoldAction_execute() 호출");
		
		// 1. JSP 페이지에서 판매완료 처리할 상품의 id를 전달
		int productId =Integer.parseInt(request.getParameter("product_id"));
		HttpSession session =  request.getSession();
		
		// 세션정보 제어(로그인)
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
		if(id == null ) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		/*
		 *  차단 사용자 세션제어 시작
		 */
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(id);
		boolean blocked = mdto.getBlocked();
		if(blocked == true) {
			JSForward.alertAndBack(response, "잘못된 접근입니다!");
		}
		/*
		 *  차단 사용자 세션제어 끝
		 */
		
		// 2. DAO를 이용하여 product 테이블에서 해당 상품을 판매완료 처리
		ProductDAO dao = new ProductDAO();
		int result = dao.productSold(productId);
		
		// 삭제 결과에 따른 페이지 이동(JS)
		if(result == 1) {
			JSForward.alertAndMove(response, "상품 판매 완료 성공!", "./ProductContent.pr?product_id=" + productId);
			return null;
		}else {
			JSForward.alertAndBack(response, "상품 정보 없음");
		return null;
		}
	}
}