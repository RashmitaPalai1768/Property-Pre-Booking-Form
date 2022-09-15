package com.txt.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.txt.model.PropertyType;

public interface PropertyTypeRepo extends JpaRepository<PropertyType, Long>{

	@Query("From PropertyType pp where pp.project.housing_id=:housing_id")
	java.util.List<PropertyType> findAllProptyType(@Param("housing_id")Long housing_id);
}
