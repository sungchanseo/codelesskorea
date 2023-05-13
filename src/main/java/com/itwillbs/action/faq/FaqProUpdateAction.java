package com.itwillbs.action.faq;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.MemberDAO;
import com.itwillbs.db.FaqDAO;
import com.itwillbs.db.FaqDTO;
/**
 * 수정 전 처리 페이지 
 * 공지사항 업데이트를 하기 위해서 디비에서 정보를 불러오는 페이지 
 * 해당 페이지의 기능은 디비에서 정보를 불러와 수정페이지에 출력한다. 
 * @author YURAN
 *
 */
public class FaqProUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : FaqProUpdateAction_execute()메소드 호출!");
		
		ActionForward forward = new ActionForward();
		
//		계정정보가 없을 떄 
//		if(id == null) {
//			forward.setPath("./MemberLogin.me");
//			forward.setRedirect(false);
//			return forward;
//		}
		
		
	    String pageNum = request.getParameter("pageNum");
		String faq_id = request.getParameter("faq_id");
		System.out.println("글번호 "+faq_id+"페이지 번호 "+pageNum);
		
		FaqDAO dao = new FaqDAO();
		FaqDTO dto = dao.getFaqContent(faq_id);
		System.out.println("M : FAQ 정보 불러오기 완료!");
		
		System.out.println("FAQ업데이트프로 액션의 "+dto);
		//정보 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
				
		//저장한 정보를 ./member/updateForm.jps에서  출력
		forward.setPath("./faq/faqUpdate.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}

}
