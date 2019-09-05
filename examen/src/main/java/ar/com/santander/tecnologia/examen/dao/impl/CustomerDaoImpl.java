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
//		return null;
		return getCustomersDummy();
	}
	
	
	private List<Customer> getCustomersDummy(){
		List<Customer> customers = new ArrayList<Customer>();
		Customer customer = new Customer(1, "Juan");
		Customer customer2 = new Customer(2, "Laura");
		Customer customer3 = new Customer(3, "Diego");
		customers.add(customer);
		customers.add(customer2);
		customers.add(customer3);
		return customers;
	}

}
