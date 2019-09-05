package ar.com.santander.tecnologia.examen.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ar.com.santander.tecnologia.examen.model.Customer;

public interface CustomerService {

	
	public List<Customer> getCustomers();
}
