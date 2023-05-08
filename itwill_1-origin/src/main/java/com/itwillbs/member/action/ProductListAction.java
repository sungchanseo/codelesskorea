package com.itwillbs.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.member.db.ProductDAO;
import com.itwillbs.member.db.ProductDTO;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("P : ProductListAction_execute() 호출");
		
		// ProductDAO 객체 생성
		ProductDAO pdao = new ProductDAO();
		
		// 상품 정보 가져오기
		List<ProductDTO> productList = pdao.getProductList();
		
		// request 객체에 저장
		request.setAttribute("productList", productList);
		System.out.println(productList.size());
		
		// 연결된 view에 출력(./product/productList.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./product/productList.jsp");
		forward.setRedirect(false);
		System.out.println(forward);
		return forward;
	}

}