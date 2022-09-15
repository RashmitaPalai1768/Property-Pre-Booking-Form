package com.txt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "housingproject_master")
public class HousingProjectForm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="housing_id")
	private Long housing_id;
	@Column(name="housingroject_name")
	private String housingProjectName;
	
	public Long getHousing_id() {
		return housing_id;
	}
	public void setHousing_id(Long housing_id) {
		this.housing_id = housing_id;
	}
	public String getHousingProjectName() {
		return housingProjectName;
	}
	public void setHousingProjectName(String housingProjectName) {
		this.housingProjectName = housingProjectName;
	}
	
	
}
