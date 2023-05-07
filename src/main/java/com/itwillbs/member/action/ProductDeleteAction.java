package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.member.db.ProductDAO;

public class ProductDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("P : ProductDeleteAction_execute()");
        //세션정보 제어(로그인)
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");

        ActionForward forward = new ActionForward();

        if(id == null) {
            forward.setPath("./MemberLogin.me");
            forward.setRedirect(true);
            return forward;
        }

        int productId = Integer.parseInt(request.getParameter("product_id"));

        ProductDAO dao = new ProductDAO();
        int result = dao.productDelete(productId);

        System.out.println("P : Product delete result - " + result);
        
		// 삭제 결과에 따른 페이지 이동(JS)
        if(result == -1) {
            JSForward.alertAndBack(response, "상품 정보 없음(삭제불가)");
            return null;
        }

        JSForward.alertAndMove(response, "상품 정보 삭제 성공!", "./ProductList.me");
        return null;
    }
    
    
    
}