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

public class ListDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비 연결 메서드
	private Connection getCon() throws Exception{
		Context initCTX = new InitialContext();
		DataSource ds
			= (DataSource) initCTX.lookup("java:comp/env/jdbc/class7_230118_team1");
		// 디비연결
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공! " +con);
		
		return con;
	} // 디비 연결 메서드
	
	// 자원해제
	public void closeDB( ) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null)  pstmt.close();
			if(con != null)  con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 구매목록 조회 - dao.getBuyList()
	public List<ListDTO> getBuyList(String id){
		List<ListDTO> buyList = new ArrayList<ListDTO>();
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select * from MYPAGE WHERE id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// DB정보(rs) -> DTO -> list
			while (rs.next()) {
				ListDTO dto = new ListDTO();
				
				dto.setProduct_id(rs.getInt("product_id"));
				dto.setUser_id(rs.getInt("user_id"));
				dto.setLike_id(rs.getInt("like_id"));
				dto.setOrder_status(rs.getInt("order_status"));
				dto.setOrder_id(rs.getInt("order_id"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPrice(rs.getInt("price"));
				dto.setSeller_id(rs.getString("seller_id"));
				dto.setOrder_date(rs.getDate("order_date"));
				
				// 상품별 링크 정보 설정
				// 현재는 product_id 값을 받아 해당 페이지로 이동하게 설정해두었고 이후 적절한 컬럼으로 수정하면 됩니다
			    String productId = rs.getString("product_id");
			    String productLink = "https://www.naver.com/" + productId;
			    dto.setProductLink(productLink);
			    
			    // 주문서별 링크 정보 설정
			    String orderId = rs.getString("order_id");
			    String orderLink = "https://www.naver.com/" + orderId;
			    dto.setOrderLink(orderLink);
			    
								
				buyList.add(dto);
				System.out.println(" ListDAO : 구매목록 조회성공! "+ dto);
				
			    
			} // while
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return buyList;
	}
	// 구매목록 조회 - dao.getBuyList()
	
	// 판매목록 조회 - dao.getSaleList()
		public List<ListDTO> getSaleList(String id){
			List<ListDTO> SaleList = new ArrayList<ListDTO>();
			
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql & pstmt
				sql = "select * from MYPAGE WHERE id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리
				// DB정보(rs) -> DTO -> list
				while (rs.next()) {
					ListDTO dto = new ListDTO();
					
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setUser_id(rs.getInt("user_id"));
					dto.setLike_id(rs.getInt("like_id"));
					dto.setOrder_status(rs.getInt("order_status"));
					dto.setOrder_id(rs.getInt("order_id"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setPrice(rs.getInt("price"));
					dto.setBuyer_id(rs.getString("buyer_id"));
					dto.setOrder_date(rs.getDate("order_date"));
					
					// 상품별 링크 정보 설정
					// 현재는 product_id 값을 받아 해당 페이지로 이동하게 설정해두었고 이후 적절한 컬럼으로 수정하면 됩니다
				    String productId = rs.getString("product_id");
				    String productLink = "https://www.naver.com/" + productId;
				    dto.setProductLink(productLink);
				    
//				    // 주문서번호별 링크 정보 설정
//				    현재는 하나의 페이지로 통일했으나 주문서번호별 링크로 수정해야 합니다
//				    String orderId = rs.getString("order_id");
//				    String orderLink = "https://www.naver.com/" + orderId;
//				    dto.setOrderLink(orderLink);
				    
									
				    SaleList.add(dto);
					System.out.println(" ListDAO : 판매목록 조회성공! "+ dto);
					
				    
				} // while
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return SaleList;
		}
		// 판매목록 조회 - dao.SaleList()

		// 찜목록 조회 - dao.LikeList()
		public List<ListDTO> getLikeList(String id){
			List<ListDTO> LikeList = new ArrayList<ListDTO>();
			
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql & pstmt
				sql = "select * from MYPAGE WHERE product_id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "product_id");
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터 처리
				// DB정보(rs) -> DTO -> list
				while (rs.next()) {
					ListDTO dto = new ListDTO();
					
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setUser_id(rs.getInt("user_id"));
					dto.setLike_id(rs.getInt("like_id"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setPrice(rs.getInt("price"));
					
					// 상품별 링크 정보 설정
					// 현재는 product_id 값을 받아 해당 페이지로 이동하게 설정해두었고 이후 적절한 컬럼으로 수정하면 됩니다
				    String productId = rs.getString("product_id");
				    String productLink = "https://www.naver.com/" + productId;
				    dto.setProductLink(productLink);
				    
//				    // 주문서번호별 링크 정보 설정
//				    현재는 하나의 페이지로 통일했으나 주문서번호별 링크로 수정해야 합니다
//				    String orderId = rs.getString("order_id");
//				    String orderLink = "https://www.naver.com/" + orderId;
//				    dto.setOrderLink(orderLink);
				    
									
				    LikeList.add(dto);
					System.out.println(" LikeDAO : 판매목록 조회성공! "+ dto);
					
				    
				} // while
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return LikeList;
		}
		// 찜목록 조회 - dao.LikeList()
		
		// 찜한 상품 개수 - dao.getLikeCount()
		public int getLikeCount(){
			int cnt = 0;
			try{
				getCon();
				sql="select count(like_id) from mypage";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				System.out.println("DAO: DB에 저장된 찜의 수 "+cnt);
			} catch(Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
			return cnt;
		}
		// 찜한 상품 개수 - dao.getLikeCount()

	

}