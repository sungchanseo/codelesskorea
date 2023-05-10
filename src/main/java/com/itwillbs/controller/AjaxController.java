package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.itwillbs.action.member.AjaxAction;
=======
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
import com.itwillbs.action.member.AjaxBlockedAction;
import com.itwillbs.action.member.AjaxNickAction;
import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

@WebServlet("*.aj")
public class AjaxController extends HttpServlet {

	//http://localhost:8088/JQuery7/Ajax.ta
	//http://localhost:8088/JQuery7/AjaxAction.ta
	
	@Override
	protected void doGet(HttpServletRequest request,
			  HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" TestAjaxController _doGet");
		
		/**********************1. 가상주소 계산****************************/
		System.out.println(" 1. 가상주소 계산 - 시작 ");
		
		String requestURI = request.getRequestURI();
		System.out.println(" requestURI : "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" ctxPath : "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" command : "+command);
		
		System.out.println(" 1. 가상주소 계산 - 끝 ");
		/**********************1. 가상주소 계산****************************/
		
		/**********************2. 가상주소 매핑****************************/
		System.out.println("\n");
		System.out.println(" 2. 가상주소 매핑 - 시작 ");
		
		Action action = null;
		ActionForward forward = null;
		
		
<<<<<<< HEAD
		if(command.equals("/AjaxNickAction.aj")) {
=======
		if(command.equals("/AjaxNickAction.ta")) {
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
			action = new AjaxNickAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// ./AjaxBlockedAction.ta
		
<<<<<<< HEAD
		else if(command.equals("/AjaxBlockedAction.aj")) {
=======
		else if(command.equals("/AjaxBlockedAction.ta")) {
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
			action = new AjaxBlockedAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
<<<<<<< HEAD
		
		// ./AjaxAction.ta (아이디중복체크)
		else if(command.equals("/AjaxAction.aj")) {
			action = new AjaxAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
=======
>>>>>>> ed8d0e633a9d3a9b4d5f403ff8a9da74a6fb6166
		System.out.println(" 2. 가상주소 매핑 - 끝 ");
		System.out.println("\n");
		/**********************2. 가상주소 매핑****************************/
		
		/**********************3. 가상주소 이동****************************/
		System.out.println(" 3. 가상주소 이동 - 시작 ");
		if(forward != null) { //이동정보가 있을때
			if(forward.isRedirect()) {
				// 페이지 이동방식 - true
				System.out.println(" C : sendRedirect방식 - "+forward.getPath()+"이동");
				response.sendRedirect(forward.getPath());
			}else {							
				// 페이지 이동방식 - false
				System.out.println(" C : forward방식 - "+forward.getPath()+"이동");
				RequestDispatcher dis = 
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}			
		}		
		System.out.println(" 3. 가상주소 이동 - 끝 ");
		/**********************3. 가상주소 이동****************************/
		
		System.out.println(" doProcess - 끝(컨트롤러 종료) ");
	}
	
	

}