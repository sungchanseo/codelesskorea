package com.itwillbs.action.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ListDAO;
import com.itwillbs.db.ListDTO;

public class AdminsaleListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		System.out.println(id);
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 목록 - DAO : getBuyList()
		ListDAO dao = new ListDAO();
		List<ListDTO>saleList = dao.getSaleList(id);
		
		//request 영역에 저장
		request.setAttribute("saleList", saleList);
		request.setAttribute("id", id);
		System.out.println(saleList);
		
		// 연결된 view에 출력
		forward.setPath("./mypage/adminsaleList.jsp");
		forward.setRedirect(false);
		System.out.println(forward);
		
		return forward;
		

	}

}
