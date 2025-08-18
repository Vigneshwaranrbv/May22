package com.example.May22.service;

import org.springframework.web.multipart.MultipartFile;

public interface CustomerDocumentService {

	void uploadReport(Long customerid, Long surveyorid, MultipartFile file, String status) throws Exception;

}
