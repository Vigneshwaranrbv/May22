package com.example.May22.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.Customer;
import com.example.May22.entity.Surveyor;

public interface AdminAllocateSurveyorService {
	
	List<Surveyor> getAllSurveyors();
	
    Customer getCustomerById(Long customerid);
    
   // byte[] getClaimFile(Long customerid);
    //Upload file
    void uploadFile(Long customerid, MultipartFile file) throws IOException;
    
    void downloadFile(Long customerid, HttpServletResponse response) throws IOException;
    
    //This code assign surveyor    
    void assignSurveyorToCustomer(Long customerid, Long id);
    
}