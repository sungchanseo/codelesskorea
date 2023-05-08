package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

@WebServlet("*.qn")
public class QnaController extends HttpServlet{
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이지 정보 전달방식에 상관없이 한번에 처리하는 메서드
		System.out.println("doProcess() 호출!");
		
		/*********1. 가상주소 계산*************/
		System.out.println("1. 가상주소 계산 - 시작");
		
		String requestURI = request.getRequestURI();
		System.out.println("requestURI : " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("ctxPath :" + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("command : " + command);
		
		System.out.println(" 1. 가상주소 계산 - 끝");
		/*********1. 가상주소 계산*************/
		
		/*********2. 가상주소 매핑*************/
		System.out.println();
		System.out.println(" 2. 가상주소 매핑 - 시작");
		
		Action action = null;
		ActionForward forward = null;
		
		// QNA
		if (command.equals("/QNAList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/QNAWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaWrite.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/QNAReWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaReWrite.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/QNAContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaContent.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/QNADelete.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaDelete.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/QNAUpdate.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./qna/qnaUpdate.jsp");
			forward.setRedirect(false);
		}

		
		
		
		System.out.println(" 2. 가상주소 매핑 - 끝");
		/*********2. 가상주소 매핑*************/
		
		/*********3. 가상주소 이동*************/
		System.out.println(" 3. 가상주소 이동 - 시작 ");
		if(forward != null) { // 이동정보가 있을 때
			
			// 페이지 이동방식 - true
			if(forward.isRedirect()) {
				System.out.println(" C : sendRedirect방식 - " + forward.getPath() + "이동");
				response.sendRedirect(forward.getPath());
			}else {	// 페이지 이동방식 - false
				System.out.println(" C : forward방식 - " + forward.getPath() + "이동");
				
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
			
		}
		
		System.out.println(" 3. 가상주소 이동 - 끝 ");
		/*********3. 가상주소 이동*************/
		System.out.println(" doProcess - 끝(컨트롤러 종료) ");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() 호출!");
		doProcess(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST() 호출!");
		doProcess(request, response);
	}

}
