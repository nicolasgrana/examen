package ar.com.santander.tecnologia.examen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import ar.com.santander.tecnologia.examen.dao.CustomerDAO;
import ar.com.santander.tecnologia.examen.model.Customer;
import ar.com.santander.tecnologia.examen.service.CustomerService;

@Component
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDAO customerDAO;
	
	@Override
	public List<Customer> getCustomers() {
		return customerDAO.getAllCustomers();
	}

}
