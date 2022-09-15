package com.txt.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.txt.model.HousingProjectForm;
import com.txt.model.PropertyType;

public interface PreBookingFormService {

	void addAll(RedirectAttributes redirectAttributes,String dob, String name, String mob, String email, HousingProjectForm housing_id, PropertyType property_id,
			String gender,MultipartFile dscertificate)throws IOException;

	

}
