package com.itwillbs.chat.action;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.ChatDAO;
import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

public class ChatUnreadAction implements Action {
//	private static final long serialVersionUID = 1L;
   
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : ChatListAction_execute() 실행");
		
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("id");
		if(userID == null || userID.equals("")) {
			response.getWriter().write("0");
		} else {
			HttpSession session = request.getSession();
			if(!URLDecoder.decode(userID, "UTF-8").equals((String) session.getAttribute("id"))) {
				response.getWriter().write("");
				return null;
			}
			response.getWriter().write(new ChatDAO().getAllUnreadChat(userID) + "");
		}
		return null;
	}
	

}