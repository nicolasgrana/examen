package ar.com.santander.tecnologia.examen.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.com.santander.tecnologia.examen.model.Customer;
import ar.com.santander.tecnologia.examen.service.CustomerService;


@Controller
public class CustomersController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/getCustomers", method = RequestMethod.GET)
	private ModelAndView showCustomers() {
		List<Customer> c = customerService.getCustomers();
		ModelAndView mav = new ModelAndView("customers");
		mav.addObject("customers", c);
		return mav;
	}
	
}