package com.example.May22.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.repository.StudentRepository;
import com.example.May22.service.CustomerDocumentService;

@Controller
@RequestMapping("/sr")
public class CustomerDocumentController {
	
	@Autowired
	private CustomerDocumentService customerdocumentservice;
	
	@PostMapping("/upload")
    public String uploadReport(
            @RequestParam("customerid") Long customerid,
            @RequestParam("surveyorid") Long surveyorid,
            @RequestParam("filedata") MultipartFile filedata,
            @RequestParam("status") String status) {
        try {
        	/*K
        	 *KA
        	 * KAN
        	 * KANI
        	 * KANIS
        	 * KANISH
        	 * KANISHK
        	 * KANISHKA
        	 * */
        	
            customerdocumentservice.uploadReport(customerid, surveyorid, filedata, status);
		 } catch (Exception e) {
            e.printStackTrace();
        }
        return "Surveyor_home";
    }
}
