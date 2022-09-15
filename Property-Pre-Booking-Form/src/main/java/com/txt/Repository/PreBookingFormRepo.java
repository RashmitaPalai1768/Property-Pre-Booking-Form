package com.txt.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.txt.model.PreBookingFormEntity;

public interface PreBookingFormRepo extends JpaRepository<PreBookingFormEntity, Long>{

	@Query("from PreBookingFormEntity  where housing_id.housing_id=:housing_id")
	List<PreBookingFormEntity> getByName(@Param("housing_id")Long housing_id);
	
	
	
	/*
	 * @Query(value =
	 * "SELECT g.pre_book_id,g.applicant_name,g.email,g.mobile_no,floor( DATEDIFF(CURDATE(),g.dob) / 365.25) as\r\n"
	 * +
	 * "			age,g.dob,g.upload_doc,s.housingroject_name,p.prop_type from assment.Pre_Booking_Form g \r\n"
	 * +
	 * "			inner join assment.housingproject_master s on g.pre_book_id=s.housing_id\r\n"
	 * +
	 * "			inner join assment.property_type p on g.pre_book_id=p.property_id"
	 * , nativeQuery = true) List<Object[]> findAll1();
	 */

}
