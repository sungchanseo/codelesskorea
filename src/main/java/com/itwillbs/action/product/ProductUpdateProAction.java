package com.itwillbs.action.product;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.ProductDAO;
import com.itwillbs.db.ProductDTO;

public class ProductUpdateProAction  implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberUpdateProAction_execute() 호출");
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		// 전달정보(파라메터) 저장(DTO)
		ProductDTO dto = new ProductDTO();
		
		dto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		dto.setTitle(request.getParameter("title"));
		dto.setModel(request.getParameter("model"));
		dto.setParts(request.getParameter("parts"));
		dto.setContent(request.getParameter("content"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setGrade(Integer.parseInt(request.getParameter("grade")));
		dto.setCity(request.getParameter("city"));
		dto.setMethod(Integer.parseInt(request.getParameter("method")));
		dto.setCharge(Integer.parseInt(request.getParameter("charge")));
		dto.setFee(Integer.parseInt(request.getParameter("fee")));
		dto.setUser_id(request.getParameter("user_id"));
		dto.setReg_date(new Date(System.currentTimeMillis()));
		
		System.out.println(" P : " + dto);
		
		// DAO - 정보수정 메서드 호출 memberUpdate()
		ProductDAO dao = new ProductDAO();
		int result = dao.productUpdate(dto);
		
		System.out.println(" P : 정보 수정결과 " + result);
		// 수정 처리 결과에 따른 페이지 이동 (JS)
		// 삭제 결과에 따른 페이지 이동(JS)
		if(result == 1) {
			JSForward.alertAndMove(response, "상품 수정 성공!", "./ProductList.me");
			return null;
		} else {
			JSForward.alertAndBack(response, "상품 수정 실패");
			return null;
		}
	}
}
