package com.tranquoctuyen.dao;

import java.util.List;

import javax.management.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tranquoctuyen.daoimp.RecordImp;
import com.tranquoctuyen.entity.Record;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RecordDao implements RecordImp {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean insermuster(Record record) {
		Session session = sessionFactory.getCurrentSession();
		if (session.save(record) != null) {
			return true;
		} else {
			return false;
		}

	}
	@Transactional
	public boolean updatemuster(Record record) {
		Session session = sessionFactory.getCurrentSession();
		session.update(record);
		return true;
	}
	@Transactional
	public boolean checkmuster(String Date) {
		Session session = sessionFactory.getCurrentSession();
		try {
			List<Record> list=session.createQuery("FROM Record WHERE Date like '"+Date+"' and Reasonid=1 ").getResultList();
//			session.
			if (!list.isEmpty()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		
	}
	@Transactional
	public Record findbyID(int id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Record record=session.get(Record.class, id);
			if (record!=null) {
				return record;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	@Transactional
	public List<Record> checkrecord(String Date,int departid) {
		Session session = sessionFactory.getCurrentSession();
	
List<Record> list=session.createQuery("FROM Record R  inner join Staff S on R.staff=S.id WHERE R.date ='"+Date+"' and R.reason !=1 and S.depart.id='"+departid+"'").getResultList();

return list;	
	}
	@Transactional
	public List<Record> top10Staff() {
		Session session = sessionFactory.getCurrentSession();

		List<Record> list = session.createQuery("FROM Record GROUP BY staffid  ORDER BY SUM(type) DESC").setFirstResult(0).setMaxResults(10).getResultList();
		return list;
	}

}
