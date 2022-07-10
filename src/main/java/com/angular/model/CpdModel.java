package com.angular.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "master")
public class CpdModel {
		@Id
		@Column
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int cpdid;
		private String dcName;
		private String dcType;
		private String dob;
		private String mobile;
		private String proc;
		private String pack;
		private String dateofjoinng;
		private String Multiplehospital;
		private String Active;
		
		
		
		
		public int getCpdid() {
			return cpdid;
		}
		public void setCpdid(int cpdid) {
			this.cpdid = cpdid;
		}
		public String getDcName() {
			return dcName;
		}
		public void setDcName(String dcName) {
			this.dcName = dcName;
		}
		public String getDcType() {
			return dcType;
		}
		public void setDcType(String dcType) {
			this.dcType = dcType;
		}
		public String getDob() {
			return dob;
		}
		public void setDob(String dob) {
			this.dob = dob;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getProc() {
			return proc;
		}
		public void setProc(String proc) {
			this.proc = proc;
		}
		public String getPack() {
			return pack;
		}
		public void setPack(String pack) {
			this.pack = pack;
		}
		public String getDateofjoinng() {
			return dateofjoinng;
		}
		public void setDateofjoinng(String dateofjoinng) {
			this.dateofjoinng = dateofjoinng;
		}
		public String getMultiplehospital() {
			return Multiplehospital;
		}
		public void setMultiplehospital(String multiplehospital) {
			Multiplehospital = multiplehospital;
		}
		public String getActive() {
			return Active;
		}
		public void setActive(String active) {
			Active = active;
		}
	


@Override
public String toString() {
	return "CpdModel [cpdid=" + cpdid + ", dcName=" + dcName + ", dcType=" + dcType + ", dob=" + dob
			+ ", mobile=" + mobile + ", proc=" + proc + ", pack=" + pack + ", dateofjoinng=" + dateofjoinng
			+ ", Multiplehospital=" + Multiplehospital + ", Active=" + Active + "]";
}
}
