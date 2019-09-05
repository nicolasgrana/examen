package ar.com.santander.tecnologia.examen.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import ar.com.santander.tecnologia.examen.dao.CustomerDAO;
import ar.com.santander.tecnologia.examen.model.Customer;

@Component
@Repository
public class CustomerDaoImpl implements CustomerDAO{

	
	
	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
//		return null;
		return getCustomersDummy();
	}
	
	
	private List<Customer> getCustomersDummy(){
		List<Customer> customers = new ArrayList<Customer>();
		Customer customer = new Customer(1, "Juan");
		customers.add(customer);
		return customers;
	}

}
