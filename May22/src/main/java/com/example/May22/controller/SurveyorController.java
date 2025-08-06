package com.example.May22.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.May22.entity.Surveyor;
import com.example.May22.service.SurveyorService;

@Controller
@RequestMapping("/ss")
public class SurveyorController {

	@Autowired
	SurveyorService surveyorservice;
	//--------------------------------start register----------------------------//
	@GetMapping("/surveyor")
	public String showform(Model model) {
		model.addAttribute("surveyor", new Surveyor());
		return "Surveyor";
	}

	@PostMapping("/surveyor")
	public String saveSurveyorFromJsp(@ModelAttribute("surveyor") Surveyor surveyor) {
		surveyorservice.saveSurveyor(surveyor);
		return "redirect:/ss/Surveyorlogin";
	}
	//--------------------------------start login----------------------------//
	@GetMapping("/Surveyorlogin")
	public String showForm(Model model) {
		model.addAttribute("Surveyor", new Surveyor());
		return "Surveyorlogin";
	}

	@PostMapping("/login")
	public String Login(@RequestParam String email, @RequestParam String password, @RequestParam String role,
			Model model) {

		Surveyor surveyor = surveyorservice.surveyorlogin(email, password, role.toLowerCase());

		if (surveyor != null) {
			model.addAttribute("message", "Login successful!");
			model.addAttribute("surveyor", surveyor);
			System.out.println("Login success for: " + surveyor.getEmail() + ", role: " + surveyor.getRole());
			return "Surveyor_home"; // Surveyor home page
		} else {
			model.addAttribute("error", "Invalid email or password");
			System.out.println("Login failed: " + email);
			return "Surveyorlogin"; // Back to login page
		}
		
	}
}
