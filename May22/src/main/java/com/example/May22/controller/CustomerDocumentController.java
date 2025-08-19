package com.example.May22.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.service.CustomerDocumentService;

@Controller
@RequestMapping("/cs")
public class CustomerDocumentController {
	
	@Autowired
	private CustomerDocumentService customerdocumentservice;
	
	@PostMapping("/upload")
    public String uploadReport(
            @RequestParam("customerid") Long customerid,
            @RequestParam("surveyorid") Long surveyorid,
            @RequestParam("file") MultipartFile file,
            @RequestParam("survstatus") String survstatus, Model model) {
        try {
            customerdocumentservice.uploadReport(customerid, surveyorid, file, survstatus);
            model.addAttribute("message","Document upload successfully");
        } catch (Exception e) {
        	System.out.println("Hi hello");
        	System.out.println("Good morning");
        	System.out.println("Good afternoon");

        	System.out.println("I am vigneshwaran");
        	System.out.println(" from chinnasalem");
        	System.out.println(" gratuted BE");
        	
        	System.out.println("add more line");
            model.addAttribute("error","Error upload report:"+e.getMessage());
        }
        return "Surveyor_home";
    }
}
