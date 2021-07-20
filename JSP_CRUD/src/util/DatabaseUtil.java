package util;

import java.sql.DriverManager;

import java.sql.Connection;

public class DatabaseUtil {
	
	public static Connection getConnection() { 
		try { 
			String dburl = "jdbc:mysql://sql6.freemysqlhosting.net/sql6426589?useUnicode=true&characterEncoding=UTF-8";
			String dbUser = "sql6426589";
			String dbpasswd = "3WqUgcMasZ";
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection  connect = DriverManager.getConnection(dburl, dbUser, dbpasswd);
			return connect; 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return null; 
	}
}
