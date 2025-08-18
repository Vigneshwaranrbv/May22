package com.example.May22.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.May22.entity.Student;
import com.example.May22.repository.StudentRepository;

@Service
public class StudentImpl implements StudentService {

	@Autowired
	private StudentRepository studentRepository;
	//-----------------------------------------Register--------------------------------------//
	//post data
	@Override
	public Student saveStudent(Student student) {
		return studentRepository.save(student);
	}
	
	//get data
	@Override
    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    //get AllData
	@Override
	public List<Student> getAllStudents() {
		return studentRepository.findAll();
	}
	// Delete Data
	@Override
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }
	// Put data
	 @Override
	    public Student updateStudent(Long id, Student student) {
	        Optional<Student> existingStudent = studentRepository.findById(id);
	        if (existingStudent.isPresent()) {
	            Student s = existingStudent.get();
	            s.setFirstname(student.getfirstname());
	            s.setLastname(student.getlastname());
	            s.setEmail(student.getEmail());
	            s.setPassword(student.getPassword());
	            s.setPhone(student.getPhone());
	            s.setRole(student.getRole());
	            return studentRepository.save(s);
	        }
	        return null;
	    }
	//-------------------------------------------End Register----------------------------------------//
	                 //----------------------- Start Login-------------------------//
	 @Override
	 public Student login(String email, String password, String role) {
		 return studentRepository.findByEmailAndPasswordAndRoleIgnoreCase(email, password,role).orElse(null);
	 }
}
