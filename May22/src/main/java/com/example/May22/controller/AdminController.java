package com.example.May22.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.May22.entity.Admin;
import com.example.May22.service.AdminService;

@Controller
@RequestMapping("/sss")
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	//--------------------------------start register----------------------------//
	@GetMapping("/admin")
	public String showform(Model model) {
		model.addAttribute("admin", new Admin());
		return "Admin";
	}

	@PostMapping("/admin")
	public String saveAdminFromJsp(@ModelAttribute("admin") Admin admin) {
		adminservice.saveAdmin(admin);
		return "redirect:/sss/Adminlogin";
	}
	//--------------------------------start login----------------------------//
	@GetMapping("/Adminlogin")
	public String showForm(Model model) {
		model.addAttribute("Admin", new Admin());
		return "Adminlogin";
	}

	@PostMapping("/login")
	public String Login(@RequestParam String email, @RequestParam String password, @RequestParam String role,
			Model model) {

		Admin admin = adminservice.adminlogin(email, password, role.toLowerCase());

		if (admin != null) {
			model.addAttribute("message", "Login successful!");
			model.addAttribute("admin", admin);
			System.out.println("Login success for: " + admin.getEmail() + ", role: " + admin.getRole());
			return "Admin_home"; // Surveyor home page
		} else {
			model.addAttribute("error", "Invalid email or password");
			System.out.println("Login failed: " + email);
			return "Adminlogin"; // Back to login page
		}
	}
}
