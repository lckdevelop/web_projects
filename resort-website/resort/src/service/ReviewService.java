package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import dao.ReviewDao;
import domain.Gongji;
import domain.Review;

public class ReviewService {	
	private ReviewDao gongjiDao = new ReviewDao();
	
	
	public List<Review> selectGongji_list(int startRow, int endRow) throws SQLException, ClassNotFoundException {
		List<Review>gongjiList = gongjiDao.selectGongji_list(startRow, endRow);
		
		try {
			for (int i = 0; i < gongjiList.size(); i++) {
				StringBuffer sb = new StringBuffer("");
				if (gongjiList.get(i).getRelevel() != 0) {

					int relevel = gongjiList.get(i).getRelevel();
					
					for (int j = 0; j < relevel; j++) {
						sb.append("-");
					}
					sb.append(">[Re]");
					sb.append(gongjiList.get(i).getTitle());
					String cgTitle = sb.toString();
					gongjiList.get(i).setTitle(cgTitle);
				}
			}
		} catch(Exception e) {
			
		}
		return gongjiList;
	}
	
	public int getCount() {
		
		return gongjiDao.getCount();
	}
	
	public Review selectOne(int id) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.selectOne(id);
	}
	
	public void newWrite(Review gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.newWrite(gongji);
	}
	
	public void delete(int id) throws Exception{
		
		gongjiDao.delete(id);
	}
	
	public void update(Review gongji) throws Exception {
		
		gongjiDao.update(gongji);
	}
	
	public void setRootid(int id) throws SQLException, ClassNotFoundException {
		
		gongjiDao.setRootid(id);
	}
	
	public void viewCnt(Review gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.viewCnt(gongji);
	}
	
	public void reWrite(Review gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.reWrite(gongji);
	}
	
	public void setRecnt(int recnt) throws SQLException, ClassNotFoundException {
		
		gongjiDao.setRecnt(recnt);
	}
	
	public List<Review> childList(Review gongji) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.childList(gongji);
		
	}
	
	public int getfCount(String sel, String find){
	
		return gongjiDao.getfCount(sel, find);
	}
	
	public List<Review> getfList(int startRow, int endRow, String sel, String find) throws Exception {
		
		return gongjiDao.getfList(startRow, endRow, sel, find);
	}
	
	public Review getParent(int id) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.getParent(id);
	}
	
	public void childUpdate(int recnt, int id) throws Exception {
		gongjiDao.childUpdate(recnt, id);
	}
	
	public int countRoot(int rootId) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.countRoot(rootId);
	}
	
	// 여기서부터
	// 댓글을 위한
	// 새로운 메소드들

	// rootid가 같은 게시글 찾는 메소드, 동시에 첫 번째 아이는 부모 바로 다음의 게시글이다(recnt뺏길 것 이다.)
	public List<Review> selectRootId(int momRootId, int momRecnt) {

		return gongjiDao.selectRootId(momRootId, momRecnt);
	}
	
	public int maxRecnt() throws SQLException, ClassNotFoundException {
		
		return gongjiDao.maxRecnt();
	}

	public void updateRecnt(List<Review> gongjiList) {

		gongjiDao.updateRecnt(gongjiList);
	}

	public void insertRe(Review newRe) {

		gongjiDao.insertRe(newRe);
	}
}
