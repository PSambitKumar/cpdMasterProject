package com.angular.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "m_cpdhospname")
public class cpdhospitatagged {
	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cpdhospid;
	private String cpdhospName;
	public int getCpdhospid() {
		return cpdhospid;
	}
	public void setCpdhospid(int cpdhospid) {
		this.cpdhospid = cpdhospid;
	}
	public String getCpdhospName() {
		return cpdhospName;
	}
	public void setCpdhospName(String cpdhospName) {
		this.cpdhospName = cpdhospName;
	}
	@Override
	public String toString() {
		return "cpdhospitatagged [cpdhospid=" + cpdhospid + ", cpdhospName=" + cpdhospName + "]";
	}
	
	
}
