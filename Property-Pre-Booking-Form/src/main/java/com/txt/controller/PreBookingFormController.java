package com.txt.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.txt.Repository.HousingProjectRepo;
import com.txt.Repository.PreBookingFormRepo;
import com.txt.Repository.PropertyTypeRepo;
import com.txt.Service.PreBookingFormService;
import com.txt.model.HousingProjectForm;
import com.txt.model.PreBookingFormEntity;
import com.txt.model.PropertyType;

@Controller
public class PreBookingFormController {

	@Autowired
	PropertyTypeRepo propertyTypeRepo;
	@Autowired
	HousingProjectRepo housingProjectRepo;
	@Autowired
	PreBookingFormService preBookingFormService;
	@Autowired
	PreBookingFormRepo PreBookingFormRepo;
	
	@Value("${document.upload.path}")
	private String uploadDocPath1;
	
	@GetMapping("/")
	public String book(Model model) {
		model.addAttribute("cc",housingProjectRepo.findAll());
		
		return "ApplicantDetails";
	}
	
	
	@PostMapping("/save")
	public String save(Model model,RedirectAttributes attributes,	  
			@RequestParam(value = "dob", required = false) String dob,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "mob", required = false) String mob,			
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "housing_id", required = false) HousingProjectForm housing_id,
			@RequestParam(value = "Property_id", required = false) PropertyType Property_id,
			@RequestParam(value = "gender", required = false)String gender,
			@RequestParam(value = "dscertificate1", required = false) MultipartFile dscertificate) throws IOException{
		
		 preBookingFormService.addAll(attributes,dob,name,mob,email,housing_id,Property_id, gender,dscertificate);
		 return"redirect:/"; 
	}
	 
	
	@ResponseBody

	@RequestMapping(value = "/find-housing-Id.htm", method = RequestMethod.GET)
	public String abc(@RequestParam(value = "housing_id", required = false) Long housing_id) throws JSONException {
		System.err.println("comeee......dist");
		List<PropertyType> ss = propertyTypeRepo.findAllProptyType(housing_id);
		JSONArray jarr = new JSONArray();
		JSONObject jobj = null;
		for (PropertyType se : ss) {
			jobj = new JSONObject();
			jobj.put("prop_id", se.getProperty_id());
			jobj.put("prop_name", se.getPropType());
			jarr.put(jobj);
		}
		return jarr.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/find-cost.htm",method = RequestMethod.POST)
	public Double findCost(@RequestParam(value = "Property_id", required = false) Long Property_id,
			@RequestParam(value = "housing_id", required = false) Long housing_id) {
		System.out.println("findCost....");		
		Double tcost=0.0;
		PropertyType propertyType = propertyTypeRepo.findById(Property_id).get();
		//SubscriptionEntity subscriptionEntity = subRepo.findById(sub_id).get();
		Double cc=propertyType.getTotalcost();
		//tcost=cc*Property_id;
		System.out.println(tcost);
		return cc;
	}
	
	
	@GetMapping("/view")
	public String view(Model model) {
		//model.addAttribute("classData", 1l);
		model.addAttribute("cc",housingProjectRepo.findAll());
		model.addAttribute("pp",propertyTypeRepo.findAll());
		model.addAttribute("vv",PreBookingFormRepo.findAll());
		//model.addAttribute("vv",PreBookingFormRepo.findAll1());
		return "view";
	}
	
	@RequestMapping(value = "/download/{id}",method = RequestMethod.GET)
	public void download(@PathVariable Long id,HttpServletResponse httpServletResponse) throws IOException {
		System.out.println("download...");
		PreBookingFormEntity preBookingFormEntity = PreBookingFormRepo.findById(id).get();
		//String pathname=uploadDocPath1 + "/" +preBookingFormEntity.getUploadIdProof();
		String pathname=preBookingFormEntity.getUploadIdProof();
		System.out.println(pathname);
		/*
		 * File file=new File(pathname); String
		 * mimeType=URLConnection.guessContentTypeFromName(file.getName());
		 * httpServletResponse.setContentType(mimeType);
		 * httpServletResponse.setHeader("Content-Dispostion",
		 * String.format("attachment; filename=\"" + file.getName()+"\""));
		 * httpServletResponse.setContentLength((int) file.length()); InputStream
		 * inputStream=new BufferedInputStream(new FileInputStream(file));
		 * FileCopyUtils.copy(inputStream, httpServletResponse.getOutputStream());
		 */
		File file = new File(pathname);
		if(!file.exists()){
		String errorMessage = "Sorry. The file you are looking for does not exist";
		OutputStream outputStream = httpServletResponse.getOutputStream();
		outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
		outputStream.close();
		return ;
		}
		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		if (mimeType == null) {
		mimeType = "application/octet-stream";
		}

		httpServletResponse.setContentType(mimeType);
		httpServletResponse.setHeader("Content-Disposition", String.format("attachment; filename=\"" + file.getName() + "\""));
		httpServletResponse.setContentLength((int) file.length());
		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

		FileCopyUtils.copy(inputStream, httpServletResponse.getOutputStream());
	}
	
	@RequestMapping(value = "/searchReport",method = RequestMethod.POST)
	public String SearchExcel(Model model,HttpServletResponse response,HttpSession session,
			@RequestParam(value = "housing", required = false) Long housing_id
			//,@RequestParam(value = "Property_id", required = false) Long Property_id
			) {
		System.out.println("Search...........");
		List<PreBookingFormEntity> all;
			if(housing_id !=null) {
				System.out.println("Through Id");
			all=PreBookingFormRepo.getByName(housing_id);			
			  }else { 
				  System.out.println("Through All"); 
				  all=PreBookingFormRepo.findAll();
			  }
			 
		
		//System.out.println(byName);
		session.removeAttribute("ss1");//session deactivate
		
		session.setAttribute("ss1",all);
		model.addAttribute("cc",housingProjectRepo.findAll());
		model.addAttribute("pp",propertyTypeRepo.findAll());
		model.addAttribute("classData", housing_id);
		//model.addAttribute("classData1", Property_id);
		model.addAttribute("vv",all);	
		return "view";
	}
}
