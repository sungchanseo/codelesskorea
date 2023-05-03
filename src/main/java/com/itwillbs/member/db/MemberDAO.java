package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// DB에 연결해서 처리하는 모든 동작 수행
public class MemberDAO {
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
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mvc7");
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
	
	// 회원가입 - memberJoin()
	public void memberJoin(MemberDTO dto) {
		try {
			// 1.2 DB 연결
			getCon();
			// 3. SQL 작성 & pstmt 객체
			sql = "insert into itwill_member(id,pw,name,gender,age,email,regdate) "
					+ " values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setInt(5, dto.getAge());
			pstmt.setString(6, dto.getEmail());
			pstmt.setDate(7, dto.getRegdate());
			// 4. SQL 실행
			pstmt.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 회원가입 - memberJoin()
	
	// 회원 정보 수정 - memberUpdate(dto);
	public int memberUpdate(MemberDTO dto) {
		int result = -1; // -1 0 1
		try {
			// 1.2 DB 연결
			getCon();
			// 3. SQL 작성 & pstmt 객체
			String sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				System.out.println(dto.getPw());
				System.out.println(rs.getString("pw"));
				// 회원
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 본인(아이디, 비밀번호 동일)
					// 3. sql작성 (update) & pstmt 객체
					// 이름, 나이, 성별 수정
					sql = "update itwill_member set name=?,gender=?,age=? where id=?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getGender());
					pstmt.setInt(3, dto.getAge());
					pstmt.setString(4, dto.getId());
					// 4. SQL 실행(update)
					result = pstmt.executeUpdate();						
				}else {
					// 본인x(아이디만 동일, 비밀번호 다름)
					result = 0;
				}
			}else {
				// 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 회원 정보수정 완료 (" + result + ")");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// 회원 정보 수정 - memberUpdate(dto);
	
	// 로그인 - memberLogin()
	public int memberLogin(MemberDTO dto) {
		int result = -1; 	// 처리결과에 따른 상태 -1 0 1
							// -1(아이디없음)
							// 0(아이디는 있지만 비밀번호 오류)
							// 1(로그인 성공)
		
		try {
			// 1.2 DB 연결
			getCon();
			// 3. sql구문(select) & pstmt 객체
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, dto.getId());
					
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 회원
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 본인
					result = 1;
				}else {
					// 비밀번호 오류
					result = 0;
				}
			} else { //비회원
				result = -1;
			}
			System.out.println(" DAO : 로그인 처리 결과 " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;

	}
	//getMember()
	public MemberDTO getMember(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			// 1.2 DB 연결
			getCon();
			// 3. sql & pstmt
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				dto.setAge(rs.getInt("age"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getDate("regdate"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	//getMember()
	
	//memberDelete()
	public int deleteMember(String id, String pw) {
		int result = -1; // -1 0 1
		try {
			// 1.2 DB 연결
			getCon();
			// 3. SQL 작성 & pstmt 객체
			String sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				System.out.println(pw);
				System.out.println(rs.getString("pw"));
				// 회원
				if(pw.equals(rs.getString("pw"))) {
					// 본인(아이디, 비밀번호 동일)
					// 3. sql작성 (update) & pstmt 객체
					// 회원정보 삭제
					sql = "delete from itwill_member where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					// 4. SQL 실행(update)
					result = pstmt.executeUpdate();						
				}else {
					// 본인x(아이디만 동일, 비밀번호 다름)
					result = 0;
				}
			}else {
				// 비회원
				result = -1;
			}
			
			System.out.println(" DAO : 회원 정보삭제 완료 (" + result + ")");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	//memberDelete()
	
	//getMemberList()
	public List<MemberDTO> getMemberList() {
	
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		try {
			// 1.2. DB연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select * from itwill_member";
//			sql = "select * from itwill_member where id!=admin";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// DB정보(rs) -> DTO -> list
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setAge(rs.getInt("age"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getDate("regdate"));
				
				memberList.add(dto);
			}
			
			System.out.println(" DAO : 회원목록 조회성공! ");
			System.out.println(" DAO : 목록 수 " + memberList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return memberList;		
}
	//getMemberList()
} // DAO
