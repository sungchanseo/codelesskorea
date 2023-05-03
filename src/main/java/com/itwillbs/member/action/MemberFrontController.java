package com.itwillbs.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;

/**
 * 컨트롤러 : 서블릿 구현
 * Model-View 연결동작 처리
 *
 */
		// http://localhost:8088/CodeLess/Main.me

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet{
	
	
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

		// 메인페이지
		if(command.equals("/Main.me")) {
		System.out.println(" C : Main.me 호출");
		System.out.println(" C : DB사용 X, 페이지 이동O (패턴1)");
		
		forward = new ActionForward();
		forward.setPath("./main.jsp");
		forward.setRedirect(false);
		}
		
		
		// 로그인처리
		else if(command.equals("/MemberLogin.me")) { 
			System.out.println(" C : /MemberLogin.me 호출");
			System.out.println(" C : DB사용 X, view페이지 이동(패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberLoginAction.me")) {
			System.out.println(" C : MemberLoginAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴2)");
			
			action = new MemberLoginAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			System.out.println(" C : Logout.me 호출");
			System.out.println(" C : 처리작업, 페이지 이동O (패턴2)");
			
			action = new MemberLogoutAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/IdFind.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./member/idFindForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/PwFind.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./member/pwFindForm.jsp");
			forward.setRedirect(false);
		}
		// 회원가입
		else if(command.equals("/MemberJoin.me")) {
				System.out.println(" C : /MemberJoin.me 실행");
				System.out.println(" C : DB사용 X, view페이지로 이동O (패턴1)");
				
	
				forward = new ActionForward();
				forward.setPath("./member/insertForm.jsp");
				forward.setRedirect(false);
		}else if(command.equals("/MemberJoinAction.me")) {
			System.out.println(" C : MemberJoinAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴2)");
			
			action = new MemberJoinAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 마이페이지
		else if(command.equals("/MemberMypage.me")) {
			System.out.println(" C : /MemberMypage.me 실행");
			System.out.println(" C : DB사용 X, view페이지로 이동O (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./mypage/mypage.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberInfo.me")) {
			System.out.println(" C : MemberInfo.me 호출");
			System.out.println(" C : DB사용 O, view이동&출력 (패턴3)");
			
			action = new MemberInfoAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberUpdate.me")) {
			System.out.println(" C : MemberUpdate.me 호출");
			System.out.println(" C : DB사용 O, view이동&출력 (패턴3)");
			
			action = new MemberUpdateAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/MemberUpdateProAction.me")) {
			System.out.println(" C : MemberUpdateProAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동 (패턴2)");
			
			action = new MemberUpdateProAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberDelete.me")) {
			System.out.println(" C : /MemberDelete.me 호출");
			System.out.println(" C : DB사용X, view페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberDeleteAction.me")) {
			System.out.println(" C : /MemberDeleteAction.me 호출");
			System.out.println(" C : DB사용O, 페이지 이동 (패턴2)");

			action = new MemberDeleteAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/PasswordUpdate.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./member/passwordUpdate.jsp");
			forward.setRedirect(false);
			
		}else if (command.equals("/MemberList.me")) {
			System.out.println(" C : /MemberList.me 호출");
			System.out.println(" C : DB사용O, view 페이지 출력 (패턴3)");
			
			action = new MemberListAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/MypagePurchaselist.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./mypage/buyList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/MypageSalesList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./mypage/saleList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/LikeList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./mypage/likeList.jsp");
			forward.setRedirect(false);
//		}else if (command.equals("/MypageQNAList.me")) {
//			//임시 이동 코드
//			forward = new ActionForward();
//			forward.setPath("./qna/qnaList.jsp");
//			forward.setRedirect(false);
//		}else if (command.equals("/MypageQNAList.me")) {
//			//임시 이동 코드
//			forward = new ActionForward();
//			forward.setPath("./qna/qnaList.jsp");
//			forward.setRedirect(false);
		}
		
		
		else if (command.equals("/OrderContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./order/orderContent.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/OrderWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./order/orderWrite.jsp");
			forward.setRedirect(false);
		}
		
		
		
		// 상품
		else if (command.equals("/ProductList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./product/productList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/ProductContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./product/productContent.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/ProductWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./product/productWrite.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/ProductUpdate.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./product/productUpdate.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/ProductDelete.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./product/productDelete.jsp");
			forward.setRedirect(false);
		}
		
		
		// 공지사항
		else if (command.equals("/NoticeList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./notice/noticeList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/NoticeWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./notice/noticeWrite.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/NoticeContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./notice/noticeContent.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/NoticeUpdate.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./notice/noticeUpdate.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/NoticeDelete.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./notice/noticeDelete.jsp");
			forward.setRedirect(false);
		}
		
		// FAQ
		else if (command.equals("/FAQList.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./faq/faqList.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/FAQWrite.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./faq/faqWrite.jsp");
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
		
		// QNA
		else if (command.equals("/QNAList.me")) {
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
