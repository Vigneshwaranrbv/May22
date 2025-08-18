package com.example.May22.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.May22.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Long> 
{
   Optional<Student> findByEmailAndPasswordAndRoleIgnoreCase(String email, String password, String role);	

}