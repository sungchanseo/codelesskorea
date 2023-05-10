package com.itwillbs.action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ProductDAO;
import com.itwillbs.db.ProductDTO;

public class ProductContentAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("P : ProductContentAction_execute() 호출");

	// 상세 페이지를 보기 위해 상품번호를 가져옴
	int productId = Integer.parseInt(request.getParameter("product_id"));
	System.out.println("상품번호 : "+productId);
	// DAO 객체 생성
	// 상세 정보 가져오기
	ProductDAO dao = new ProductDAO();
	ProductDTO product = dao.productContent(productId);

	// 상세 정보 request에 저장
	request.setAttribute("product", product);
	System.out.println(product.toString());

	// 페이지 이동
	ActionForward forward = new ActionForward();
	forward.setPath("./product/productContent.jsp");
	forward.setRedirect(false);

	System.out.println("P : 정보 조회 저장, 처리 끝");
	return forward;
	}
}