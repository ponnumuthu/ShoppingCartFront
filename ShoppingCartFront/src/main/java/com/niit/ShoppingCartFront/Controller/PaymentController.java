package com.niit.ShoppingCartFront.Controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcartback.dao.CartDAO;
import com.niit.shoppingcartback.dao.CreditCardDAO;
import com.niit.shoppingcartback.dao.ProductDAO;
import com.niit.shoppingcartback.dao.ShippingAddressDAO;
import com.niit.shoppingcartback.dao.UserDAO;
import com.niit.shoppingcartback.model.Cart;
import com.niit.shoppingcartback.model.CreditCard;
import com.niit.shoppingcartback.model.ShippingAddress;
import com.niit.shoppingcartback.model.User;

@Controller
@SessionAttributes("username")
public class PaymentController {

	
	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired(required = true)
	private UserDAO userDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private Cart cart;
	
	@Autowired
	private CreditCardDAO creditCardDAO;
	
	@Autowired 
	private CreditCard creditCard;
	
	@Autowired
	private ShippingAddressDAO shippingAddressDAO;
	
	
	@RequestMapping("/Proceed/{username}")
	public ModelAndView Proceed (@PathVariable("username") String username){
		
		ShippingAddress shippingAddress = shippingAddressDAO.get(username);
		
		List<ShippingAddress> shippingAddresses = shippingAddressDAO.list(shippingAddress.getId());
				
		ModelAndView mv = new ModelAndView("/success");
		mv.addObject("shippingAddresses", shippingAddresses);
		mv.addObject("isPlaceOrderClicked", true);
		
		
		return mv;		
	}
	
	@RequestMapping("/paymentMethod/{username}")
	public ModelAndView paymentMethod(@PathVariable("username") String username){
		
		return null;
		
	}
	
	@RequestMapping("/onLinePayment/{username}")
	public ModelAndView OnLinePayment(@PathVariable("username") String username)
	{
		User user = userDAO.get(username);		
		
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("onLinePaymentClicked", true);
		return mv;
	}
	
	
	@RequestMapping("/cardPayment/{username}")
	private  String cardPayment(@ModelAttribute CreditCard creditCard, @PathVariable ("username") String username){
		
		creditCardDAO.saveOrUpdate(creditCard);
		
		return "redirect:/cashOnDelivery/{username}";
	}
	
	
	@RequestMapping("/cashOnDelivery/{username}")
	public ModelAndView cashOnDelivery(@PathVariable("username") String username)
	{
		User user = userDAO.get(username);
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("User", user);
		mv.addObject("cashOnDeliveryClicked", true);
		
		return mv;
	}
	@RequestMapping("/shiipingAddess/{username}")
	public ModelAndView shippingAdresss(@ModelAttribute ShippingAddress shippingAddress, @PathVariable ("username") String username){
		
		User user = userDAO.get(username);
		shippingAddress.setId(user.getId());
		shippingAddressDAO.saveOrUpdate(shippingAddress);
		
		Random t = new Random();
		int day = t.nextInt(7);
		
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("ProductDelivered", true);
		mv.addObject("User", user);
		mv.addObject("day", day);
		return mv;
		
	}
	
	
	
	@ModelAttribute
	public void commonObject(Model model){	
		
		model.addAttribute("isLoggedInUser", true);
		String message = "You Have Successfully Logged In";
		model.addAttribute("msg", message);
	}
}
