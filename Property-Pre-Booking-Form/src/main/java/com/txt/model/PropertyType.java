package com.txt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PropertyType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Property_id;
	private String PropType;
	@ManyToOne
	@JoinColumn(name = "p_id")
	private HousingProjectForm project;
	@Column(name = "property_cost")
	private Double totalcost;
	
	public Long getProperty_id() {
		return Property_id;
	}
	public void setProperty_id(Long property_id) {
		Property_id = property_id;
	}
	public String getPropType() {
		return PropType;
	}
	public void setPropType(String propType) {
		PropType = propType;
	}
	public HousingProjectForm getProject() {
		return project;
	}
	public void setProject(HousingProjectForm project) {
		this.project = project;
	}
	public Double getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(Double totalcost) {
		this.totalcost = totalcost;
	}
	
	
}
