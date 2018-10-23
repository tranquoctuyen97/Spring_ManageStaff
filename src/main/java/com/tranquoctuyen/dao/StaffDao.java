package com.tranquoctuyen.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tranquoctuyen.daoimp.StaffImp;

import com.tranquoctuyen.entity.Staff;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class StaffDao implements StaffImp {
	@Autowired
	SessionFactory SessionFactory;

	@Transactional
	public List<Staff> danhsachnhanhvien() {
		Session session = SessionFactory.getCurrentSession();

		List<Staff> danhsachnhanvien = session.createQuery("from Staff").getResultList();

		return danhsachnhanvien;
	}

	@Transactional
	public boolean editnhanvien(Staff staff) {

		Session session = SessionFactory.getCurrentSession();
		session.save(staff);
		if (session.save(staff) != null) {
			return true;
		} else {
			return false;
		}

	}

	@Transactional
	public Staff hienthinhanvien(int id) {
		String query = "FROM Staff WHERE id='" + id + "'";
		Session session = SessionFactory.getCurrentSession();
		Staff staff = (Staff) session.createQuery(query).getSingleResult();
		return staff;
	}

	@Transactional
	public boolean deletenhanvien(int id) {
		Session session = SessionFactory.getCurrentSession();
		Staff staff = findbyID(id);
		session.remove(staff);

		return false;
	}

	@Transactional
	public List<Staff> listnhanhvien10(int start) {
		Session session = SessionFactory.getCurrentSession();

		List<Staff> list = session.createQuery("from Staff").setFirstResult(start).setMaxResults(10).getResultList();
		return list;
	}

	@Transactional
	public boolean insertnhanvien(Staff staff) {
		Session session = SessionFactory.getCurrentSession();
		if (session.save(staff) != null) {
			return true;
		} else {
			return false;
		}

	}

	@Transactional
	public boolean checklogin(String email, String password) {
		Session session = SessionFactory.getCurrentSession();
		try {
			Staff staff = (Staff) session
					.createQuery("from Staff where email like '" + email + "' and password='" + password + "'")
					.getSingleResult();
			if (staff != null) {

				return true;

			} else {
				return false;

			}
		} catch (Exception e) {
			return false;
		}

	}

	@Transactional
	public Staff findtUser(String email) {
		Session session = SessionFactory.getCurrentSession();
		try {
			Staff staff = (Staff) session.createQuery("from Staff where email like'" + email + "'").getSingleResult();

			if (staff == null) {
				System.out.println("lu le");
				return null;
			} else {
				return staff;

			}
		} catch (Exception e) {
			return null;
		}

	}

	@Transactional
	public Staff findbyID(int id) {
		Session session = SessionFactory.getCurrentSession();
		Staff staff = session.get(Staff.class, id);
		return staff;
	}

	@Transactional
	public boolean checkphone(String phone) {
		Session session = SessionFactory.getCurrentSession();
		try {
			Staff staff = (Staff) session.createQuery("from Staff where phone like'" + phone + "'").getSingleResult();
			if (staff == null) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			return false;
		}

	}
@Transactional
	public List<Staff> getAllbyDepartid(int departid) {
	Session session = SessionFactory.getCurrentSession();
	
		List<Staff> list=session.createQuery("from Staff where departid ='"+departid+"'").getResultList();
	return list;
	}

	

}
