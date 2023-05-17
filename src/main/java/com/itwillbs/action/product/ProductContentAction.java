package com.itwillbs.action.product;

import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	ProductDAO dao = new ProductDAO();	// DAO 객체 생성
	ProductDTO product = dao.productContent(productId);// 상세 정보 가져오기
	
	// 조회수 증가
	dao.updateReadcount(productId);
	
	// 상세 정보 request에 저장
	request.setAttribute("product", product);
	System.out.println(product.toString());
	
	//브랜드,모델,컬러 변환
	int brandId = product.getBrand();
	int modelId = product.getModel();
	int colorId = product.getColor();
	String brandName = dao.getBrandName(brandId); // brandId를 사용하여 브랜드 이름 조회
	String modelName = dao.getModelName(modelId); // modelId를 사용하여 브랜드 이름 조회
	String colorName = dao.getColorName(colorId); // colorId를 사용하여 브랜드 이름 조회
	System.out.println("브랜드 이름: " + brandName);
	System.out.println("모델 이름: " + modelName);
	System.out.println("컬러 이름: " + colorName);
	
	// 액션 페이지에서 세션에 데이터 저장
	HttpSession session = request.getSession();
	session.setAttribute("brandName", brandName);
	session.setAttribute("modelName", modelName);
	session.setAttribute("colorName", colorName);
	
	// 페이지 이동
	ActionForward forward = new ActionForward();
	forward.setPath("./product/productContent.jsp");
	forward.setRedirect(false);

	System.out.println("P : 정보 조회 저장, 처리 끝");
	return forward;
	}
}