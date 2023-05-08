package com.itwillbs.action.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ListDAO;
import com.itwillbs.db.ListDTO;

public class LikeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" BuyListAction_execute()");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 목록 - DAO : getLikeList()
		ListDAO dao = new ListDAO();
		List<ListDTO>LikeList = dao.getLikeList(id);
		
		//request 영역에 저장
		request.setAttribute("LikeList", LikeList);
		System.out.println(LikeList);
		
		// 연결된 view에 출력
		forward.setPath("./mypage/LikeList.jsp");
		forward.setRedirect(false);
		System.out.println(forward);
		
		return forward;
	}

}