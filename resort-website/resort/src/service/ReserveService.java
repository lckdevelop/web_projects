package service;

import java.util.List;

import dao.ReserveDao;
import domain.Reserve;

public class ReserveService {
	ReserveDao reserveDao = new ReserveDao();

	public String selectOne(String resvDate, int room) {

		return reserveDao.selectOne(resvDate, room);
	}

	public List<Reserve> select() {

		return reserveDao.select();
	}
	
	public void insert(Reserve reserve) {
		
		reserveDao.insert(reserve);
	}
	
	public Reserve selectAll(String date, int room) {
		
		return reserveDao.selectAll(date, room);
	}
	
	public void update(Reserve reserve, String originDate, int originRoom) {
		
		reserveDao.update(reserve, originDate, originRoom);
	}
	
	public void delete(Reserve reserve) {
		
		reserveDao.delete(reserve);
	}
	
	public int selectOverLap(String originDate, int originRoom) {
		
		return reserveDao.selectOverLap(originDate, originRoom);
	}
}

