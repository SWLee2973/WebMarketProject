package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Board;

//싱글톤
public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		if(instance == null) instance = new BoardDAO();
		return instance;
	}
	//db연결객체 얻기
	public Connection getConnection() {
		Connection con = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/WebMarketDB");
			con = ds.getConnection();
			
		} catch(Exception e) { e.printStackTrace(); }
		return con;
	}
	
	public int getListCount(String items, String text) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		if((items == null && text == null) || (items.isEmpty() && text.isEmpty()))
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where " + items + " like '%" + text + "%'"; 
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("getListCount() 오류");
			e.printStackTrace(); 
			}
		return count;
	}
	
	public List<Board> getBoardList(int pageNum, int limit, String items, String text){
		List<Board> boardList = new ArrayList<Board>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//전체 게시글 건수
		int total_record = getListCount(items, text);
		int start = (pageNum - 1) * limit;
		int index = start + 1; //시작 페이지
		String sql = "";
		//검색조건이 없는 경우
		//검색조건과 검색어가 빈 문자열로 넘어오는 경우 추가
		if((items == null && text == null) || (items.isEmpty() && text.isEmpty()))
			sql = "select * from board order by num desc limit " + start + " ," + limit;
		else 
			sql = "select * from board where " + items + " like '%"
									+ text + "%' order by num desc limit " + start + ", " + limit;
									
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				
				boardList.add(board);
				
				//
				if(index < start + limit && index <= total_record)
					index++;
				else break;
			}
		} catch(Exception e) {
			System.out.println("getBoardList() 오류");
			e.printStackTrace();
		} finally {
			try {
				rs.close(); pstmt.close(); con.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return boardList;
	}
	
	public void insertBoard(Board board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into board(id, name, subject, content, regist_day, ip) values(?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getRegist_day());
			pstmt.setString(6, board.getIp());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//글번호에 해당하는 게시물 정보 얻기
	public Board getBoard(int num, int pageNum) {
		//조회건당 1씩 증가하는 메소드
		updateBoardHitCount(num);
		Board board = new Board();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setName(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setRegist_day(rs.getString(6));
				board.setHit(rs.getInt(7));
				board.setIp(rs.getString(8));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	public void updateBoardHitCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update board set hit=hit+1 where num=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void updateBoard(Board board) {
		Connection con=null;
	    PreparedStatement pstmt=null;
	       String sql="update board set name=?, subject=?, content=? where num=?";
	       try {
	    	       con=getConnection();
	    	       con.setAutoCommit(false);//수동 커밋 처리
	    	       pstmt=con.prepareStatement(sql);
	    	       pstmt.setString(1, board.getName());
	    	       pstmt.setString(2, board.getSubject());
	    	       pstmt.setString(3, board.getContent());
	    	       pstmt.setInt(4, board.getNum());
	    	       pstmt.executeUpdate();
	               con.commit();//커밋 완료
	       }catch(Exception e) {
	    	   try {
				con.rollback();//오류발생시 rollback처리
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
	    	   e.printStackTrace();
	       }finally {
	    	   try {
				con.setAutoCommit(true);//자동 커밋으로 처리
			} catch (SQLException e) {
				e.printStackTrace();
			}
	       }
		
	}

	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from board where num=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
