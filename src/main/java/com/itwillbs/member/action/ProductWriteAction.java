package com.itwillbs.member.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.ProductDAO;
import com.itwillbs.member.db.ProductDTO;

//상품등록 처리(인코딩, 정보저장, DB연결, 페이지 이동)
public class ProductWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" P : ProductInsertAction_execute() 실행");
		
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
		// 상품등록 메서드
		dao.productWrite(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.me");
		forward.setRedirect(true);
		
		System.out.println(" P : 데이터 처리완료! 리스트 페이지 이동 ");
		
		return forward;
	}
}
