package com.itwillbs.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

/**
 *  컨트롤러 : 서블릿 구현
 *    Model-View 연결동작 처리
 */

public class MemberFrontController extends HttpServlet {

	//http://localhost:8088/MVC7/member
	//http://localhost:8088/MVC7/member.me
	//http://localhost:8088/Test/Main.me
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 페이지 정보 전달방식에 상관없이 한번에 처리하는 메서드
		System.out.println("doProcess() 호출!");
		
		// URL : http://localhost:8088/MVC7/itwill.me
		// URI : /MVC7/itwill.me
		
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
		
		// 회원가입-./MemberJoin.me
		if(command.equals("/MemberJoin.me")) {
			System.out.println(" C : /MemberJoin.me실행 ");
			System.out.println(" C : DB사용x, view페이지 이동(패턴1)");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);			
		}
		// 회원가입-./MemberJoinAction.me
		else if(command.equals("/MemberJoinAction.me")) {
			System.out.println(" C : /MemberJoinAction.me 호출 ");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴2)");
			
			// MemberJoinAction 객체 생성
			//MemberJoinAction joinAction = new MemberJoinAction(); 
			action = new MemberJoinAction(); 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//로그인페이지로
		else if(command.equals("/MemberLogin.me")) { // 로그인-정보 입력
			System.out.println(" C : /MemberLogin.me 호출 ");
			System.out.println(" C : DB사용 x, view페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);		
		}
	     //로그인기능
		  else if(command.equals("/MemberLoginAction.me")) {
		  System.out.println(" C : /MemberLoginAction.me 호출 ");
		  System.out.println(" C : DB사용o, 페이지 이동(패턴2)");
		  
		    action = new MemberLoginAction(); 
		    try { 
		    	forward  = action.execute(request, response); 
		    } catch (Exception e) {
		    	 e.printStackTrace(); 
		    }
		    }
		 //메인으로
		else if(command.equals("/Main.me")) {
			System.out.println(" C : /Main.me 호출 ");
			System.out.println(" C : DB사용x, view페이지 이동(패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);
		}
		
		//로그아웃
		else if(command.equals("/MemberLogout.me")) {
			System.out.println(" C : ./MemberLogout.me 호출 ");
			System.out.println(" C : 처리작업, 페이지 이동(패턴2)");
			
			// MemberLogoutAction() 객체
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//아이디찾기 페이지로
		else if(command.equals("/IdFind.me")) {
			System.out.println(" C : /IdFind.me 호출 ");
			System.out.println(" C : DB사용x, view페이지 이동(패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/idFindForm.jsp");
			forward.setRedirect(false);
		}
		
		//아이디찾기 처리
		  else if(command.equals("/IdFindAction.me")) {
		  System.out.println(" C : /IdFindAction.me 호출 ");
		  System.out.println(" C : DB사용o, 페이지 이동(패턴2)");
		  
		    action = new IdFindAction(); 
		    try { 
		    	forward  = action.execute(request, response); 
		    } catch (Exception e) {
		    	 e.printStackTrace(); 
		    }
		    }
		
		//비번찾기 페이지로
		  else if(command.equals("/PwFind.me")) {
		  System.out.println(" C : /PwFind.me 호출 ");
		  System.out.println(" C : DB사용x, view페이지 이동(패턴1)");
		  
		  forward = new ActionForward();
		  forward.setPath("./member/pwFindForm.jsp");
		  forward.setRedirect(false);
		    
		    }
		
		//비밀번호찾기 처리
		  else if(command.equals("/PwFindAction.me")) {
		  System.out.println(" C : /PwFindAction.me 호출 ");
		  System.out.println(" C : DB사용o, 페이지 이동(패턴2)");
		  
		    action = new PwFindAction(); 
		    try { 
		    	forward  = action.execute(request, response); 
		    } catch (Exception e) {
		    	 e.printStackTrace(); 
		    }
		    }
		
		//비번재설정 페이지로
		  else if(command.equals("/PwReset.me")) {
		  System.out.println(" C : /PwReset.me 호출 ");
		  System.out.println(" C : DB사용x, view페이지 이동(패턴1)");
		  
		  forward = new ActionForward();
		  forward.setPath("./member/pwResetForm.jsp");
		  forward.setRedirect(false);
		    
		    }
		
		
		
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
	}// doProcess
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() 호출!");
		doProcess(request, response);		
	}
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST() 호출!");
		doProcess(request, response);
	}

}
