package com.tranquoctuyen.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the reason database table.
 * 
 */

@Entity
@Table(name="reason")
@NamedQuery(name="Reason.findAll", query="SELECT r FROM Reason r")
public class Reason implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String name;

	//bi-directional many-to-one association to Record
	@OneToMany(mappedBy="reason",cascade = CascadeType.ALL)
	private List<Record> records;

	public Reason() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Record> getRecords() {
		return this.records;
	}

	public void setRecords(List<Record> records) {
		this.records = records;
	}

	public Record addRecord(Record record) {
		getRecords().add(record);
		record.setReason(this);

		return record;
	}

	public Record removeRecord(Record record) {
		getRecords().remove(record);
		record.setReason(null);

		return record;
	}

}