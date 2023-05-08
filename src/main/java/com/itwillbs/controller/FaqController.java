package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.action.faq.FaqListAction;
import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
@WebServlet("*.fa")
public class FaqController extends HttpServlet{
	
	
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
		
		// FAQ
		if (command.equals("/FAQList.me")) {
			/*
			 * 공지리스트 보기로 이동
			 * noticeListAcion으로 가서 먼저 처리한 다음에 페이지 이동처리를 해야 한다.
			 * DB사용 O, view 페이지 출력 O(패턴3) 
			 */
			action = new FaqListAction();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/FAQWrite.me")) {
			/*
			 * 자주묻는 질문 글쓰기 페이지 
			 * DB사용 X, 페이지 이동O(패턴1)
			 */
			forward = new ActionForward();
			forward.setPath("./qna/qnaWrite.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/FAQContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./faq/faqContent.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/FAQDelete.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./faq/faqDelete.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/FAQUpdate.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./faq/faqUpdate.jsp");
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
