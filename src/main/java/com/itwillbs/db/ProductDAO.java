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

public class ProductDAO {
	
	// 공통변수 선언

		private Connection con = null;			// DB 연결정보 저장(관리)
		private PreparedStatement pstmt = null;	// SQL 작성, 실행
		private ResultSet rs = null;			// select결과 데이터 저장
		private String sql = "";				// SQL구문 저장
	
	// 디비연결에 대한 모든 처리 
	private Connection getCon() throws Exception {
		// 0 - 디비 연결정보 (context.xml)
		// 1 드라이버로드 2 디비연결
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/class7_230118_team1");
		con = ds.getConnection();
		System.out.println(" DAO : 디비 연결 성공(CP) ");
		System.out.println(" DAO : "+con);
		return con;
	}
	
	// DB 자원해제
	private void closeDB() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 상품 등록 - productWrite()
	public void productWrite(ProductDTO dto) {
		try {
			// 1.2 DB 연결
			getCon();
			// 3. SQL 작성 & pstmt 객체
			sql = "insert into product(title,model,parts,content,price,grade,city,method,charge,fee,reg_date) "
					+ " values (?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getModel());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setInt(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			pstmt.setString(7, dto.getParts());
			pstmt.setInt(8, dto.getMethod());
			pstmt.setInt(9, dto.getCharge());
			pstmt.setInt(10, dto.getFee());
			// 4. SQL 실행
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 상품 등록 - productWrite()
	
	public List<ProductDTO> getProductList() {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		try {
			con = getCon();
			sql = "select * from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO product= new ProductDTO();
				product.setProduct_id(rs.getInt("product_id"));
	            product.setTitle(rs.getString("title"));
	            product.setModel(rs.getString("model"));
	            product.setParts(rs.getString("parts"));
	            product.setContent(rs.getString("content"));
	            product.setPrice(rs.getInt("price"));
	            product.setProduct_image(rs.getString("product_image"));
	            product.setGrade(rs.getInt("grade"));
	            product.setCity(rs.getString("city"));
	            product.setMethod(rs.getInt("method"));
	            product.setCharge(rs.getInt("charge"));
	            product.setFee(rs.getInt("fee"));
	            product.setReg_date(rs.getDate("reg_date"));
				
				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return productList;
	}
	
	//productContent()
	public ProductDTO productContent(int product_id) {
	    ProductDTO product = new ProductDTO();
	    try {
	        con = getCon();
	        sql = "select * from product where product_id=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, product_id);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            product = new ProductDTO();
	            product.setProduct_id(rs.getInt("product_id"));
	            product.setTitle(rs.getString("title"));
	            product.setModel(rs.getString("model"));
	            product.setParts(rs.getString("parts"));
	            product.setContent(rs.getString("content"));
	            product.setPrice(rs.getInt("price"));
	            product.setProduct_image(rs.getString("product_image"));
	            product.setGrade(rs.getInt("grade"));
	            product.setCity(rs.getString("city"));
	            product.setMethod(rs.getInt("method"));
	            product.setCharge(rs.getInt("charge"));
	            product.setFee(rs.getInt("fee"));
	            product.setReg_date(rs.getDate("reg_date"));
	            product.setUser_id(rs.getString("user_id"));
	        }
	        
	        System.out.println(" DAO : 상품정보 저장완료! ");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeDB();
	    }
	    return product;
	}//productContent()


	public int productDelete(int product_id) {
		int result = -1; // -1: 상품 정보 없음, 0: 상품 삭제 실패, 1: 상품 삭제 성공
		try {
			// 1.2 DB 연결
			getCon();
			// 3. SQL 작성 & pstmt 객체
			String sql = "select * from product where product_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			// 4. SQL 실행(select)
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if (rs.next()) {
			// 해당 상품 존재
			// 3. SQL 작성 (delete) & pstmt 객체
			sql = "delete from product where product_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			// 4. SQL 실행(delete)
			result = pstmt.executeUpdate();
			} else {
			// 해당 상품이 존재하지 않음
			result = -1;
			}
			System.out.println(" DAO : 상품 정보 삭제 완료 (" + result + ")");
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			closeDB();
			}
			return result;
			}
			// productDelete()

	
	
	
//	 상품 정보 수정 - updateProduct(dto);
//		public int productUpdate(ProductDTO dto) {
//		int result = -1; // -1 0 1
//		try {
		// 1.2 DB 연결
//		getCon();
		// 3. SQL 작성 & pstmt 객체
//		String sql = "select product_id from product where product_id=?";
//		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1, dto.getProduct_id());
		// 4. sql 실행(select)
//		rs = pstmt.executeQuery();
		// 5. 데이터 처리
//		if(rs.next()) {
//		System.out.println(dto.getProduct_id());
//		System.out.println(rs.getInt("product_id"));
		// 상품
//		if(dto.getProduct_id().equals(rs.getInt("product_id"))) {
		// 상품번호 동일 //수정중
		// 3. sql작성 (update) & pstmt 객체
		// 상품명, 가격, 수량 수정
//		sql = "update product set product_id=?,title=?,model=?,content=?,price=? where id=?";
//		pstmt = con.prepareStatement(sql);
		// ???
//		pstmt.setInt(1, dto.getProduct_id());
//		pstmt.setString(2, dto.getTitle());
//		pstmt.setString(3, dto.getModel());
//		pstmt.setString(4, dto.getContent());
//		pstmt.setInt(5, dto.getPrice());
		// 4. SQL 실행(update)
//		result = pstmt.executeUpdate();
//		}else {
//		result = 0;
//		}
//		}else {
		// 비상품
//		result = -1;
//		}
//		System.out.println(" DAO : 상품 정보수정 완료 (" + result + ")");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			closeDB();
//		}
//		return result;
//	}
		
	
}





