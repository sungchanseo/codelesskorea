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

				//주문등록하기
				public OrderDTO addOrder(String id, int product_id) {
					System.out.println("addOrder 시작");
					OrderDTO dto = null;
					int order_id = 0; //주문번호
					
					

					//주문번호 계산시 사용
					//Calendar new로 객체생성은 할 수 없고 getInstance()로 만들어져있는 객체를 가져와다가 활용해야한다 
					//이를 싱글톤패턴이라고 부른다
//					java.util.Calendar cal = java.util.Calendar.getInstance(); //시스템날짜
//					//날짜 정보를 포맷
//					java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMdd"); //예시20200917

					try{
						getCon();
						
						// 주문테이블(class7_230118_team1) 번호 계산하기
						sql = "select max(order_id) from orderr";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next()){
							order_id = rs.getInt(1)+1;
//							dto= new OrderDTO();
						}
						System.out.println("order_id= "+order_id);
						// 구매자 관련 정보 가져오기
						sql = "select * from user where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						
						// 5. 데이터 처리
						if(rs.next()) {
							dto = new OrderDTO();
							dto.setName(rs.getString("name"));
							dto.setAddress(rs.getString("address"));
							dto.setAddress2(rs.getString("address2"));
							dto.setPhone_number(rs.getString("phone_number"));
							dto.setPost_number(rs.getInt("post_number"));
							System.out.println(rs.getInt("post_number"));
						}// if
						
						System.out.println("DAO : 구매자 회원정보 dto에 저장 완료");
						
						sql="insert into orderr(order_id,receiver_name,receiver_phone,receiver_addr1,receiver_addr2,receiver_post) "
								+ " values(?,?,?,?,?,?)";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, order_id);
						pstmt.setString(2, dto.getName());
						pstmt.setString(3, dto.getPhone_number());
						pstmt.setString(4, dto.getAddress());
						pstmt.setString(5, dto.getAddress2());
						pstmt.setInt(6, dto.getPost_number());
						
						
						pstmt.executeUpdate();
						System.out.println(" DAO : 배송 정보 자동 입력 성공! ");	
						
						// 구매자 관련 정보 가져오기
						sql = "select * from orderr where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, order_id);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						
						// 5. 데이터 처리
						if(rs.next()) {
							dto.setOrder_id(order_id);
							dto.setId(id);
							dto.setReceiver_name(rs.getString("receiver_name"));
							dto.setReceiver_phone(rs.getString("receiver_phone"));
							dto.setReceiver_addr1(rs.getString("receiver_addr1"));
							dto.setReceiver_addr2(rs.getString("receiver_addr2"));
							dto.setReceiver_post(rs.getInt("receiver_post"));
						}
						// 상품 정보 가져오기
						sql = "select * from product where product_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, product_id);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						
						// 5. 데이터 처리
						if(rs.next()) {
//							dto = new OrderDTO();
							dto.setProduct_id(product_id);
							dto.setPrice(rs.getInt("price"));
							dto.setTitle(rs.getString("title"));
							dto.setFee(rs.getInt("fee"));
							dto.setCharge(rs.getInt("charge"));
						}
						
						System.out.println("dto : "+dto);
						System.out.println("DAO : 배송지 정보 dto에 저장 완료");
						
						// 구매할 상품정보(product_id)가 session에 넘어와야 추가가능
						// addOrder(String id, int product_id) 로 수정해줘야함
//						sql = "select * from product where product_id=?";
//						pstmt = con.prepareStatement(sql);
//						pstmt.setInt(1, product_id);
//						// 4. sql 실행
//						rs = pstmt.executeQuery();
//						
//						// 5. 데이터 처리
//						if(rs.next()) {
//							dto = new OrderDTO();
//							dto.setTitle(rs.getString("title"));
//							dto.setPrice(rs.getInt("price"));
//							dto.setFee(rs.getInt("fee"));
//						}// if
//						
//						System.out.println("DAO : 상품 정보 저장 완료");
						
						
						
//						

						//전달정보 사용해서 데이터베이스에 추가
						
//						{
//							sql = "insert into orderr values(?,?,?,?,?,"
//									+ "?,?,?,?,?,"
//									+ "?,?,?,?,?,"
//									+ "?,now(),?,now(),?)";
//							// 디비 순서 확인하기
//							pstmt = con.prepareStatement(sql);
//							pstmt.setInt(1, order_id); // 주문번호
//							pstmt.setString(2, dto.getName()); //구매자
//							pstmt.setInt(3, dto.getProduct_id()); //상품 번호
//							pstmt.setString(4, dto.getTitle()); //상품 이름
//							pstmt.setInt(5, dto.getPrice()); // 상품 가격
//
//							pstmt.setInt(6, dto.getFee()); //배송비
//							pstmt.setString(7, dto.getPhone_number());
//							pstmt.setString(8, dto.getAddress());
//							pstmt.setInt(9, dto.getPost_number());
//							pstmt.setString(10, dto.getReceiver_post());
//							
//
//							// 상품의 금액 + 배송비
//							pstmt.setInt(11, dto.getPrice()+dto.getFee());
//
//							pstmt.setString(17, ""); //운송번호 : 추후 운송장번호가 나오면 관리자가 기입
//							pstmt.setInt(18, 0);//주문상태 : 추후 상태에 맞춰서 관리자가 변경함
//
//							pstmt.executeUpdate();
//
//							order_id++; //일련번호를 증가시킴
//							//한 사람의 장바구니에 있는 모든 주문을 입력하기 전까지 계속해서 1씩 증가시킴
//							//유저가 바뀌는 경우  sql구문(max(o_num))이 시작번호를 계산한다
//						}		
//						System.out.println("DAO: 주문성공");
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
						// 3. sql & pstmt
						sql = "select * from orderr where order_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, dto.getOrder_id());
						// 4. sql 실행
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
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return dto;
				}	// 배송지 변경 메서드
				
	
		// 주문서 보기 (order_id를 기준으로 가져온다)
		public OrderDTO getOrderContent(OrderDTO dto) {
			
			//1.2. 디비 연결
			try {
				con = getCon();
				
				// 주문일시 추가
				sql = "update orderr set order_date=? where order_id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getOrder_date());
				pstmt.setInt(2, dto.getOrder_id());
				// 배송지 변경 버튼 이용하지 않고, 파라미터 받아서 한번에 배송정보 수정할 경우.
//				pstmt.setString(2, dto.getReceiver_name());
//				pstmt.setString(3, dto.getReceiver_phone());
//				pstmt.setString(4, dto.getReceiver_addr1());
//				pstmt.setString(5, dto.getReceiver_addr2());
//				pstmt.setInt(6, dto.getReceiver_post());
				
				pstmt.executeUpdate();
				
				
				
				// 3. sql & pstmt
				sql = "select * from orderr where order_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getOrder_id());
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				
				if(rs.next()) {
					dto.setOrder_id(dto.getOrder_id());
//					dto.setName(rs.getString("name"));
//					dto.setId(rs.getString("id"));
//					dto.setProduct_id(rs.getInt("product_id"));
//					dto.setTitle(rs.getString("title"));
//					dto.setPrice(rs.getInt("price"));
//					dto.setFee(rs.getInt("fee"));
					
					dto.setPaid_amount(dto.getPaid_amount());
					dto.setReceiver_name(rs.getString("receiver_name"));
					dto.setReceiver_addr1(rs.getString("receiver_addr1"));
					dto.setReceiver_addr2(rs.getString("receiver_addr2"));
					dto.setReceiver_post(rs.getInt("receiver_post"));
					dto.setReceiver_phone(rs.getString("receiver_phone"));
				}// if
				
				// 3. sql & pstmt
				sql = "select * from product where product_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getProduct_id());
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				
				if(rs.next()) {
//					dto.setOrder_id(dto.getProduct_id());
//					dto.setName(rs.getString("name"));
//					dto.setId(rs.getString("id"));
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setTitle(rs.getString("title"));
					dto.setPrice(rs.getInt("price"));
					dto.setFee(rs.getInt("fee"));
				}// if
				
				// 3. sql & pstmt
				sql = "select * from user where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				
				if(rs.next()) {
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
//					dto.setProduct_id(rs.getInt("product_id"));
//					dto.setTitle(rs.getString("title"));
//					dto.setPrice(rs.getInt("price"));
//					dto.setFee(rs.getInt("fee"));
				}// if
				System.out.println("DAO : 주문서 정보 저장 완료 : ("+dto+")");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return dto;
		}
		
	
	}