package com.tranquoctuyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tranquoctuyen.dao.StaffDao;
import com.tranquoctuyen.daoimp.StaffImp;

import com.tranquoctuyen.entity.Staff;
@Service
public class StaffService implements StaffImp{
@Autowired
StaffDao sDao;


	public List<Staff> danhsachnhanhvien() {
		 List<Staff> dsnv=sDao.danhsachnhanhvien();
		return dsnv;
	}
	public boolean editnhanvien(Staff staff) {
	boolean kt=sDao.editnhanvien(staff);
		return kt;
	}
	public Staff hienthinhanvien(int id) {
		Staff staff =sDao.hienthinhanvien(id);
		return staff;
	}
	
	public boolean deletenhanvien(int id) {
		boolean kt=sDao.deletenhanvien(id);
		return kt;
	}
	public List<Staff> listnhanhvien10(int start) {
		 List<Staff> dsnvlimit=sDao.listnhanhvien10(start);
		return dsnvlimit;
	}
	public boolean insertnhanvien(Staff staff) {
		boolean kt=sDao.insertnhanvien(staff);
		return kt;
	}
	public boolean checklogin(String email, String password) {
		boolean kt=sDao.checklogin(email, password);
		return kt;
	}
	public Staff findtUser(String email) {
		Staff staff;
		staff=sDao.findtUser(email);
		
		return staff;
	}
	public Staff findbyID(int id) {
		Staff staff=sDao.findbyID(id);
		return staff;
	}
	public boolean checkphone(String phone) {
		boolean kt=sDao.checkphone(phone);
		return kt;
	}
	public List<Staff> getAllbyDepartid(int departid) {
		List<Staff> list=sDao.getAllbyDepartid(departid);
		return list;
	}
	
	

}
