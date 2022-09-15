package com.txt.ServiceImpl;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.txt.Repository.PreBookingFormRepo;
import com.txt.Service.PreBookingFormService;
import com.txt.model.HousingProjectForm;
import com.txt.model.PreBookingFormEntity;
import com.txt.model.PropertyType;
@Service
public class PreBookingFormServiceImpl implements PreBookingFormService{

	@Autowired
	PreBookingFormRepo PreBookingFormRepo;
	@Value("${document.upload.path}")
	private String uploadDocPath1;
	
	@Override
	
	public void addAll(RedirectAttributes redirectAttributes, String dob, String name, String mob, String email,
			HousingProjectForm housing_id, PropertyType property_id,String gender, MultipartFile dscertificate) throws IOException {
		PreBookingFormEntity entity=new PreBookingFormEntity();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");	
		System.out.println(dob);
			Date parse=null;
			try {
				parse = dateFormat.parse(dob);
				System.out.println(parse);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			  String originalFilename=StringUtils.cleanPath(dscertificate.getOriginalFilename()).trim();
			  Path  path=Paths.get(uploadDocPath1); 
			  if(!Files.exists(path)) { //Create FIles in the directory
			   Files.createDirectories(path); 
			  } 
			  InputStream  inputStream=dscertificate.getInputStream();
			  
			  java.nio.file.Path path2=path.resolve(originalFilename);
			  Files.copy(inputStream, path2,StandardCopyOption.REPLACE_EXISTING);
			  String path1=uploadDocPath1 + "/" + originalFilename ;
		entity.setApplicant_name(name);
		entity.setEmail(email);
		entity.setHousing_id(housing_id);
		entity.setProperty_id1(property_id);
		entity.setUploadIdProof(path1);
		entity.setGender(gender);
		entity.setMob(mob);
		entity.setDob(parse);
		PreBookingFormRepo.save(entity);
		redirectAttributes.addFlashAttribute("status", "Data Saved successfully");
	}


	
}
