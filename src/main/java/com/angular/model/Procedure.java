package com.angular.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "procedure_tbl")
public class Procedure {
	@Id
	@Column
	private long id;
	private String procedureName;
	private String packageCategoryName;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getProcedureName() {
		return procedureName;
	}

	public void setProcedureName(String procedureName) {
		this.procedureName = procedureName;
	}

	public String getPackageCategoryName() {
		return packageCategoryName;
	}

	public void setPackageCategoryName(String packageCategoryName) {
		this.packageCategoryName = packageCategoryName;
	}

	@Override
	public String toString() {
		return "Procedure{" +
			   "id=" + id +
			   ", procedureName='" + procedureName + '\'' +
			   ", packageCategoryName='" + packageCategoryName + '\'' +
			   '}';
	}
}
