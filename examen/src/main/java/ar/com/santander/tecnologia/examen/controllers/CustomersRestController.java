package ar.com.santander.tecnologia.examen.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ar.com.santander.tecnologia.examen.model.Customer;
import ar.com.santander.tecnologia.examen.service.CustomerService;


@RestController
public class CustomersRestController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/getRestCustomers", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<Customer> showCustomers() {
		List<Customer> c = customerService.getCustomers();
		return c;
	}
	
}