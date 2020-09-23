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

public class GongjiDao {
	private Gongji gongji = new Gongji();

	public Connection connector() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/koposw01", "root", "9683");

		return conn;
	}

	// 초기 공지 테이블 만들기
	public void createTable() throws ClassNotFoundException, SQLException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("create table gongji(id int not null primary key auto_increment, title varchar(70),"
				+ "date date, content text) default charset=utf8");

		stmt.close();
		conn.close();
	}

	// 공지 테이블 필드 추가
	public void alterTable() throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("alter table gongji add rootid int");
		stmt.execute("alter table gongji add relevel int");
		stmt.execute("alter table gongji add recnt int");
		stmt.execute("alter table gongji add viewcnt int");
		stmt.execute("alter table gongji add file varchar(100)");

		stmt.close();
		conn.close();

	}

	// 공지리스트 정렬하여 출력하기
	public List<Gongji> selectGongji_list(int startRow, int endRow) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery(
				"select id, title, viewcnt, date, file, relevel from gongji order by rootid desc, recnt asc limit "
						+ startRow + ", " + endRow);

		List<Gongji> gongjiList = new ArrayList<>();

		while (rset.next()) {
			Gongji gongji = new Gongji();

			gongji.setId(rset.getInt(1));
			gongji.setTitle(rset.getString(2));
			gongji.setViewcnt(rset.getInt(3));
			gongji.setDate(rset.getString(4));
			gongji.setFile(rset.getString(5));
			gongji.setRelevel(rset.getInt(6));

			gongjiList.add(gongji);
		}

		stmt.close();
		conn.close();

		return gongjiList;
	}

	// 공지리스트 개수 세기
	public int getCount() {
		int count = 0;

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select count(*) from gongji");

			if (rset.next()) {
				count = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 검색 개수 세기
	public int getfCount(String sel, String find) {
		int fCount = 0;
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select count(*) from gongji where " + sel + " like '%" + find + "%'");
			if (rset.next()) {
				fCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fCount;
	}
	
	// 검색 리스트 출력
	public List<Gongji> getfList(int startRow, int endRow, String sel, String find) throws Exception {
		List<Gongji> gongji_fList = new ArrayList<>(); 
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select id, title, file, viewcnt, date from gongji where " + sel
					+ " like '%" + find + "%' order by rootid desc, recnt asc limit " + startRow + ", " + endRow);

			while (rset.next()) { 
				Gongji gongi = new Gongji();

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

	// id검색해서 찾기
	public Gongji selectOne(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select * from gongji where id = " + id);

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

	// 새로운 공지 쓰기
	public void newWrite(Gongji gongji) throws SQLException, ClassNotFoundException {

		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.execute("insert into gongji(title, date, content, rootid, relevel, recnt, viewcnt, file) values('"
				+ gongji.getTitle() + "', '" + gongji.getDate() + "', '" + gongji.getContent() + "', " + "0, 0, 0, 0, '"
				+ gongji.getFile() + "')");

		ResultSet rset = stmt.executeQuery("select last_insert_id()");
		int maxId = 0;
		while (rset.next()) {
			maxId = rset.getInt(1);
		}

		stmt.executeUpdate("update gongji set rootid = " + maxId + " where title = '" + gongji.getTitle() + "'");

		stmt.close();
		conn.close();
	}

	// 공지에대한 답글 달기
	public void reWrite(Gongji gongji) throws SQLException, ClassNotFoundException {

		Connection conn = connector();
		Statement stmt = conn.createStatement();

		int relevel = gongji.getRelevel();

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < relevel; i++) {
			sb.append("-");
		}

		stmt.execute("insert into gongji(title, date, content, rootid, relevel, recnt, viewcnt) values('" + sb + ">[Re]"
				+ gongji.getTitle() + "', '" + gongji.getDate() + "', '" + gongji.getContent() + "', "
				+ gongji.getRootid() + ", " + gongji.getRelevel() + ", " + gongji.getRecnt() + ", 0)");

		stmt.close();
		conn.close();

	}
	
	// 공지 수정하기
	public void update(Gongji gongji) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update gongji set title= '" + gongji.getTitle() + "', content= '" + gongji.getContent()
				+ "', file= '" + gongji.getFile() + "' where id = " + gongji.getId());

		stmt.close();
		conn.close();
	}
	
	// 답글 순서 정하기
	public void setRecnt(int recnt) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();
		List<Integer> idList = new ArrayList<>();
		List<Integer> recntList = new ArrayList<>();

		ResultSet rset = stmt.executeQuery("select id, recnt from gongji");

		while (rset.next()) {
			idList.add(rset.getInt(1));
			recntList.add(rset.getInt(2));
		}

		for (int i = 0; i < idList.size(); i++) {

			if (recnt <= recntList.get(i)) {
				stmt.executeUpdate(
						"update gongji set recnt = " + (recntList.get(i) + 1) + " where id = " + idList.get(i));
			}
		}
		stmt.close();
		conn.close();

	}
	
	// 부모 글 찾기
	public Gongji getParent(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		Gongji parent = new Gongji();

		ResultSet rset = stmt.executeQuery("select * from gongji where id = " + id);

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
	
	// 같은 rootid를 갖는 개수 찾기
	public int countRoot(int rootid) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select count(*) from gongji where rootid = " + rootid);

		int rootCnt = 0;

		if (rset.next()) {
			rootCnt = rset.getInt(1);
		}

		return rootCnt;
	}
	
	// recnt값이 가장 큰 값 찾기
	public int maxRecnt() throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery("select max(recnt) from gongji");

		int maxRecnt = 0;

		if (rset.next()) {
			maxRecnt = rset.getInt(1);
		}

		return maxRecnt;
	}

	// 해당하는 답글들 모두 찾기
	public List<Gongji> childList(Gongji parent) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		ResultSet rset = stmt.executeQuery(
				"select * from gongji where rootid = " + parent.getRootid() + " and relevel = " + parent.getRelevel()
						+ " and recnt > " + parent.getRecnt() + " order by rootid desc, recnt asc");
		List<Gongji> childList = new ArrayList<>();

		while (rset.next()) {
			Gongji childGongji = new Gongji();

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
	
	// 답글 수정
	public void childUpdate(int recnt, int id) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update gongji set recnt = " + recnt + " where id = " + id);

		stmt.close();
		conn.close();
	}
	
	// 글 삭제
	public void delete(int id) throws Exception {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("delete from gongji where id = " + id);

		stmt.close();
		conn.close();
	}
	
	// rootid 수정
	public void setRootid(int id) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		stmt.executeUpdate("update gongji set rootid= " + id + " where id = " + id);

		stmt.close();
		conn.close();
	}
	
	// 조회수 수정
	public void viewCnt(Gongji gongji) throws SQLException, ClassNotFoundException {
		Connection conn = connector();
		Statement stmt = conn.createStatement();

		int vCnt = gongji.getViewcnt() + 1;
		stmt.executeUpdate("update gongji set viewcnt= " + vCnt + " where id = " + gongji.getId());
		stmt.close();
		conn.close();
	}
	
	// 해당하는 rootid찾기
	public List<Gongji> selectRootId(int momRootId, int momRecnt) {
		List<Gongji> gongjiList = new ArrayList<>();

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("select id, recnt from gongji where rootid = " + momRootId
					+ " and recnt > " + momRecnt + " order by recnt asc");

			while (rs.next()) {
				Gongji gongji = new Gongji();
				gongji.setId(rs.getInt(1));
				gongji.setRecnt(rs.getInt(2));

				gongjiList.add(gongji);
			}

			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return gongjiList;
	}
	
	// recnt값 수정하기
	public void updateRecnt(List<Gongji> gongjiList) {

		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			for (int i = 0; i < gongjiList.size(); i++) {

				int addRecnt = gongjiList.get(i).getRecnt() + 1;
				stmt.executeUpdate("update gongji set recnt= " + addRecnt + " where id = " + gongjiList.get(i).getId());

			}

			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 답글 넣기
	public void insertRe(Gongji newRe) {
		try {
			Connection conn = connector();
			Statement stmt = conn.createStatement();

			String sql = "insert into gongji(title, date, content, rootid, relevel, recnt, viewcnt) values(?, ?, ?, ?, ?, ?, ?)";

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
