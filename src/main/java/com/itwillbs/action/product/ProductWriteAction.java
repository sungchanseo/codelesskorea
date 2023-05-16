package com.itwillbs.action.product;

import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.commons.Action;
import com.itwillbs.commons.ActionForward;
import com.itwillbs.db.ProductDAO;
import com.itwillbs.db.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

//상품등록 처리(인코딩, 정보저장, DB연결, 페이지 이동)
public class ProductWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" P : ProductInsertAction_execute() 실행");
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 파일업로드 + 상품정보(파라메터)
		
		// 업로드 폴더(가상경로)
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/upload/product");// 서버의 주소
		int maxSize = 10 * 1024 * 1024; // 5MB
		System.out.println(" M : "+realPath);
		
		// 파일업로드
		MultipartRequest multi 
		    = new MultipartRequest(
		    		request,
		    		realPath,
		    		maxSize,
		    		"UTF-8",
		    		new DefaultFileRenamePolicy());
		
		System.out.println(" M : 상품 파일 업로드 성공! ");
		

		
		// 전달된 정보 저장 ProductDTO 객체 저장
		ProductDTO dto = new ProductDTO();
		dto.setTitle(multi.getParameter("title"));
		dto.setModel(multi.getParameter("model"));
		dto.setParts(multi.getParameter("parts"));
		dto.setContent(multi.getParameter("content"));
		dto.setPrice(Integer.parseInt(multi.getParameter("price")));
		dto.setGrade(Integer.parseInt(multi.getParameter("grade")));
		dto.setCity(multi.getParameter("city"));
		dto.setMethod(Integer.parseInt(multi.getParameter("method")));
		dto.setCharge(Integer.parseInt(multi.getParameter("charge")));
		dto.setFee(Integer.parseInt(multi.getParameter("fee")));
		dto.setUser_id(multi.getParameter("user_id"));
		dto.setReg_date(new Date(System.currentTimeMillis()));

		System.out.println(" P : " + dto);
		
		String product_image = multi.getFilesystemName("product_image1");
		product_image += ","+multi.getFilesystemName("product_image2");
		product_image += ","+multi.getFilesystemName("product_image3");
		product_image += ","+multi.getFilesystemName("product_image4");
		product_image += ","+multi.getFilesystemName("product_image5");
		
		System.out.println(" M : product_image : "+product_image);
		dto.setProduct_image(product_image);
		
		// ProductDAO 객체 생성
		ProductDAO dao = new ProductDAO();
		// 상품등록 메서드
		dao.productWrite(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductList.pr");
		forward.setRedirect(true);
		
		System.out.println(" P : 상품 등록 완료! 상품 리스트 페이지 이동 ");
		
		return forward;
	}
}
