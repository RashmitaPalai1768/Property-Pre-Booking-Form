package com.txt.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.txt.model.HousingProjectForm;

public interface HousingProjectRepo extends JpaRepository<HousingProjectForm, Long>{

}
