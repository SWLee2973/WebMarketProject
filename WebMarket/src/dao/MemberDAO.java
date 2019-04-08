package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Member;

public class MemberDAO {
	private static MemberDAO instance;
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		if(instance==null) instance = new MemberDAO();
		return instance;
	}
	
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
	
	public Member getNameById(Member member) {
		Member m = new Member();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select name from member where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			if(rs.next())
				m.setName(rs.getString(1));
		} catch(Exception e) {
			System.out.println("getNameById() 오류");
			e.printStackTrace(); 
			}
		return m;
	}
}
