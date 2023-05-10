package com.itwillbs.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	// 공통변수 선언
	
		private Connection con = null;	// 디비 연결정보 저장(관리)
		private PreparedStatement pstmt = null; // SQL작성, 실행
		private ResultSet rs = null;    // select결과 데이터 저장
		private String sql ="";			// sql 구문 저장
		
		// 디비 연결 메서드
		private Connection getCon() throws Exception {
			// Context 객체생성
			Context initCTX = new InitialContext();
			// 디비 연결정보 불러와서 사용
			DataSource ds 
					= (DataSource) initCTX.lookup("java:comp/env/jdbc/class7_230118_team1");
			
			con = ds.getConnection();
			System.out.println("DAO : 디비 연결 성공(CP)"+con);
			return con;
		} //getCon()
		
		// 디비 자원해제
			public void closeDB() {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// 
				//주문등록하기
				public OrderDTO addOrder(String id) {
					OrderDTO dto = null;
					int order_id = 0; //주문번호
					try{
						getCon();
						// 주문번호 계산하기
						sql = "select max(order_id) from orderr";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next()){
							order_id = rs.getInt(1)+1;
						}
						System.out.println("주문번호 = "+order_id);
						
						// 구매자 관련 정보 가져오기
						sql = "select * from user where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							dto = new OrderDTO();
							dto.setName(rs.getString("name"));
							dto.setAddress(rs.getString("address"));
							dto.setPhone_number(rs.getString("phone_number"));
//								dto.setPost_number(rs.getInt("post_number")); 
							//우편번호 컬럼이 유저에서 추가되어야 오류가 안남
						} // if
						
						System.out.println("DAO : 구매자 정보 저장 완료");
						
						sql="insert into orderr(order_id,receiver_name,receiver_phone,receiver_addr1,receiver_post) "
								+ " values(?,?,?,?,?)";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, order_id);
						pstmt.setString(2, dto.getName());
						pstmt.setString(3, dto.getPhone_number());
						pstmt.setString(4, dto.getAddress());
						pstmt.setInt(5, dto.getPost_number());
						
						pstmt.executeUpdate();
						System.out.println(" DAO : 배송지 정보 자동 입력 성공! ");	
						
						// 배송지 정보 가져오기
						sql = "select * from orderr where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, order_id);
						// sql 실행
						rs = pstmt.executeQuery();
						
						// 데이터 처리
						if(rs.next()) {
							dto = new OrderDTO();
							dto.setOrder_id(order_id);
							dto.setId(id);
							dto.setReceiver_name(rs.getString("receiver_name"));
							dto.setReceiver_phone(rs.getString("receiver_phone"));
							dto.setReceiver_addr1(rs.getString("receiver_addr1"));
						} // if 
						System.out.println("DAO : 배송지 정보 저장 완료");
						
						
						// 구매할 상품정보(product_id)가 session에 넘어와야 추가가능
						// addOrder(String id, int product_id) 로 수정해줘야함
//							sql = "select * from product where product_id=?";
//							pstmt = con.prepareStatement(sql);
//							pstmt.setInt(1, product_id);
//							// 4. sql 실행
//							rs = pstmt.executeQuery();
//							
//							// 5. 데이터 처리
//							if(rs.next()) {
//								dto = new OrderDTO();
//								dto.setTitle(rs.getString("title"));
//								dto.setPrice(rs.getInt("price"));
//								dto.setFee(rs.getInt("fee"));
//							} // if
//							
//							System.out.println("DAO : 상품 정보 저장 완료");
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return dto;
				}//end of addOrder()
					
				// 배송지 변경 메서드
				public OrderDTO AddrChange(OrderDTO dto) {
					try {
						getCon();
						// sql & pstmt
						sql = "select * from orderr where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getOrder_id());
						// sql 실행
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							sql = "update orderr set receiver_name=?, receiver_phone=?, receiver_addr1=? where order_id=?";
							pstmt = con.prepareStatement(sql);
						
							pstmt.setString(1, dto.getReceiver_name());
							pstmt.setString(2, dto.getReceiver_phone());
							pstmt.setString(3, dto.getReceiver_addr1());
							pstmt.setInt(4, dto.getOrder_id());
							
							pstmt.executeUpdate();
							System.out.println("DAO : 배송지 정보수정 완료 : ("+dto+")");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return dto;
				}	// 배송지 변경 메서드 끝
				
			
				// 주문서 보기 (수정해야함)
				public OrderDTO getOrderContent(String id) {
					OrderDTO dto = null;
					//1.2. 디비 연결
					try {
						con = getCon();
						
						// 3. sql & pstmt
						sql = "select * from orderr o, user u where o.user_id = u.user_id and u.id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						
						// 4. sql 실행
						rs = pstmt.executeQuery();
						
						// 5. 데이터 처리
						
						if(rs.next()) {
							dto = new OrderDTO();
							dto.setName(rs.getString("name"));
							dto.setId(rs.getString("id"));
							dto.setProduct_id(rs.getInt("product_id"));
							dto.setTitle(rs.getString("title"));
							dto.setPrice(rs.getInt("price"));
							dto.setName(rs.getString("name"));
							dto.setAddress(rs.getString("address"));
							dto.setPhone_number(rs.getString("phone_number"));
						}// if
						System.out.println("DAO : 주문서 정보 저장 완료");
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return dto;
				}
				
		
			
			
			
		
		
}