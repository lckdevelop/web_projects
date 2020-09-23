package service;

import dao.AdminDao;
import domain.Admin;

public class AdminService {
	AdminDao adminDao = new AdminDao();
	Admin admin = new Admin();
	
	public Admin selectOne(String id, String passwd) {
		
		return adminDao.selectOne(id, passwd);
	}
}
