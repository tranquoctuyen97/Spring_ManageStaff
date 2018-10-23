package com.tranquoctuyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tranquoctuyen.dao.DepartDao;
import com.tranquoctuyen.daoimp.DepartImp;
import com.tranquoctuyen.entity.Depart;

@Service
public class DepartService implements DepartImp{
@Autowired
DepartDao departDao;
	public List<Depart> getAllDepart() {
		List<Depart> list=departDao.getAllDepart();
		return list;
	}
	public boolean insertdepart(Depart depart) {
		boolean kt=departDao.insertdepart(depart);
		
		return kt;
	}
	public boolean deletedepart(int id) {
		boolean kt=departDao.deletedepart(id);
		return kt;
	}
	public Depart findbyId(int id) {
		Depart depart=departDao.findbyId(id);
		return depart;
	}
	public boolean updateDepart(Depart depart) {
		boolean kt=departDao.updateDepart(depart);
		return kt;
	}
	

}
