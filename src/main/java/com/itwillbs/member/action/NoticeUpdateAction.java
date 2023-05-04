package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : NoticeUpdateAction_execute()메소드 호출!");
			
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
			
		
		
		
		
		
		return forward;
	}

}
