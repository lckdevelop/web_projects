package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import domain.Gongji;
import domain.Reserve;

public class ReserveDao {
	
	public static void main(String[] args) {
		ReserveDao reserveDao = new ReserveDao();
		reserveDao.createTable();
	}
	
	public Connection connector() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/koposw01", "root", "9683");

		return conn;
	}
	
	public void createTable() {
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();
			
			stmt.execute("create table reserve(name varchar(20), resvDate date not null,"
					+ "room int not null, addr varchar(100), telnum varchar(20), inName varchar(20),"
					+ "comment text, writeDate date, processing int,"
					+ "primary key(resvDate, room))"
					+ "default charset=utf8");
			
			stmt.close();
			conn.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}		
	}
	
	public String selectOne(String resvDate, int room) {
		Reserve reserve = new Reserve();
		String name = "";

		try {
			Connection conn = connector();

			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery(
					"select name from reserve where resvDate='" + reserve.getResvDate() + "' and room=" + room);

			while (rset.next()) {
				name = rset.getString(1);
			}

			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return name;
	}
	
	public List<Reserve> select() {
		List<Reserve> reserveList = new ArrayList<>();
		
		try {
			Connection conn = connector();

			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select name, resvDate, room from reserve");

			while (rset.next()) {
				Reserve reserve = new Reserve();

				reserve.setName(rset.getString(1));
				reserve.setResvDate(rset.getString(2));
				reserve.setRoom(rset.getInt(3));
				
				reserveList.add(reserve);
			}

			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reserveList;
	}
	
	public Reserve selectAll(String date, int room) {
		Reserve reserve = new Reserve();
		
		try {
			Connection conn = connector();

			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select * from reserve where resvDate = '" + date + "' and room= " + room);

			
			while (rset.next()) {
				reserve.setName(rset.getString(1));
				reserve.setResvDate(rset.getString(2));
				reserve.setRoom(rset.getInt(3));
				reserve.setAddr(rset.getString(4));
				reserve.setTelnum(rset.getString(5));
				reserve.setInName(rset.getString(6));
				reserve.setComment(rset.getString(7));
				reserve.setWriteDate(rset.getString(8));
				reserve.setProcessing(rset.getInt(9));				
			}
			stmt.close();
			conn.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return reserve;
	}
	
	public int selectOverLap(String originDate, int originRoom) {
		int overLap = 0;

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery(
					"select count(*) from reserve where room = " + originRoom + " and resvDate = '" + originDate + "'");

			while (rset.next()) {
				overLap = rset.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return overLap;
	}
	
	public void insert(Reserve reserve) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		long currentTime = System.currentTimeMillis();
		String writeDate = format.format(currentTime);
		
		
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();
			
			stmt.execute("insert into reserve (name, resvDate, room, addr, telnum, inName, comment, writeDate, processing) values " 
			+ "('" + reserve.getName() + "', '" + reserve.getResvDate() + "', '" + reserve.getRoom() + "', '" + reserve.getAddr() + "', '"
			+ reserve.getTelnum() + "', '" + reserve.getInName() + "', '" + reserve.getComment() + "', '" + writeDate + "', 0)");
			
			stmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Reserve reserve, String originDate, int originRoom) {
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();
			
			stmt.execute("update reserve set name = '" + reserve.getName() + "', resvDate = '" + reserve.getResvDate() + "', room = "
					+ reserve.getRoom() + ", addr = '" + reserve.getAddr() + "', telnum = '" + reserve.getTelnum() + "', inName = '"
					+ reserve.getInName() + "', comment = '" + reserve.getComment() + "', writeDate = '" + reserve.getWriteDate() + "', processing= "
					+ reserve.getProcessing() + " where resvDate = '" + originDate + "' and room = " + originRoom);
			
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
	}
	
	public void delete(Reserve reserve) {
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();
			
			int room = reserve.getRoom();
			String resvDate = reserve.getResvDate();
			
			stmt.execute("delete from reserve where room = " + room + " and resvDate = '" + resvDate + "'");
			
			stmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
