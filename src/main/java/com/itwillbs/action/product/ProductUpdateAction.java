package com.itwillbs.action.product;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ProductDAO;
import com.itwillbs.db.ProductDTO;

public class ProductUpdateAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" P : ProductUpdateAction_execute() 호출");
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		// 1. JSP 페이지에서 수정할 상품의 id를 전달
		int productId = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("상품번호 : "+productId);
		
		// 기존의 회원정보를 가져오기 (DB)
		ProductDAO dao = new ProductDAO();
		ProductDTO product = dao.productContent(productId);

		//	System.out.println(dto);
		
		// 상세 정보 request에 저장
		request.setAttribute("product", product);
		System.out.println(product.toString());
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		// ./member/updateForm.jsp 출력
		forward.setPath("./product/productUpdate.jsp");
		forward.setRedirect(false);
		
		System.out.println("P : 정보 조회 저장, 처리 끝");
		return forward;
	}
}