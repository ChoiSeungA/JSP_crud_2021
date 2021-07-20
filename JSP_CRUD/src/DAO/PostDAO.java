package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Post;
import util.DatabaseUtil;

public class PostDAO {
	
	Connection conn = DatabaseUtil.getConnection();
	
	public int write(String title, String content) {
		
		System.out.println("in DAO..");
		System.out.println(title);
		System.out.println(content);
		
		String sql = "INSERT INTO post (title, content, user_id) VALUES (?, ?, 1)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
		
	}
	
	public ArrayList<Post> read() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post";
		ArrayList<Post> posts = new ArrayList<Post>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt(1));
				post.setTitle(rs.getString(2));
				post.setContent(rs.getString(3));
				post.setReg_date(rs.getTimestamp(4));
				post.setUser_id(rs.getInt(5));
				
				posts.add(post);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return posts;
		
	}
	
	public Post readById(int id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM post WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Post p = new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setReg_date(rs.getTimestamp(4));
				p.setUser_id(rs.getInt(5));
				
				return p;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return null;
	}
	
	
	public int update(int id, String title, String content) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE post set title=?, content=? WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
						
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return -1;	// db 오류
	}
	
	
	public int delete(int id) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "DELETE FROM post WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
						
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return -1;	// db 오류
	}
}
