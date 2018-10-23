package com.tranquoctuyen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tranquoctuyen.dao.RecordDao;
import com.tranquoctuyen.daoimp.RecordImp;
import com.tranquoctuyen.entity.Record;

@Service
public class RecordService implements RecordImp{
@Autowired
RecordDao recordDao;

public boolean insermuster(Record record) {
	boolean kiemtra=recordDao.insermuster(record);
	return kiemtra;
}

public boolean updatemuster(Record record) {
	boolean kiemtra=recordDao.updatemuster(record);
	return kiemtra;
}

public boolean checkmuster(String Date) {
	boolean kiemtra=recordDao.checkmuster(Date);
	return kiemtra;
}

public Record findbyID(int id) {
	Record record=recordDao.findbyID(id);
	return record;
}

public List<Record> checkrecord(String Date,int departid) {
	List<Record> list=recordDao.checkrecord(Date,departid);
	return list;
}
public List<Record> top10Staff() {
	List<Record> list=recordDao.top10Staff();
	return list;
}

}
