package com.tranquoctuyen.daoimp;

import java.util.List;

import com.tranquoctuyen.entity.Depart;

public interface DepartImp {
List<Depart> getAllDepart();
boolean insertdepart(Depart depart);
boolean deletedepart(int id);
Depart findbyId(int id);
boolean updateDepart(Depart depart);
}
