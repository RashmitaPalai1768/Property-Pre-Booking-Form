package com.txt.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Pre_Booking_Form")
public class PreBookingFormEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long preBook_id;
	@Column(name = "applicant_name")
	private String applicant_name;
	@Column(name = "email")
	private String email;
	@Column(name = "mobile_no")
	private String mob;
	@Column(name = "DOB")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date dob;
	@Column(name = "gender")
	private String gender;
	@Column(name = "upload_Doc")
	private String UploadIdProof;
	@ManyToOne
	private HousingProjectForm housing_id;
	@ManyToOne
	private PropertyType Property_id1;
	
	public Long getPreBook_id() {
		return preBook_id;
	}
	public void setPreBook_id(Long preBook_id) {
		this.preBook_id = preBook_id;
	}
	public String getApplicant_name() {
		return applicant_name;
	}
	public void setApplicant_name(String applicant_name) {
		this.applicant_name = applicant_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUploadIdProof() {
		return UploadIdProof;
	}
	public void setUploadIdProof(String uploadIdProof) {
		UploadIdProof = uploadIdProof;
	}
	public HousingProjectForm getHousing_id() {
		return housing_id;
	}
	public void setHousing_id(HousingProjectForm housing_id) {
		this.housing_id = housing_id;
	}
	public PropertyType getProperty_id1() {
		return Property_id1;
	}
	public void setProperty_id1(PropertyType property_id1) {
		Property_id1 = property_id1;
	}
		
	
}
