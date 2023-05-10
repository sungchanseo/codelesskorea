package com.itwillbs.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/**
 * faq 기능과 관련된 객체
 * faq  쓰기, 삭제,수정 읽기 등 기능을 가진다. 
 * @author 성찬스키
 *
 */
public class FaqDAO {
	// 공통변수 선언
	
	private Connection con = null;			// DB 연결정보 저장(관리)
	private PreparedStatement pstmt = null;	// SQL 작성, 실행
	private ResultSet rs = null;			// select결과 데이터 저장
	private String sql = "";				// SQL구문 저장
	
	// DB 연결 메서드
	private Connection getCon() throws Exception {
		// Context 객체생성
		Context initCTX = new InitialContext();
		// DB 연결정보 로드
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/class7_230118_team1");
		// DB 연결
		con = ds.getConnection();
		System.out.println(" DAO : DB 연결 성공! " + con);
		return con;	
	}
	
	// 자원해제
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();		
			if(con != null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//자주묻는질문 사항 글쓰기 FaqWrite()메소드 시작
		public int faqWrite(FaqDTO dto) {
			int result = -1;
			try {
				con = getCon();
				int bno=0;
				
				sql = "select max(faq_id) from Faq";
				pstmt = con.prepareStatement(sql);

				rs= pstmt.executeQuery();

				if(rs.next()){
					bno = rs.getInt(1)+1;
					System.out.println("참");
				}
				System.out.println("bno: "+bno);

				sql = "insert into faq (faq_id, title, category, content) "
						+ " values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, bno);
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getCategory());
				pstmt.setString(4, dto.getContent());
				
				result= pstmt.executeUpdate();
				System.out.println("자주묻는질문 쓰기 완료");
			} catch (Exception e) {
				result =0;
				e.printStackTrace();
			} finally {
				closeDB();
				result=-1;
			}
			return result;
		}	//자주묻는질문 사항 글쓰기 FaqWrite()메소드 끝

		
		//페이징 처리 - getFaqCount()메소드 시작
			public int getFaqCount() {
				int result=0;
				try {
					con = getCon();
					System.out.println("디비연결, 드라이버 로드 성공");
					
					sql = "select count(*) from faq";
					pstmt = con.prepareStatement(sql);
					
					//sql문 실행
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						result = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				return result;
			}
			//getBoradCount()메소드 끝
			
			//페이징처리 - 자주묻는질문 리스트를 불러오는 getFaqList()메소드 시작
			public List<FaqDTO> getFaqList(int startRow, int pageSize) {
				
				List<FaqDTO> faqList = new ArrayList<FaqDTO>();
				
				try {
					con = getCon();
					sql = "select * from faq by faq_id desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, startRow-1);
					pstmt.setInt(2, pageSize);
					rs = pstmt.executeQuery();
					// DB정보(rs) -> DTO -> list
					while (rs.next()) {
						FaqDTO dto = new FaqDTO();
						
						dto.setFaq_id(rs.getInt("faq_id"));
						dto.setContent(rs.getString("content"));
						dto.setCategory(rs.getString("category"));
						dto.setTitle(rs.getString("title"));
						
						faqList.add(dto);
					}
					
					System.out.println(" DAO : 자주묻는질문 조회성공! ");
					System.out.println(" DAO : 질문목록 수 " + faqList.size());
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return faqList;		
		}//자주묻는질문 리스트를 불러오는 getFaqList()메소드 시작
			
			//자주묻는질문 리스트의 자주묻는질문 글을 불러오는 getFaqContent()메소드 시작
			public FaqDTO getFaqContent(String faq_id) {
				
				FaqDTO dto = new FaqDTO();
				
				try {
					con = getCon();
					sql = "select * from faq where faq_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, faq_id);
					
					rs = pstmt.executeQuery();
					// DB정보(rs) -> DTO -> list
					while (rs.next()) {
						dto.setFaq_id(rs.getInt("faq_id"));
					}
					System.out.println(" DAO : 자주묻는 질문 조회 조회성공! ");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return dto;
			}//자주묻는질문 리스트의 자주묻는질문 글을 불러오는 getFaqContent()메소드 시작
		
			//조회수를 올리는 updateCount()메소드 시작
			public void updateReadCount(String faq_id) {
				//디비 연결
				try {
					con = getCon();
					sql = "update faq set count=count+1 where faq_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, faq_id);
					
					int cnt= pstmt.executeUpdate();
					if(cnt==1) {
						System.out.println("조회수가 1 증가했습니다");
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
			}//조회수를 올리는 updateCount()메소드 끝
			
			
			
			//updateFaq() 자주묻는질문 글 수정하는 메소드 시작
			public int updateFaq(FaqDTO dto) {
				int result = -1;
				try {
					con = getCon();
					sql = "select * from faq where faq_id=?";
					pstmt = con.prepareStatement(sql);
					int faq_id = dto.getFaq_id();
					
					pstmt.setInt(1, dto.getFaq_id());
					rs = pstmt.executeQuery();
					
					if(rs.next()){ 
						if(faq_id==rs.getInt("faq_id")){
						
							sql = "update faq set title=?, content=? where faq_id=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setString(1, dto.getTitle());
							pstmt.setString(2, dto.getContent());
							pstmt.setInt(3, dto.getFaq_id());
							
							result = pstmt.executeUpdate();
							System.out.println("자주묻는질문 업데이트 성공!");
						}
					}
				} catch (Exception e) {
					result= 0;
					e.printStackTrace();
				} finally {
					result =-1;
					closeDB();
				}
				return result;
			}//updateFaq()자주묻는질문 수정하는 메소드 시작
			
			//deleteFaq() 자주묻는질문 삭제하는 메소드 시작
			public int deleteFaq(FaqDTO dto) {
				int result = -1;
				
				try {
					con = getCon();
					sql = "select * from faq where faq_id=?";
					pstmt = con.prepareStatement(sql);
					int faq_id = dto.getFaq_id();
					
					pstmt.setInt(1, dto.getFaq_id());
					rs= pstmt.executeQuery();
					
					if(rs.next()) {
							sql = "delete from faq where faq_id=?";
							pstmt = con.prepareStatement(sql);
							
							pstmt.setInt(1, faq_id);
							
							result = pstmt.executeUpdate();
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return result;
			}
			
			//deleteFaq() 자주묻는질문 글을 삭제하는 메소드 끝
			
			
	
			
}