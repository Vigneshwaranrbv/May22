package com.example.May22.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.May22.entity.Customer;
import com.example.May22.service.CustomerApplicationService;

@Controller
@RequestMapping("/sr")
public class SurveyorViewRequestController {
	
	@Autowired
	CustomerApplicationService customerapplicationservice;

	@GetMapping("/surveyor")
	public String home() {
		return "Surveyor_home";
	}
	
	@GetMapping("/viewrequest")
	public String showCustomerList(Model model) {
		List<Customer> viewclaim = customerapplicationservice.getallSurveyor();
		model.addAttribute("viewclaims", viewclaim);
		return "Surveyor_view_claimrequest";
	}
	@GetMapping("/viewpopup")
	public String getPopup(@RequestParam("customerid") Long customerid, 
			               @RequestParam("surveyorid") Long surveyorid, Model model) {
		model.addAttribute("customerid", customerid);
		model.addAttribute("surveyorid", surveyorid);
		return "Surveyor_upload_popup";
	}
}
