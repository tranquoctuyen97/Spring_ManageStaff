package com.tranquoctuyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tranquoctuyen.daoimp.DepartImp;
import com.tranquoctuyen.entity.Depart;
@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DepartDao implements DepartImp{
	@Autowired
	SessionFactory SessionFactory;
	@Transactional
	public List<Depart> getAllDepart() {
		Session session=SessionFactory.getCurrentSession();
		List<Depart> getAllDepart=(List<Depart>)session.createQuery("from Depart").getResultList();
		
		return getAllDepart;
	}
	@Transactional
	public boolean insertdepart(Depart depart) {
		Session session=SessionFactory.getCurrentSession();
		if (session.save(depart)!=null) {
			return true;
		} else {
			return false;
		}
		
	}
	@Transactional
	public boolean deletedepart(int id) {
		Session session=SessionFactory.getCurrentSession();
		Depart depart=session.get(Depart.class, id);
		session.delete(depart);
		return true;
	}
	@Transactional
	public Depart findbyId(int id) {
		Session session=SessionFactory.getCurrentSession();
		Depart depart=session.get(Depart.class, id);
		return depart;
	}
	@Transactional
	public boolean updateDepart(Depart depart) {
		Session session=SessionFactory.getCurrentSession();
		session.update(depart);
		return true;
	}

}
