package com.example.May22.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.May22.entity.Student;
import com.example.May22.repository.StudentRepository;


public interface StudentService {
	//-------------Register---------------//
	
	Student saveStudent(Student student);

	Student getStudentById(Long id); 
	
	List<Student> getAllStudents();
	
	void deleteStudent(Long id);
	
	Student updateStudent(Long id, Student student);
	//---------------Login-------------------//
	Student login(String email, String password, String role);
}
