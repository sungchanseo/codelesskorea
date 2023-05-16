package com.itwillbs.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



// DB에 연결해서 처리하는 모든 동작 수행
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
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/class7_230118_team1");
	con = ds.getConnection();
		System.out.println("DAO : 디비 연결 성공(CP) : "+con);
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

				// orderWrite() - 주문서 작성
				public OrderDTO orderWrite(OrderDTO dto) {
					System.out.println("DAO : orderWrite 시작");
					int order_id = 0; //주문번호
								
						try {
							con = getCon();
							// 주문번호 계산하기
							sql = "select max(order_id) from orderr";
							pstmt = con.prepareStatement(sql);
							rs = pstmt.executeQuery();
							if(rs.next()){
								order_id = rs.getInt(1)+1;
							}
							dto.setOrder_id(order_id);
							System.out.println("order_id= "+order_id);
						
						// 구매자 관련 정보 가져오기
						sql = "select * from user where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getId());
						// 4. sql 실행
						rs = pstmt.executeQuery();
						
						// 5. 데이터 처리
						if(rs.next()) {
//							dto.setId(dto.getId());
							dto.setName(rs.getString("name"));
							dto.setAddress(rs.getString("address"));
							dto.setAddress2(rs.getString("address2"));
							dto.setPhone_number(rs.getString("phone_number"));
							dto.setPost_number(rs.getInt("post_number"));
						}// if
						
						System.out.println("DAO : 구매자 회원정보 dto에 저장 완료");
						
						// 상품 정보 가져오기
						sql = "select * from product where product_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getProduct_id());
						// sql 실행
						rs = pstmt.executeQuery();
						// 데이터 처리
						if(rs.next()) {
//							dto.setProduct_id(dto.getProduct_id());
							dto.setSeller_id(rs.getString("user_id"));
							dto.setPrice(rs.getInt("price"));
							dto.setTitle(rs.getString("title"));
							dto.setFee(rs.getInt("fee"));
							dto.setCharge(rs.getInt("charge"));
							dto.setProduct_image(rs.getString("product_image"));
						} //if
						System.out.println("DAO : 상품정보 가져오기 완료");
						
						// 주문 번호 등록
						sql = "insert into orderr(order_id,receiver_id,product_id,seller_id,receiver_name,"
								+ " receiver_phone,receiver_post,receiver_addr1,receiver_addr2) "
								+ " values(?, ?, ?, ?,?,?,?,?,?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, order_id);
						pstmt.setString(2, dto.getId());
						pstmt.setInt(3, dto.getProduct_id());
						pstmt.setString(4, dto.getSeller_id());
						pstmt.setString(5, dto.getName());
						pstmt.setString(6, dto.getPhone_number());
						pstmt.setInt(7, dto.getPost_number());
						pstmt.setString(8, dto.getAddress());
						pstmt.setString(9, dto.getAddress2());
						
						pstmt.executeUpdate();
						System.out.println("DAO : orderr 테이블 주문번호, 주문자/판매자 계정, 상품번호 등록 완료");
						
						// 배송지정보 자동저장
						sql = "select * from orderr where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getOrder_id());
						// sql 실행
						rs = pstmt.executeQuery();
						// 데이터 처리
						if(rs.next()) {
							dto.setReceiver_name(rs.getString("receiver_name"));
							dto.setReceiver_addr1(rs.getString("receiver_addr1"));
							dto.setReceiver_addr2(rs.getString("receiver_addr2"));
							dto.setReceiver_post(rs.getInt("receiver_post"));
							dto.setReceiver_phone(rs.getString("receiver_phone"));
						} //if
						System.out.println("DAO : 배송정보 가져오기 완료");
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return dto;
				} // orderWrite() - 주문서 작성
				
				// addOrder(dto) - 결제성공시 주문 저장
				public OrderDTO addOrder(OrderDTO dto) {
					System.out.println("DAO : addOrder 시작");
					try {
						con = getCon();
						
						// 주문번호에 주문정보 저장하기
						sql = "update orderr set paid_amount=?,receiver_name=?,receiver_phone=?,receiver_addr1=?, "
								+ " receiver_addr2=?,receiver_post=?,order_status=?,order_date=? "
								+ " where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, dto.getPaid_amount());
						pstmt.setString(2, dto.getReceiver_name());
						pstmt.setString(3, dto.getReceiver_phone());
						pstmt.setString(4, dto.getReceiver_addr1());
						pstmt.setString(5, dto.getReceiver_addr2());
						pstmt.setInt(6, dto.getReceiver_post());
						pstmt.setString(7, "주문 확인");
//						pstmt.setString(8, dto.getId());
//						pstmt.setString(9, dto.getSeller_id());
						pstmt.setString(8, dto.getOrder_date());
						pstmt.setInt(9, dto.getOrder_id());
						
						pstmt.executeUpdate();
						System.out.println(" DAO : 해당 order_id에 주문정보 저장완료 ");	
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return dto;
					
				}// addOrder(dto) - 결제성공시 주문 저장
				
				
		// 배송지 변경 메서드
				public OrderDTO AddrChange(OrderDTO dto) {
					try {
						getCon();
						// 3. sql & pstmt
						sql = "update orderr set receiver_name=?, receiver_phone=?, receiver_addr1=?, receiver_addr2=?, "
								+ "receiver_post=? where order_id=?";
						pstmt = con.prepareStatement(sql);
					
						pstmt.setString(1, dto.getReceiver_name());
						pstmt.setString(2, dto.getReceiver_phone());
						pstmt.setString(3, dto.getReceiver_addr1());
						pstmt.setString(4, dto.getReceiver_addr2());
						pstmt.setInt(5, dto.getReceiver_post());
						pstmt.setInt(6, dto.getOrder_id());
						
						pstmt.executeUpdate();
						System.out.println("DAO : 배송지 변경 완료 : ("+dto+")");
						
						// 상품 정보 가져오기
						sql = "select * from product where product_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getProduct_id());
						// sql 실행
						rs = pstmt.executeQuery();
						
						// 데이터 처리
						if(rs.next()) {
							dto.setPrice(rs.getInt("price"));
							dto.setTitle(rs.getString("title"));
							dto.setFee(rs.getInt("fee"));
							dto.setCharge(rs.getInt("charge"));
						}
						System.out.println("배송정보+상품정보 dto : "+dto);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return dto;
				}	// 배송지 변경 메서드
				
	
		// getOrderContent() - 주문서 보기
		public OrderDTO getOrderContent(OrderDTO dto) {
			try {
				con = getCon();
				
				sql = "select * from orderr where order_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getOrder_id());
				
				// sql 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()) {
					dto.setOrder_id(dto.getOrder_id());
					
					dto.setPaid_amount(rs.getString("paid_amount"));
					dto.setReceiver_name(rs.getString("receiver_name"));
					dto.setReceiver_addr1(rs.getString("receiver_addr1"));
					dto.setReceiver_addr2(rs.getString("receiver_addr2"));
					dto.setReceiver_post(rs.getInt("receiver_post"));
					dto.setReceiver_phone(rs.getString("receiver_phone"));
					dto.setOrder_status(rs.getString("order_status"));
					dto.setReceiver_id(rs.getString("receiver_id"));
					dto.setSeller_id(rs.getString("seller_id"));
					dto.setTracking_number(rs.getInt("tracking_number"));
				}// if
				
				// 상품정보 가져오기
				sql = "select * from product where product_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getProduct_id());
				
				// sql 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()) {
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setProduct_image(rs.getString("product_image"));
					dto.setTitle(rs.getString("title"));
					dto.setPrice(rs.getInt("price"));
					dto.setFee(rs.getInt("fee"));
				}// if
				System.out.println("DAO : 주문 정보 가져오기 완료");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return dto;
		} // getOrderContent() - 주문서 보기
		
		
		
		
		//getOrderStatus() 주문상태 추가
		public OrderDTO getOrderStatus(OrderDTO dto) {
			try {
				con = getCon();
				int is_accept = dto.getIs_accept();
				// 주문 수락여부 추가
				sql = "update orderr set is_accept=?, order_status=? where order_id=?";
				pstmt = con.prepareStatement(sql);
				
				if(is_accept == 0 || is_accept == 1) {
					pstmt.setInt(1, is_accept);					
				}else {
					pstmt.setInt(1, 1);
				}
				
				if(is_accept == 0) {
					pstmt.setString(2, "주문 취소");
				}else if(is_accept == 1) {
					pstmt.setString(2, "주문 수락");
				}else if(is_accept == 2) {
					pstmt.setString(2, "발송");
				}else if(is_accept == 3) {
					pstmt.setString(2, "주문 확정");
				}
				
				pstmt.setInt(3, dto.getOrder_id());
			
				pstmt.executeUpdate();
				System.out.println("DAO : 주문상태 DB 저장 완료");
				
				// sql & pstmt
				sql = "select * from orderr where order_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getOrder_id());
				
				// sql 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				
				if(rs.next()) {
					dto.setOrder_id(dto.getOrder_id());
					dto.setOrder_status(rs.getString("order_status"));
					dto.setPaid_amount(dto.getPaid_amount());
					dto.setReceiver_name(rs.getString("receiver_name"));
					dto.setReceiver_addr1(rs.getString("receiver_addr1"));
					dto.setReceiver_addr2(rs.getString("receiver_addr2"));
					dto.setReceiver_post(rs.getInt("receiver_post"));
					dto.setReceiver_phone(rs.getString("receiver_phone"));
				}// if
				System.out.println("DAO : 주문상태 DTO 추가 완료");
				
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
			return dto;
	} //getOrderStatus
	
		public OrderDTO trackingNumber(OrderDTO dto) {
			try {
				con = getCon();
				// 주문 수락여부 추가
				sql = "update orderr set tracking_number=?, order_status=? where order_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getTracking_number());					
				pstmt.setString(2, "발송");
				pstmt.setInt(3, dto.getOrder_id());
				pstmt.executeUpdate();
				System.out.println("DAO : 주문상태 DB 저장 완료");
				// sql & pstmt
				sql = "select * from orderr where order_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getOrder_id());
				
				// sql 실행
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()) {
					dto.setOrder_id(dto.getOrder_id());
					dto.setOrder_status(rs.getString("order_status"));
					dto.setPaid_amount(dto.getPaid_amount());
					dto.setReceiver_name(rs.getString("receiver_name"));
					dto.setReceiver_addr1(rs.getString("receiver_addr1"));
					dto.setReceiver_addr2(rs.getString("receiver_addr2"));
					dto.setReceiver_post(rs.getInt("receiver_post"));
					dto.setReceiver_phone(rs.getString("receiver_phone"));
				}// if
				System.out.println("DAO : 주문상태 DTO 추가 완료");
				
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
			return dto;
		}
		
		
		
		
		
}