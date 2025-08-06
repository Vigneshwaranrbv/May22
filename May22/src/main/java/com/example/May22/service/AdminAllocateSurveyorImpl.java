package com.example.May22.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.Customer;
import com.example.May22.entity.Surveyor;
import com.example.May22.repository.CustomerApplyRepository;
import com.example.May22.repository.SurveyorRepository;

@Service
public class AdminAllocateSurveyorImpl implements AdminAllocateSurveyorService{

	@Autowired
	private SurveyorRepository surveyorrepository;
	
	@Autowired
	private CustomerApplyRepository customerapplyrepository; 

	@Override
	public List<Surveyor> getAllSurveyors() {
		return surveyorrepository.findAll();
	}
	@Override
	public Customer getCustomerById(Long customerid) {
		return customerapplyrepository.findById(customerid).orElse(null);
	}
	// This code assign surveyor
	@Override
	public void assignSurveyorToCustomer(Long customerid, Long id) {
		Customer customer = customerapplyrepository.findById(customerid).orElse(null);
		Surveyor surveyor = surveyorrepository.findById(id).orElse(null);
		
		if(customer != null && surveyor != null) {
			customer.setSurveyor(surveyor);
			customer.setStatus("Pending Surveyor Review");
		    customerapplyrepository.save(customer);
		}
	}

	/*
	 * @Override public byte[] getClaimFile(Long customerid) { Optional<Customer>
	 * optional = customerapplyrepository.findById(customerid);
	 * if(optional.isPresent()) { return optional.get().getFiledata(); } return
	 * null; }
	 */
	// upload file
//	@Override
//	public void uploadFile(Long customerid, MultipartFile file)throws IOException;
//	Optional<Customer> optional = customerapplyrepository.findById(customerid);
//	if(optional.isPresent) {
//		Customer customer = optional.get();
//		customer.setFiledata(file.getBytes());
//		customer.setFilename(file.getFilename());
//		customer.setFiletype(file.getFiletype());
//		customerapplyrepository.save(customer);
//		}
   @Override 
   public void downloadFile(Long customerid, HttpServletResponse response) throws IOException{
	   Optional<Customer> optional = customerapplyrepository.findById(customerid);
	   if(optional.isPresent()) {
		   Customer customer = optional.get();
		   byte[] fileData = customer.getFiledata();
		   if(fileData != null && fileData.length > 0) {
			   response.setContentType(customer.getFiletype());
			   response.setHeader("Content-Disposition", "attachment; filename=\"" + customer.getFilename() +"\"");
			   response.getOutputStream().write(fileData);
               response.getOutputStream().flush();
		   } else {
               response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
           }
	   } else {
           response.sendError(HttpServletResponse.SC_NOT_FOUND, "Customer not found");
       } 	 	
   }
@Override
public void uploadFile(Long customerid, MultipartFile file) throws IOException {
	// TODO Auto-generated method stub
	
}
	  
}
