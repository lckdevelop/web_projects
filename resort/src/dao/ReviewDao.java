package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Gongji;
import domain.Review;

public class ReviewDao {
	private Review gongji = new Review();

	public Connection connector() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/koposw01", "root", "9683");

		return conn;
	}

	// 리뷰테이블 만들기
	public void createTable() throws ClassNotFoundException, SQLException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("create table reviews(id int not null primary key auto_increment, title varchar(70),"
				+ "date date, content text) default charset=utf8");

		stmt.close();
		conn.close();
	}

	// 필드추가
	public void alterTable() throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("alter table reviews add rootid int");
		stmt.execute("alter table reviews add relevel int");
		stmt.execute("alter table reviews add recnt int");
		stmt.execute("alter table reviews add viewcnt int");
		stmt.execute("alter table reviews add file varchar(100)");

		stmt.close();
		conn.close();

	}

	// 리뷰 게시판에 전체 출력하기
	public List<Review> selectGongji_list(int startRow, int endRow) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery(
				"select id, title, viewcnt, date, file, relevel from reviews order by rootid desc, recnt asc limit "
						+ startRow + ", " + endRow);

		List<Review> gongjiList = new ArrayList<>();

		while (rset.next()) {
			Review review = new Review();

			review.setId(rset.getInt(1));
			review.setTitle(rset.getString(2));
			review.setViewcnt(rset.getInt(3));
			review.setDate(rset.getString(4));
			review.setFile(rset.getString(5));
			review.setRelevel(rset.getInt(6));

			gongjiList.add(review);
		}

		stmt.close();
		conn.close();

		return gongjiList;
	}

	// 리뷰 총 개수 
	public int getCount() {
		int count = 0;

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select count(*) from reviews");

			if (rset.next()) {
				count = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 검색 개수 구하기
	public int getfCount(String sel, String find) {
		int fCount = 0; 

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select count(*) from reviews where " + sel + " like '%" + find + "%'");
			if (rset.next()) {
				fCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fCount; 
	}
	
	// 검색해서 나온 리스트 리턴
	public List<Review> getfList(int startRow, int endRow, String sel, String find) throws Exception {
		List<Review> gongji_fList = new ArrayList<>(); 

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select id, title, file, viewcnt, date from reviews where " + sel
					+ " like '%" + find + "%' order by rootid desc, recnt asc limit " + startRow + ", " + endRow);

			while (rset.next()) { 
				Review gongi = new Review();

				gongi.setId(rset.getInt(1));
				gongi.setTitle(rset.getString(2));
				gongi.setFile(rset.getString(3));
				gongi.setViewcnt(rset.getInt(4));
				gongi.setDate(rset.getString(5));

				gongji_fList.add(gongi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gongji_fList;
	}
	
	// id로 리뷰 찾기
	public Review selectOne(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select * from reviews where id = " + id);

		while (rset.next()) {
			gongji.setId(rset.getInt(1));
			gongji.setTitle(rset.getString(2));
			gongji.setDate(rset.getString(3));
			gongji.setContent(rset.getString(4));
			gongji.setRootid(rset.getInt(5));
			gongji.setRelevel(rset.getInt(6));
			gongji.setRecnt(rset.getInt(7));
			gongji.setViewcnt(rset.getInt(8));
			gongji.setFile(rset.getString(9));
		}
		return gongji;
	}

	// 새로운 리뷰 쓰기
	public void newWrite(Review gongji) throws SQLException, ClassNotFoundException {

		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("insert into reviews(title, date, content, rootid, relevel, recnt, viewcnt, file) values('"
				+ gongji.getTitle() + "', '" + gongji.getDate() + "', '" + gongji.getContent() + "', " + "0, 0, 0, 0, '"
				+ gongji.getFile() + "')");

		ResultSet rset = stmt.executeQuery("select last_insert_id()");

		int maxId = 0;

		while (rset.next()) {
			maxId = rset.getInt(1);
		}

		stmt.executeUpdate("update reviews set rootid = " + maxId + " where title = '" + gongji.getTitle() + "'");

		stmt.close();
		conn.close();
	}

	// 리뷰에 답글 쓰기
	public void reWrite(Review gongji) throws SQLException, ClassNotFoundException {

		Connection conn = connector();
		Statement stmt = conn.createStatement();

		int relevel = gongji.getRelevel();

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < relevel; i++) {
			sb.append("-");
		}

		stmt.execute("insert into reviews(title, date, content, rootid, relevel, recnt, viewcnt) values('" + sb
				+ ">[Re]" + gongji.getTitle() + "', '" + gongji.getDate() + "', '" + gongji.getContent() + "', "
				+ gongji.getRootid() + ", " + gongji.getRelevel() + ", " + gongji.getRecnt() + ", 0)");

		stmt.close();
		conn.close();

	}
	// 리뷰 수정하기
	public void update(Review gongji) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update reviews set title= '" + gongji.getTitle() + "', content= '" + gongji.getContent()
				+ "' where id = " + gongji.getId());

		stmt.close();
		conn.close();
	}

	// 답글의 순서정하기위한 로직
	public void setRecnt(int recnt) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();
		List<Integer> idList = new ArrayList<>();
		List<Integer> recntList = new ArrayList<>();

		ResultSet rset = stmt.executeQuery("select id, recnt from reviews");

		while (rset.next()) {
			idList.add(rset.getInt(1));
			recntList.add(rset.getInt(2));
		}

		for (int i = 0; i < idList.size(); i++) {

			if (recnt <= recntList.get(i)) {
				stmt.executeUpdate(
						"update reviews set recnt = " + (recntList.get(i) + 1) + " where id = " + idList.get(i));
			}
		}
		stmt.close();
		conn.close();

	}
	
	// 부모 아이디 찾기(리뷰 순서 정하기위해)
	public Review getParent(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		Review parent = new Review();

		ResultSet rset = stmt.executeQuery("select * from reviews where id = " + id);

		while (rset.next()) {
			parent.setId(rset.getInt(1));
			parent.setTitle(rset.getString(2));
			parent.setDate(rset.getString(3));
			parent.setContent(rset.getString(4));
			parent.setRootid(rset.getInt(5));
			parent.setRelevel(rset.getInt(6));
			parent.setRecnt(rset.getInt(7));
			parent.setViewcnt(rset.getInt(8));
		}
		return parent;
	}
	// rootid찾기(리뷰 순서에 도움)
	public int countRoot(int rootid) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select count(*) from reviews where rootid = " + rootid);

		int rootCnt = 0;

		if (rset.next()) {
			rootCnt = rset.getInt(1);
		}

		return rootCnt;
	}

	// 답글들 출력 쿼리문
	public List<Review> childList(Review parent) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery(
				"select * from reviews where rootid = " + parent.getRootid() + " and relevel = " + parent.getRelevel()
						+ " and recnt > " + parent.getRecnt() + " order by rootid desc, recnt asc");

		List<Review> childList = new ArrayList<>(); 

		while (rset.next()) {
			Review childGongji = new Review();
			
			childGongji.setId(rset.getInt(1));
			childGongji.setTitle(rset.getString(2));
			childGongji.setDate(rset.getString(3));
			childGongji.setContent(rset.getString(4));
			childGongji.setRootid(rset.getInt(5));
			childGongji.setRelevel(rset.getInt(6));
			childGongji.setRecnt(rset.getInt(7));
			childGongji.setViewcnt(rset.getInt(8));
			
			childList.add(childGongji);
		}
		stmt.close();
		conn.close();

		return childList;
	}

	public void childUpdate(int recnt, int id) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update reviews set recnt = " + recnt + " where id = " + id);

		stmt.close();
		conn.close();
	}

	// 리뷰 삭제 
	public void delete(int id) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("delete from reviews where id = " + id);

		stmt.close();
		conn.close();
	}

	// 리뷰 수정할때 id까지 수정 쿼리문
	public void setRootid(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update reviews set rootid= " + id + " where id = " + id);

		stmt.close();
		conn.close();
	}

	// 리뷰 조회수 수정
	public void viewCnt(Review gongji) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		int vCnt = gongji.getViewcnt() + 1;
		stmt.executeUpdate("update reviews set viewcnt= " + vCnt + " where id = " + gongji.getId());
		stmt.close();
		conn.close();
	}

	// rootid선택하는 쿼리문
	public List<Review> selectRootId(int momRootId, int momRecnt) {
		List<Review> gongjiList = new ArrayList<>();

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("select id, recnt from reviews where rootid = " + momRootId
					+ " and recnt > " + momRecnt + " order by recnt asc");

			while (rs.next()) {
				Review review = new Review();
				review.setId(rs.getInt(1));
				review.setRecnt(rs.getInt(2));

				gongjiList.add(review);
			}

			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return gongjiList;
	}

	// 리뷰에서 가장 큰 값 구하기
	public int maxRecnt() throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select max(recnt) from reviews");

		int maxRecnt = 0;

		if (rset.next()) {
			maxRecnt = rset.getInt(1);
		}

		return maxRecnt;
	}

	public void updateRecnt(List<Review> gongjiList) {

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			for (int i = 0; i < gongjiList.size(); i++) {

				int addRecnt = gongjiList.get(i).getRecnt() + 1;
				stmt.executeUpdate(
						"update reviews set recnt= " + addRecnt + " where id = " + gongjiList.get(i).getId());

			}

			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertRe(Review newRe) {
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			String sql = "insert into reviews(title, date, content, rootid, relevel, recnt, viewcnt) values(?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newRe.getTitle());
			pstmt.setString(2, newRe.getDate());
			pstmt.setString(3, newRe.getContent());
			pstmt.setInt(4, newRe.getRootid());
			pstmt.setInt(5, newRe.getRelevel());
			pstmt.setInt(6, newRe.getRecnt());
			pstmt.setInt(7, newRe.getViewcnt());

			pstmt.executeUpdate();

			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
