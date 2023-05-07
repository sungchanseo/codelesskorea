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
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLogout.me")) {
			System.out.println(" C : Logout.me 호출");
			System.out.println(" C : 처리작업, 페이지 이동O (패턴2)");
			
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
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
				forward = action.execute(request, response);
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
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberUpdate.me")) {
			System.out.println(" C : MemberUpdate.me 호출");
			System.out.println(" C : DB사용 O, view이동&출력 (패턴3)");
			
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/MemberUpdateProAction.me")) {
			System.out.println(" C : MemberUpdateProAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동 (패턴2)");
			
			action = new MemberUpdateProAction();
			try {
				forward = action.execute(request, response);
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
				forward = action.execute(request, response);
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
				forward = action.execute(request, response);
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
		
		/*
		 * 
		 * 창희노비치 코드
		 * 
		 * 
		 * 상품기능구현 시작
		 */
		// 상품
		// 상품
		else if(command.equals("/ProductList.me")) {
			System.out.println(" C : /ProductList.me 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동(패턴2)");

			action = new ProductListAction(); 
			try { 
				forward  = action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}else if (command.equals("/ProductWrite.me")) {
			System.out.println(" C : /ProductWrite.me 실행");
			System.out.println(" C : DB사용 X, view페이지로 이동O (패턴1)");

			forward = new ActionForward();
			forward.setPath("./product/productWrite.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/ProductWriteAction.me")) {
			System.out.println(" C : ProductWriteAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴2)");

			action = new ProductWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ProductContent.me")) {
			System.out.println(" C : ProductContent.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴3)");
			action = new ProductContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
		
		/*
		 * 창희노비치 코드 끝
		 * 
		 * 
		 * 
		 * 
		 */
		
		
		
		//주문하기
		else if (command.equals("/OrderContent.me")) {
			//임시 이동 코드
			forward = new ActionForward();
			forward.setPath("./order/orderContent.jsp");
			forward.setRedirect(false);
		}
		
		else if (command.equals("/OrderWrite.me")) {
			System.out.println("C : ./OrderWrite.me 호출");
			
			// OrderWriteAction() 객체 생성
			action = new OrderWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
			/*
			 * 공지리스트 보기로 이동
			 * noticeListAcion으로 가서 먼저 처리한 다음에 페이지 이동처리를 해야 한다.
			 * DB사용 O, view 페이지 출력 O(패턴3) 
			 */
			action = new NoticeListAction();
			
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/NoticeWrite.me")) {
			//임시 이동 코드
			/*
			 * 공지사항 글쓰기 메소드 
			 * DB사용 X, 페이지 이동O(패턴1)
			 */
			forward = new ActionForward();
			forward.setPath("./notice/noticeWrite.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/NoticeWriteAction.me")) {
			/*
			 * 공지사항 글쓰고 업데이트 하는 모델로 이동
			 * DB사용 O, 페이지 이동(패턴2)
			 */
			action = new NoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/NoticeContent.me")) {
			//임시 이동 코드
			/*
			 * 게시판 글을 눌렀을 때 해당 글 페이지로 이동하는 동작
			 * DB사용 O, 페이지출력(패턴3)
			 */
			
			action = new NoticeContentAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/NoticeProUpdateAction.me")) {
			//임시 이동 코드
			/*
			 * 공지글 불러오기 액션(model)으로 이동하기 전 액션
			 * 공지글보기(view) -> 공지글불러오기(model) -> 공지글수정양식(view) -> 공지글업데이트(model) -> 공지글보기(view) 
			 * DB사용 O, 페지이 이동O, view페이지 출력 O(패턴3) 
			 */
			action= new NoticeProUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/NoticeUpdateAction.me")) {
			//임시 이동 코드
			/*
			 * noticeUpdate.jsp페이지에서 공지사항 수정을 완료하면 정보를 전달받아 
			 * 수정하는 액션으로 이동. 해당 페이지에서 수정을 업데이트하고 noticeList로 이동한다. 
			 * DB사용 O, 페이지 이동 O (패턴2)
			 */
			action = new NoticeUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (command.equals("/NoticeDelete.me")) {
			//임시 이동 코드
			/*
			 * 공지사항 게시글 삭제 주소로 이동
			 * 삭제 액션페이지로 이동, 해당 페이지에서 삭제를 완료하고 noticeList페이지로 이동한다.  
			 * DB사용 O, 페이지이동 O (패턴2)
			 */
			action = new NoticeDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/*
		 * 
		 * 
		 * qna성찬스키 코드
		 *
		 */
		
		// FAQ
		else if (command.equals("/FAQList.me")) {
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
		
		
		/*
		 * 
		 * 
		 * qna성찬스키 코드
		 *
		 */
		
		
		
		/*
		 * 
		 * 
		 * 소연스키 코드
		 */
		
		// 구매목록
		else if (command.equals("/Buylist.me")) {
			System.out.println(" C : /BuyList.me 호출 ");

			action = new BuyListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 판매목록
		else if(command.equals("/SaleList.me")) {
			System.out.println(" C : /SaleList.me 호출 ");

			action = new SaleListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 찜목록
		else if(command.equals(".LikeList.me")) {
			System.out.println(" C : /Likelist.me 호출");

			action = new LikeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		/*
		 * 
		 * 
		 * 소연스키 코드
		 */
		
		
		
		
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
		
		/*
		 * 
		 * 
		 * 
		 * 진우행님 채팅 코드~~~
		 */
		//채팅
		else if (command.equals("/ChatToSeller.me")) {
			System.out.println(" C : /ChatToSeller.me 실행");
			System.out.println(" C : DB사용 X, view페이지로 이동O (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./chat/chat.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/ChatSubmitAction.me")) {
			System.out.println(" C : ChatSubmitAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴3)");

			action = new ChatSubmitAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ChatListAction.me")) {
			System.out.println(" C : ChatListAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴3)");

			action = new ChatListAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/ChatUnreadAction.me")) {
			System.out.println(" C : ChatUnreadAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴3)");

			action = new ChatUnreadAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ChatBox.me")) {
			System.out.println(" C : /ChatBox.me 실행");
			System.out.println(" C : DB사용 X, view페이지로 이동O (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./chat/box.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/ChatBoxAction.me")) {
			System.out.println(" C : ChatBoxAction.me 호출");
			System.out.println(" C : DB사용 O, 페이지 이동O (패턴3)");

			action = new ChatBoxAction();
			try {
				forward = action.excute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		/*
		 * 
		 * 
		 * 
		 * 진우행님 채팅 코드~~~
		 */
		
		
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
