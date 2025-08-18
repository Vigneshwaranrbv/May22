package com.example.May22.service;

import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.May22.entity.Customer;
import com.example.May22.entity.CustomerDocument;
import com.example.May22.entity.Surveyor;
import com.example.May22.repository.CustomerApplyRepository;
import com.example.May22.repository.CustomerDocumentRepository;
import com.example.May22.repository.SurveyorRepository;
@Service
public class CustomerDocumentImpl implements CustomerDocumentService{
	
	@Autowired 
	private CustomerApplyRepository customerapplyrepository;
	
	@Autowired
	private SurveyorRepository surveyorrepository;

    @Autowired 
    private CustomerDocumentRepository customerdocumentrepository;
    
	@Override
    public void uploadReport(Long customerid, Long surveyorid, MultipartFile file, String survstatus) throws Exception {

        Optional<Customer> customerOpt = customerapplyrepository.findById(customerid);
        Optional<Surveyor> surveyorOpt = surveyorrepository.findById(surveyorid);

        if (customerOpt.isEmpty() || surveyorOpt.isEmpty()) {
            throw new Exception("Invalid customer or surveyor ID");
        }
        

        CustomerDocument cd = new CustomerDocument();
        cd.setCustomer(customerOpt.get());
        cd.setSurveyor(surveyorOpt.get());
        cd.setFilename(file.getOriginalFilename());
        cd.setFiletype(file.getContentType());
        cd.setFiledata(file.getBytes());
        cd.setUploadDate(LocalDateTime.now());
        cd.setsurvStatus(survstatus);
        customerdocumentrepository.save(cd);
     
        //Surveyor assign update the customer status 
        Customer customer = customerOpt.get();
        customer.setStatus("Document Uploaded");
        customerapplyrepository.save(customer);
	}
}
