package com.example.May22.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.May22.entity.Student;
import com.example.May22.entity.Surveyor;
import com.example.May22.repository.SurveyorRepository;

@Service
public class SurveyorImpl implements SurveyorService{

	@Autowired
	private SurveyorRepository surveyorRepository;
	//----------------------start register------------------//
	@Override
	public Surveyor saveSurveyor(Surveyor surveyor) {
		return surveyorRepository.save(surveyor);
	}
	
	//-------------------Start login----------------------------// 
	 @Override
	 public Surveyor surveyorlogin(String email, String password, String role) {
		 return surveyorRepository.findByEmailAndPasswordAndRoleIgnoreCase(email, password,role);
	 }
	
	
}
