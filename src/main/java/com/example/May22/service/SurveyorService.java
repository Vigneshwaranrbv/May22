package com.example.May22.service;

import com.example.May22.entity.Surveyor;

public interface SurveyorService {

     Surveyor saveSurveyor(Surveyor surveyor);

	 Surveyor surveyorlogin(String email, String password, String role);
}
