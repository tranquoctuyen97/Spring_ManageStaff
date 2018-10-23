package com.tranquoctuyen.daoimp;

import java.util.List;

import com.tranquoctuyen.entity.Record;

public interface RecordImp {
boolean insermuster(Record record);
boolean updatemuster(Record record);
boolean checkmuster(String Date);
Record findbyID(int id);
List<Record> checkrecord(String Date,int departid);
List<Record> top10Staff();
}
