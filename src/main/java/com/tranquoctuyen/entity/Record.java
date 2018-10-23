package com.tranquoctuyen.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the records database table.
 * 
 */
@Entity
@Table(name="records")
@NamedQuery(name="Record.findAll", query="SELECT r FROM Record r")
public class Record implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id

	private int id;

	private String date;

	private int type;

	//bi-directional many-to-one association to Reason
	@ManyToOne
	@JoinColumn(name="reasonid")
	private Reason reason;

	//bi-directional many-to-one association to Staff
	@ManyToOne
	@JoinColumn(name="staffid")
	private Staff staff;

	public Record() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Reason getReason() {
		return this.reason;
	}

	public void setReason(Reason reason) {
		this.reason = reason;
	}

	public Staff getStaff() {
		return this.staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

}