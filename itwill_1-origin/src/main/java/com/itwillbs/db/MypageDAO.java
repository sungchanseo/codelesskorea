package com.itwillbs.db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.db.BoardDTO;
import com.itwillbs.commons.JSForward;
import com.itwillbs.db.MemberDTO;

public class MypageDAO {
	
	// 공통변수 선언
	private Connection con = null;  		//디비 연결정보 저장(관리)
	private PreparedStatement pstmt = null; //SQL 작성, 실행
	private ResultSet rs = null; 			//select결과 데이터 저장
	private String sql ="";					//SQL구문 저장

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
	}

	
	// 자원해제
	public void closeDB() {
		try {
			if(rs != null)  rs.close();
			if(pstmt != null)  pstmt.close();
			if(con != null)  con.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} //closeDB() 메서드끝
	
	
	// insertQNABoard() - QNA 글 작성 메서드
	public int insertQNABoard(QnADTO qdto){
		int result = 0;
		int bno = 0;

		try {
			getCon(); // con 인스턴스 변수에 저장완료
			// 글번호 계산
			sql = "select max(bno) from QNA";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bno = rs.getInt(1)+1; //인덱스 사용 호출
				//rs.getInt("max(bno)"); // 컬럼명 사용 호출
			}
			
//						qna_id int AUTO_INCREMENT PRIMARY KEY,
//					    bno int Not NULL,
//						user_id int UNIQUE KEY,
//						product_id int UNIQUE KEY,
//						qna_category varchar(20) DEFAULT NULL,
//						title varchar(20) DEFAULT NULL,
//						regdate datetime DEFAULT NULL,
//						content varchar(500),
//					    image	varchar(1000),
//						re_ref INT NULL,
//						re_lev INT NULL,
//						re_seq INT NULL,
//					    readcount INT NULL
			
			
			MemberDTO member = new MemberDTO();
			System.out.println("DAO : 글번호 "+bno);
			sql ="insert into QNA(bno,title,content,regdate,image,re_ref,re_lev,re_seq,id,nickname,qna_category,isanswered) "
					+ "values(?,?,?,now(),?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno); // 글번호
			pstmt.setString(2, qdto.getTitle()); //제목
			pstmt.setString(3, qdto.getContent()); //내용
			pstmt.setString(4, qdto.getImage()); //사진
//			pstmt.setInt(5, 0); //조회수 0 
			pstmt.setInt(5, bno); // 일반글 == re_ref
			pstmt.setInt(6, 0); // 일반글 lev = 0
			pstmt.setInt(7, 0); // 일반글 seq = 0
//			pstmt.setInt(9, dto.getUserID()); // user_id
			pstmt.setString(8, qdto.getId()); // id
			pstmt.setString(9, qdto.getNickname()); // id
			pstmt.setString(10, qdto.getQnaCategory());
			pstmt.setBoolean(11, qdto.isIs_answered());
			// 실행			
			result = pstmt.executeUpdate();
			System.out.println("DAO : 글쓰기 완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//end of insertBoard
	
	// getBoardCount() 
	public int getBoardCount(){
		int cnt = 0;
		try{
			getCon();
			sql="select count(*) from QNA";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			System.out.println("DAO: DB에 저장된 글의 수 "+cnt);
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		return cnt;
	}// getBoardCount() 
	
	// UsergetBoardCount() 
	public int UsergetBoardCount(String id){
		int cnt = 0;
		try{
			getCon();
			sql="select count(*) from QNA where id=? or id='admin@gmail.com'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1);
			}
			System.out.println("DAO: DB에 저장된 글의 수 "+cnt);
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		return cnt;
	}// getBoardCount() 
	
	
	
//    ArrayList boardList = dao.getBoardList(startRow, pageSize);	
	
	public List<QnADTO> UsergetBoardList(String id, int startRow, int pageSize) {
		List<QnADTO> boardList = new ArrayList<QnADTO>();
		try{
			con = getCon();
			sql="SELECT a.* FROM qna a JOIN qna b ON a.re_ref = b.re_ref WHERE b.id =? order by re_ref desc, re_seq asc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); //유저
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				QnADTO qdto = new QnADTO();
				qdto.setUserID(rs.getInt("user_id"));
				qdto.setBno(rs.getInt("bno"));
				qdto.setTitle(rs.getString("title"));
				qdto.setContent(rs.getString("content"));
				qdto.setRegdate(rs.getDate("regdate"));
				qdto.setImage(rs.getString("image"));
				qdto.setRe_Lev(rs.getInt("re_lev"));
				qdto.setRe_Ref(rs.getInt("re_ref"));
				qdto.setRe_Seq(rs.getInt("re_seq"));
				qdto.setId(rs.getString("id"));
				qdto.setNickname(rs.getString("nickname"));
				qdto.setQnaCategory(rs.getString("qna_category"));
				qdto.setIs_answered(rs.getBoolean("isanswered"));
				boardList.add(qdto);
				System.out.println(qdto);
			}
			System.out.println("DAO: 게시글불러오기");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;
	}

	
	public List<QnADTO> getBoardList(int startRow, int pageSize) {
	    List<QnADTO> boardList = new ArrayList<QnADTO>();
	    try {
	        con = getCon();
	        sql = "SELECT * FROM QNA ORDER BY re_ref DESC, re_seq ASC LIMIT ?,?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, startRow - 1);
	        pstmt.setInt(2, pageSize);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            QnADTO qdto = new QnADTO();
	            qdto.setUserID(rs.getInt("user_id"));
	            qdto.setBno(rs.getInt("bno"));
	            qdto.setTitle(rs.getString("title"));
	            qdto.setContent(rs.getString("content"));
	            qdto.setRegdate(rs.getDate("regdate"));
	            qdto.setImage(rs.getString("image"));
	            qdto.setRe_Lev(rs.getInt("re_lev"));
	            qdto.setRe_Ref(rs.getInt("re_ref"));
	            qdto.setRe_Seq(rs.getInt("re_seq"));
	            qdto.setId(rs.getString("id"));
	            qdto.setNickname(rs.getString("nickname"));
	            qdto.setQnaCategory(rs.getString("qna_category"));
	            qdto.setIs_answered(rs.getBoolean("isanswered"));
	            boardList.add(qdto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeDB();
	    }
	    return boardList;
	}
	
	
	
	// reInsertBoard()
	public int reInsertBoard(QnADTO qdto) {
	    // 지역변수 생성
	    int bno = 0;
	    int result = 0;
	    // 디비 연결
	    try {
	        getCon();
	        // sql(게시판의 글번호 중 최댓값 계산) & pstmt
	        // 1. 답글 번호 계산
	        sql = "SELECT MAX(bno) FROM QNA";
	        pstmt = con.prepareStatement(sql);
	        // 실행
	        rs = pstmt.executeQuery();
	        // 데이터 처리
	        if (rs.next()) {
	            bno = rs.getInt(1) + 1;
	        } else {
	            bno = 1;
	        }
	        System.out.println("답글 번호 : " + bno);

	        // 2. 답글 순서 재배치
	        // re_ref(같은 그룹 기준)으로 re_seq값이 기존의 값보다 큰 값이 있을 경우 seq값을 1증가시킴
	        sql = "UPDATE QNA SET re_seq = re_seq + 1 WHERE re_ref = ? AND re_seq > ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, qdto.getRe_Ref());
	        pstmt.setInt(2, qdto.getRe_Seq());

	        // 답글 추가 동작
	        result = pstmt.executeUpdate();
	        if (result >= 1) {
	            System.out.println("DAO : 답글 재배치 완료! seq update 완료");
	        }

	     // 3. 답변 처리상태 변경
	        sql = "UPDATE QNA SET isanswered = true WHERE bno = ? or bno = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, qdto.getRe_Ref()); // 원본 게시글의 번호를 설정합니다.
	        pstmt.setInt(2, bno); // 원본 게시글의 번호를 설정합니다.
	        result = pstmt.executeUpdate();
	        // 4. 답글 삽입
	        sql = "INSERT INTO QNA(bno, title, content, regdate, image, re_ref, re_lev, re_seq, id, nickname, qna_category, isanswered) "
	            + "VALUES (?, ?, ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, bno);
	        pstmt.setString(2, qdto.getTitle());
	        pstmt.setString(3, qdto.getContent());
	        pstmt.setString(4, qdto.getImage());
	        pstmt.setInt(5, qdto.getRe_Ref()); // 일반글 == re_ref
	        pstmt.setInt(6, qdto.getRe_Lev() + 1); // 일반글 lev = 0
	        pstmt.setInt(7, qdto.getRe_Seq() + 1); // 일반글 seq = 0
	        pstmt.setString(8, qdto.getId()); // id
	        pstmt.setString(9, qdto.getNickname()); // nickname
	        pstmt.setString(10, qdto.getQnaCategory());
	        pstmt.setBoolean(11, qdto.isIs_answered());
	        result = pstmt.executeUpdate();

	        System.out.println("DAO : 글쓰기 완료!");
	        System.out.println("답글쓰기 성공");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        closeDB();
	    }
	    return result;
	}//reInsertBoard 닫음
	
	public QnADTO getBoard(int bno) {
		QnADTO qdto = null;
		try {
			getCon();
			sql ="select * from QNA where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				qdto = new QnADTO();
				qdto.setBno(rs.getInt("bno"));
				qdto.setProductId(rs.getInt("product_id"));
				qdto.setContent(rs.getString("content"));
				qdto.setRegdate(rs.getDate("regdate"));
				qdto.setImage(rs.getString("image"));
				qdto.setId(rs.getString("id"));
				qdto.setQnaId(rs.getInt("qna_id"));
				qdto.setTitle(rs.getString("title"));
				qdto.setQnaCategory(rs.getString("qna_category"));
				qdto.setRe_Ref(rs.getInt("re_ref"));
				qdto.setRe_Seq(rs.getInt("re_seq"));
				qdto.setRe_Lev(rs.getInt("re_lev"));
				qdto.setNickname(rs.getString("nickname"));
				qdto.setQnaCategory(rs.getString("qna_category"));
				qdto.setIs_answered(rs.getBoolean("isanswered"));
			}
			System.out.println("DAO: 글정보저장완료");
			System.out.println(qdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		      closeDB();

		}
		return qdto;
	}
	
	
	
	
	
	// 마이페이지 - QNA 수정 updateQNA(QnADTO qdto)
		public int updateQNA(QnADTO qdto){
			int result = -1;  // -1 0 1
			
			try {
				//1.2. 디비연결
				con = getCon();
				sql = "update QNA set title=?,content=? where bno=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, qdto.getTitle());
				pstmt.setString(2, qdto.getContent());
				pstmt.setInt(3, qdto.getBno());
						
				// 4. sql 실행
				result = pstmt.executeUpdate();
				//result = 1;					
				
				System.out.println(" DAO : 글 수정완료! ("+result+")");
				
			}
			catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				closeDB();
			}
			
			return result;
		}
		
		
		// 마이페이지 - QNA 수정 updateQNA(QnADTO qdto)
		public int deleteQNA(int bno) {
		    int result = 0;
		    try {
		        con = getCon();
		        sql = "SELECT re_ref FROM QNA WHERE bno=?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, bno);
		        ResultSet rs = pstmt.executeQuery();
		        if(rs.next()) {
		            int re_ref = rs.getInt("re_ref");
		            sql = "UPDATE QNA SET isanswered=false WHERE bno=?";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, re_ref);
		            result = pstmt.executeUpdate();
		        }
		        sql = "DELETE FROM QNA WHERE re_ref=? OR bno=?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, bno);
		        pstmt.setInt(2, bno);
		        result = pstmt.executeUpdate();
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        closeDB();
		    }
		    return result;
		}
	
}