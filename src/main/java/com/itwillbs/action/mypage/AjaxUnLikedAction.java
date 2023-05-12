package com.itwillbs.action.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.LikeDAO;

public class AjaxUnLikedAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getParameter("id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		System.out.println("id"+id);
		System.out.println("product_id"+product_id);
		
		LikeDAO ldao = new LikeDAO();
		ldao.Likedel(id,product_id);
		ldao.Likecountdel(product_id);
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": true}");
        out.close();
		return null;
	}

}
