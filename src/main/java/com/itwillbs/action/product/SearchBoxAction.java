package com.itwillbs.action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.MemberDTO;
import com.itwillbs.db.ModelDAO;

public class SearchBoxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : SearchBoxAction_execute");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 로그인 세션제어
		ActionForward forward = new ActionForward();
		if(id == null ) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		ModelDAO dao = new ModelDAO();
		JSONArray modelList = dao.getModelList();
		JSONArray colorList = dao.getColorList();
		
		request.setAttribute("modelList", modelList);
		request.setAttribute("colorList", colorList);	
		
		return null;
	}

}
