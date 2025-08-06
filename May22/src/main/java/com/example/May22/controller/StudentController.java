package com.example.May22.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.May22.entity.Student;
import com.example.May22.service.StudentService;

@Controller
@RequestMapping("/s")
public class StudentController {

	@Autowired
	private StudentService studentservice;

	// ----------This For JSP Integration create,update,delete,
	// ------------------------
	@GetMapping("/student")
	public String showform(Model model) {
		// System.out.println(getfirstname(student));
		model.addAttribute("student", new Student());
		return "student";
	}

	@PostMapping("/student")
	public String saveStudentFromJsp(@ModelAttribute("student") Student student) {
		studentservice.saveStudent(student);
		return "redirect:/s/Customerlogin";
	}

	// Just view Option only single Id for particular user
	@GetMapping("/register-view/{id}")
	public String getStudent(@PathVariable("id") Long id, Model model) {
		Student registerview = studentservice.getStudentById(id);
		if (registerview != null) {
			// System.out.println("Student found: " + registerview.getfirstname());
			List<Student> oneStudentList = List.of(registerview); // Java 9+
			model.addAttribute("Registerviews", oneStudentList); // 👈 JSP expects this
		} else {
			model.addAttribute("Registerviews", new ArrayList<>()); // Empty list
			model.addAttribute("nodata", "Not found for Your ID.");
		}
		return "Registerview";
	}

	// This edit customer data
	@GetMapping("/register-edit/{id}")
	public String showEditForm(@PathVariable("id") Long id, Model model) {
		Student student = studentservice.getStudentById(id);
		model.addAttribute("student", student);
		return "Editcustomer"; // editStudent.jsp or editStudent.html (your edit form page)
	}

	@PostMapping("/update")

	// Delete Customer Id
	@GetMapping("/register-delete/{id}")
	public String deleteStudent(@PathVariable Long id, Model model) {
		studentservice.deleteStudent(id);
		// List<Student> student = studentservice.getAllStudents();
		model.addAttribute("Registerviews", null);
		model.addAttribute("nodata", "No Data Found");		
		return "student";
	}

	// ----------------------------------------- END
	// ------------------------------------------------//
	// ------------------------------ Start Login-----------------------------//
	// Show Login Page
	@GetMapping("/Customerlogin")
	public String showLoginPage() {
		return "Customerlogin"; // JSP page
	}

	@PostMapping("/login")
	public String doLogin(@RequestParam String email, @RequestParam String password, @RequestParam String role,
			Model model) {

		Student student = studentservice.login(email, password, role.toLowerCase());

		if (student != null) {
			model.addAttribute("message", "Login successful!");
			model.addAttribute("student", student);
			System.out.println("Login success for: " + student.getEmail() + ", role: " + student.getRole());
			return "Customer_home"; // Customer home page
		} else {
			model.addAttribute("error", "Invalid email or password");
			System.out.println("Login failed" + email);
			return "Customerlogin"; // Back to login page
		}

	}

	// ---------------------------------------Login
	// End---------------------------------//
	// --------------------------------Home page--------------------------------//
	@GetMapping("/index")
	public String home() {
		return "index";
	}

	// ----------------------------Admin Home
	// Page--------------------------------------//
	@GetMapping("/admin_home")
	public String adminhome() {
		return "Admin_home";
	}

	// ---------------------------- Customer Home
	// Page------------------------------------------//
	@GetMapping("/customer_home")
	public String customerhome() {
		return "Customer_home";
	}

	// --------------------------- Surveyor Home Page
	// ----------------------------------------//
	@GetMapping("/surveyor_home")
	public String surveyorhome() {
		return "Surveyor_home";
	}
// ----------------- For Postman (JSON API) ----------------

	@PostMapping("/submit-student")
	public String submitForm(@RequestBody Student student, Model model) {
		System.out.println(student.getPhone());
		studentservice.saveStudent(student);
		model.addAttribute("message", "student data save successfully!");
		return "student";
	}

	@GetMapping("/get-student/{id}")
	@ResponseBody
	public Student getStudent(@PathVariable Long id) {
		return studentservice.getStudentById(id);
	}

	@GetMapping("/get-allstudent")
	@ResponseBody
	public List<Student> getAllStudents() {
		return studentservice.getAllStudents();
	}

	@DeleteMapping("/delete-student/{id}")
	@ResponseBody
	public String deleteStudent(@PathVariable Long id) {
		studentservice.deleteStudent(id);
		return "Student deleted with ID: " + id;
	}

	@PutMapping("/put-student/{id}")
	@ResponseBody
	public Student updateStudent(@PathVariable Long id, @RequestBody Student student) {
		return studentservice.updateStudent(id, student);
	}

}
