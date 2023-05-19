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
import com.itwillbs.db.ProductDTO;

public class ProductContentAction implements Action {

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("P : ProductContentAction_execute() 호출");
	
	// 세션정보 제어(로그인)
	HttpSession session =  request.getSession();
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
	if(mdto == null) {
		JSForward.alertAndMove(response, "잘못된 접근입니다!", "./MemberLogin.me");
	}
	boolean blocked = mdto.getBlocked();
	if(blocked == true) {
		JSForward.alertAndBack(response, "잘못된 접근입니다!");
	}
	/*
	 *  차단 사용자 세션제어 끝
	 */
	
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
	
	// 액션 페이지에서 리퀘스트에 데이터 저장
	request.setAttribute("brandName", brandName);
	request.setAttribute("modelName", modelName);
	request.setAttribute("colorName", colorName);
	
	// 페이지 이동
	forward = new ActionForward();
	forward.setPath("./product/productContent.jsp");
	forward.setRedirect(false);

	System.out.println("P : 정보 조회 저장, 처리 끝");
	return forward;
	}
}