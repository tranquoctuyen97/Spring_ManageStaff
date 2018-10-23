package com.tranquoctuyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tranquoctuyen.dao.ReasonDao;
import com.tranquoctuyen.daoimp.ReasonImp;
import com.tranquoctuyen.entity.Reason;

@Service
public class ReasonService implements ReasonImp {
@Autowired
ReasonDao reasonDao;
	public List<Reason> getAllreason() {
		List<Reason> list=reasonDao.getAllreason();
		return list;
	}

}
