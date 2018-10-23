package com.tranquoctuyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tranquoctuyen.daoimp.ReasonImp;
import com.tranquoctuyen.entity.Reason;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ReasonDao implements ReasonImp {
	@Autowired 
	SessionFactory  sessionFactory;
@Transactional
	public List<Reason> getAllreason() {
	Session session=sessionFactory.getCurrentSession();
	List<Reason> list=session.createQuery("from Reason").getResultList();
		return list;
	}

	
		
	

}
