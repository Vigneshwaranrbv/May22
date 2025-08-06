package com.example.May22.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.May22.entity.Customer;
import com.example.May22.entity.Surveyor;
import com.example.May22.service.AdminAllocateSurveyorService;

@Controller
@RequestMapping("/aas")
public class AdminAllocateSurveyorController {

	@Autowired
	private AdminAllocateSurveyorService adminallocatesurveyorservice;

	@GetMapping("/show_surveyor")
	public String adminAllocate(@RequestParam("customerid") Long customerid, @RequestParam("policyId") Long policyId,
			@RequestParam("customername") String customername, Model model) {

		Customer customer = adminallocatesurveyorservice.getCustomerById(customerid);
		model.addAttribute("customer", customer);
		model.addAttribute("customerid", customerid);
		model.addAttribute("policyId", policyId);
		model.addAttribute("customername", customername);

		List<Surveyor> surveyors = adminallocatesurveyorservice.getAllSurveyors();
		model.addAttribute("surveyors", surveyors);
		// System.out.println("Surveyors:" + surveyors + "ID:");
		// System.out.println("CustomerID:" + customerid);
		return "Admin_view_popup";
	}

	@PostMapping("/assign")
	public String assingSurveyor(@RequestParam("customerid") Long customerid, @RequestParam("surveyorid") Long surveyorid) {
		adminallocatesurveyorservice.assignSurveyorToCustomer(customerid, surveyorid);
		return "Admin_home";
	}
	@GetMapping("/downloadfile")
	public void downloadFile(@RequestParam("customerid") Long customerid, HttpServletResponse response) throws IOException{
		adminallocatesurveyorservice.downloadFile(customerid, response);
	}
}