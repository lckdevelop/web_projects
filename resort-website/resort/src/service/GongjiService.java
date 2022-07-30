package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import dao.GongjiDao;
import domain.Gongji;

public class GongjiService {	
	private GongjiDao gongjiDao = new GongjiDao();
	
	
	public List<Gongji> selectGongji_list(int startRow, int endRow) throws SQLException, ClassNotFoundException {
		List<Gongji>gongjiList = gongjiDao.selectGongji_list(startRow, endRow);
		
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
	
	public Gongji selectOne(int id) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.selectOne(id);
	}
	
	public void newWrite(Gongji gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.newWrite(gongji);
	}
	
	public void delete(int id) throws Exception{
		
		gongjiDao.delete(id);
	}
	
	public void update(Gongji gongji) throws Exception {
		
		gongjiDao.update(gongji);
	}
	
	public void setRootid(int id) throws SQLException, ClassNotFoundException {
		
		gongjiDao.setRootid(id);
	}
	
	public void viewCnt(Gongji gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.viewCnt(gongji);
	}
	
	public void reWrite(Gongji gongji) throws SQLException, ClassNotFoundException {
		
		gongjiDao.reWrite(gongji);
	}
	
	public void setRecnt(int recnt) throws SQLException, ClassNotFoundException {
		
		gongjiDao.setRecnt(recnt);
	}
	
	public List<Gongji> childList(Gongji gongji) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.childList(gongji);
		
	}
	
	public int getfCount(String sel, String find){
	
		return gongjiDao.getfCount(sel, find);
	}
	
	public List<Gongji> getfList(int startRow, int endRow, String sel, String find) throws Exception {
		
		return gongjiDao.getfList(startRow, endRow, sel, find);
	}
	
	public Gongji getParent(int id) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.getParent(id);
	}
	
	public void childUpdate(int recnt, int id) throws Exception {
		gongjiDao.childUpdate(recnt, id);
	}
	
	public int countRoot(int rootId) throws SQLException, ClassNotFoundException {
		
		return gongjiDao.countRoot(rootId);
	}
	
	public int maxRecnt() throws SQLException, ClassNotFoundException {
		
		return gongjiDao.maxRecnt();
	}
	// ���⼭����
	// ����� ����
	// ���ο� �޼ҵ��

	// rootid�� ���� �Խñ� ã�� �޼ҵ�, ���ÿ� ù ��° ���̴� �θ� �ٷ� ������ �Խñ��̴�(recnt���� �� �̴�.)
	public List<Gongji> selectRootId(int momRootId, int momRecnt) {

		return gongjiDao.selectRootId(momRootId, momRecnt);
	}

	public void updateRecnt(List<Gongji> gongjiList) {

		gongjiDao.updateRecnt(gongjiList);
	}

	public void insertRe(Gongji newRe) {

		gongjiDao.insertRe(newRe);
	}
}
