package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import domain.Admin;

public class AdminDao {
	Admin admin = new Admin();
	
	public Connection connector() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/koposw01", "root", "9683");

		return conn;
	}
	
	public Admin selectOne(String id, String passwd) {		
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();
						
			ResultSet rset = stmt.executeQuery("select * from adminfo where id = '" + id + "' and pass = '" + passwd + "'");
			
			if (rset != null) {
				while(rset.next()) {
					admin.setId(rset.getString(1));
					admin.setPasswd(rset.getString(2));
				}
			}
			stmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
}
