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
		System.out.println(" P : ProductUpdateAction_execute() 실행");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// ProductDTO 객체
		ProductDTO dto = new ProductDTO();
		// 전달된 정보 저장
		
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
		dto.setReg_date(new Date(System.currentTimeMillis()));

		System.out.println(" P : " + dto);
		
		// ProductDAO 객체 생성
		ProductDAO dao = new ProductDAO();
		// 상품수정 메서드
//		dao.productUpdate(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.me");
		forward.setRedirect(true);
		
		System.out.println(" P : 데이터 처리완료! 리스트 페이지 이동 ");
		
		return forward;
	}
}
