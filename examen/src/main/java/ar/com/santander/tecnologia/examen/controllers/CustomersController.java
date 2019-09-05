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
	private ModelAndView pantallaHome() {
		List<Customer> c = customerService.getCustomers();
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("customers", c);
		return mav;
	}
	
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	private ModelAndView getCustomers(
//			@RequestParam(value="error", required=false) boolean error,
//			@RequestParam(value="logout", required=false) boolean logout) {
//		ModelAndView mav = new ModelAndView(Constants.LOGIN_VIEW);
//		mav.addObject("loginRequest", new LoginRequest());
//		if(error) {
//			mav.addObject(Constants.MESSAGE_ERROR, PropertiesConfiguration.getProperty(Mensajes.ERROR_VERIFICAR_DATOS));
//		}else if(logout) {
//			mav.addObject(Constants.MESSAGE, PropertiesConfiguration.getProperty(Mensajes.LOGOUT_OK));
//		}
//		return mav;
//	}
}