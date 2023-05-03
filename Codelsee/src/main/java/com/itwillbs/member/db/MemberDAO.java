package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con = null;  	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; 			
	private String sql ="";				

	//디비 연결 메서드
	private Connection getCon() throws Exception{
		// Context 객체생성
		Context initCTX = new InitialContext();
		// 디비연결정보 불러와서 사용
		DataSource ds 
		   = (DataSource) initCTX.lookup("java:comp/env/jdbc/class7_230118_team1");
		// 디비연결
		con = ds.getConnection();
		System.out.println(" DAO : 디비연결 성공! "+con);
		
		return con;
	}//디비 연결 메서드
	
	// 자원해제
	public void closeDB() {
		try {
			if(rs != null)  rs.close();
			if(pstmt != null)  pstmt.close();
			if(con != null)  con.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원해제
	
	// 회원가입 - memberJoin()
		public void memberJoin(MemberDTO dto) {
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. SQL작성 & pstmt 객체
				sql = "insert into user(id,password,name,nickname,phone_number,address,user_image,regdate,birth_date) "
						+ "values(?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPassword());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getNickname());
				pstmt.setString(5, dto.getPhone_number());
				pstmt.setString(6, dto.getAddress());
				pstmt.setString(7, dto.getUser_image());
				pstmt.setDate(8, dto.getRegdate());
				pstmt.setString(9, dto.getBirth_date());
				
				// 4. SQL 실행
				pstmt.executeUpdate();
				System.out.println(" DAO : 회원가입 성공! ");			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}		
		}
		// 회원가입 - memberJoin()
		
		public int memberLogin(MemberDTO dto) {
			int result = -1; 
			try {
				con = getCon();
				sql = "select password from user where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(dto.getPassword().equals(rs.getString("password"))) {
						result = 1;
					}else {
						result = 0;
					}
				}else {
					result = -1;
				}
				System.out.println(" DAO : 로그인 처리결과 "+result);
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return result;
		}
		// 로그인 - memberLogin()	
		
		public String idFind(MemberDTO dto) {
			String result = "";
			try {
				con = getCon();
				sql = "select name,id from user where phone_number=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPhone_number());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(dto.getName().equals(rs.getString("name"))) {
						result = rs.getString("id");
					}else {
						result = "none";
					}
				}else {
					result = "none";
				}
				System.out.println(" DAO : 아디찾기 처리결과 "+result);
						
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
			
		}//아이디찾기
		
		public int pwFind(MemberDTO dto,String randomPw) {
			int result = -1;
			try {
				con = getCon();
				sql = "select phone_number from user where id=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getId());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(dto.getPhone_number().equals(rs.getString("phone_number"))) {
						sql="update user set password=? where id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, randomPw);
						pstmt.setString(2, dto.getId());
						pstmt.executeUpdate();
						result = 1;
					}else {
						result = 0;
					}
				}else {
					result = -1;
				}
				System.out.println(" DAO : 비번찾기 처리결과 "+result);
						
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
			
		}//비번찾기
		

	

}//MemberDAO
