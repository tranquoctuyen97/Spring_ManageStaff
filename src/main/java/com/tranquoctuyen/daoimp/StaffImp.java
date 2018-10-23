package com.tranquoctuyen.daoimp;

import java.util.List;

import com.tranquoctuyen.entity.Record;
import com.tranquoctuyen.entity.Staff;

public interface StaffImp {
 List<Staff> danhsachnhanhvien();
boolean editnhanvien (Staff staff) ;
Staff hienthinhanvien(int id);
boolean deletenhanvien (int id) ;
List<Staff> listnhanhvien10(int start);
boolean insertnhanvien (Staff staff) ;
boolean checklogin(String email,String password);
Staff findtUser(String email);
Staff findbyID(int id);
boolean checkphone(String phone);
List<Staff> getAllbyDepartid(int departid);


}
