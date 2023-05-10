package com.itwillbs.action.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ListDAO;
import com.itwillbs.db.ListDTO;

public class SaleListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println( " SaleListAction_execute() ");
				
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 목록 - DAO : getSaleList()
		ListDAO dao = new ListDAO();
		List<ListDTO>saleList = dao.getSaleList(id);
		
		//request 영역에 저장
		request.setAttribute("saleList", saleList);
		System.out.println(saleList);
		
		// 연결된 view에 출력
<<<<<<< HEAD
		forward.setPath("./mypage/saleList.jsp");
=======
		forward.setPath("./mypage/SaleList.jsp");
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
		forward.setRedirect(false);
		System.out.println(forward);
		
		return forward;
	}
	
}