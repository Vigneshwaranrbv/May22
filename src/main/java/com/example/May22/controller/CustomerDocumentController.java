package com.example.May22.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.service.CustomerDocumentService;

@Controller
public class CustomerDocumentController {
	
	@Autowired
	private CustomerDocumentService customerdocumentservice;
	
	@PostMapping("/upload")
    public String uploadReport(
            @RequestParam("customerid") Long customerid,
            @RequestParam("surveyorid") Long surveyorid,
            @RequestParam("file") MultipartFile file,
            @RequestParam("status") String status) {
        try {
            customerdocumentservice.uploadReport(customerid, surveyorid, file, status);
            System.out.println("hi hello");
            System.out.println("this vignesh");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Surveyor_home";
    }
}
